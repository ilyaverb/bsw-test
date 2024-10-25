import aio_pika

from line_provider.broker.message import Message
from line_provider.config import settings


class RabbitMQManager:

    def __init__(self, url):
        self.url = url
        self.connection = None
        self.channel = None

    async def connect(self, routing_key: str):
        if not self.connection:
            self.connection = await aio_pika.connect_robust(self.url)
            self.channel = await self.connection.channel()
            await self.channel.declare_queue(routing_key, durable=True)

    async def publish(self, message: Message, routing_key: str):
        await self.connect(routing_key)

        await self.channel.default_exchange.publish(
            aio_pika.Message(
                body=message.model_dump_json().encode()
            ),
            routing_key=routing_key
        )

    async def disconnect(self):
        if self.channel and not self.channel.is_closed:
            await self.channel.close()

        if self.connection and not self.connection.is_closed:
            await self.connection.close()

        self.channel = None
        self.connection = None



rabbitmq_manager = RabbitMQManager(str(settings.rabbitmq.url))

__all__ = [
    "rabbitmq_manager",
]
