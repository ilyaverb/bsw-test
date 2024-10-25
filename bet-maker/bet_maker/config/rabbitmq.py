from pydantic import AmqpDsn, Field
from pydantic_settings import BaseSettings


class RabbitMQSettings(BaseSettings):
    url: AmqpDsn = Field(..., alias="RABBITMQ_URL")
    queue: str = Field(..., alias="QUEUE")


__all__ = [
    "RabbitMQSettings",
]
