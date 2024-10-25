from pydantic import AmqpDsn, Field
from pydantic_settings import BaseSettings


class RabbitMQSettings(BaseSettings):
    url: AmqpDsn = Field(..., alias="RABBITMQ_URL")
    publish_queue: str = Field(..., alias="PUBLISH_QUEUE")


__all__ = [
    "RabbitMQSettings",
]
