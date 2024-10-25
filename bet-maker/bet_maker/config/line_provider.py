from pydantic import AnyHttpUrl, Field
from pydantic_settings import BaseSettings


class LineProviderSettings(BaseSettings):
    events_endpoint: AnyHttpUrl = Field(..., alias="EVENTS_ENDPOINT")

__all__ = [
    "LineProviderSettings",
]
