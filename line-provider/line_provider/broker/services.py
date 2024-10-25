from line_provider.broker.message import Message
from line_provider.broker.rabbitmq import rabbitmq_manager
from line_provider.config import settings


async def send_event_state_change(message: Message) -> None:
    try:
        await rabbitmq_manager.publish(message, settings.rabbitmq.publish_queue)
    finally:
        await rabbitmq_manager.disconnect()


__all__ = [
    "send_event_state_change",
]
