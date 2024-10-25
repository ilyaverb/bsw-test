import enum
from datetime import datetime
from decimal import Decimal

from pydantic import UUID4

from bet_maker.schemas.mixins.time import TimeStampMixin


class EventState(enum.Enum):
    NEW = "1"
    FINISHED_WIN = "2"
    FINISHED_LOSE = "3"


class EventOutputDTO(TimeStampMixin):
    id: UUID4
    coefficient: Decimal | None
    deadline: datetime | None
    state: EventState | None


__all__ = [
    "EventState",
    "EventOutputDTO",
]
