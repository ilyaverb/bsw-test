import json

import aio_pika
from aio_pika import IncomingMessage
from tortoise.transactions import in_transaction

from bet_maker.broker.message import EventMessage
from bet_maker.db.dao.bet import BetDAO
from bet_maker.db.models.bet import BetState
from bet_maker.schemas.bet import STATES_MATCHING
from bet_maker.schemas.event import EventState
from bet_maker.config import settings


class BetConsumer:

    def __init__(self, url):
        self.url = url
        self.connection = None
        self.channel = None
        self.queue = None

    async def connect(self, queue_name):
        self.connection = await aio_pika.connect_robust(self.url)
        self.channel = await self.connection.channel()
        self.queue = await self.channel.declare_queue(queue_name, durable=True)

    async def process_message(self, message: IncomingMessage) -> None:
        async with message.process():
            try:
                message_data = json.loads(message.body)
                event_msg = EventMessage(**message_data)
                bet_state = STATES_MATCHING.get(event_msg.state)

                async with in_transaction():
                    await BetDAO.filter(event_id=event_msg.event_id).update(state=bet_state)

            except Exception as e:
                raise e

    async def consume(self, queue_name):
        await self.connect(queue_name)

        await self.queue.consume(self.process_message)

    async def disconnect(self) -> None:
        if self.connection:
            await self.connection.close()


bet_consumer = BetConsumer(str(settings.rabbitmq.url))

__all__ = [
    "bet_consumer",
]
