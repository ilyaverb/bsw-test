from datetime import datetime

from tortoise.contrib.pydantic.base import PydanticModel


class TimeStampMixin(PydanticModel):
    created_at: datetime | None
    updated_at: datetime | None
