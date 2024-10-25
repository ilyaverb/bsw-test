import enum
from uuid import uuid4

from tortoise import fields

from line_provider.db.models.mixins.time import TimeStampMixin


class EventState(enum.Enum):
    NEW = "1"
    FINISHED_WIN = "2"
    FINISHED_LOSE = "3"


class EventModel(TimeStampMixin):
    id = fields.UUIDField(default=uuid4, pk=True)
    coefficient = fields.DecimalField(
        max_digits=4,
        decimal_places=2,
        default=1.00
    )
    deadline = fields.DatetimeField(null=True)
    state = fields.CharEnumField(
        enum_type=EventState,
        default=EventState.NEW,
        null=False
    )


__all__ = [
    "EventState",
    "EventModel",
]
