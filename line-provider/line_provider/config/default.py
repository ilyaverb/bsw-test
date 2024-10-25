from dotenv import find_dotenv, load_dotenv
from pydantic import Field
from pydantic_settings import BaseSettings

from line_provider.config.db import DBSettings
from line_provider.config.rabbimq import RabbitMQSettings

load_dotenv(find_dotenv())

class AppSettings(BaseSettings):
    db: DBSettings = Field(default_factory=DBSettings)
    rabbitmq: RabbitMQSettings = Field(default_factory=RabbitMQSettings)
    app_name: str | None = Field("", alias="APP_NAME")
    description: str | None = Field("", alias="DESCRIPTION")
    version: str | None = Field("0.0.1", alias="VERSION")


settings = AppSettings()

__all__ = [
    "AppSettings",
    "settings",
]