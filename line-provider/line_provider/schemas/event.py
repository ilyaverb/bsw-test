from decimal import Decimal
from datetime import datetime

from pydantic import BaseModel, UUID4, ConfigDict, Field

from line_provider.db.models.event import EventState, EventModel
from line_provider.schemas.mixins.time import TimeStampMixin


class EventInputDTO(TimeStampMixin):
    model_config = ConfigDict(
        orig_model=EventModel,
        use_enum_values=True,
    )
    coefficient: Decimal | None
    deadline: datetime | None
    state: EventState | None = EventState.NEW


class EventStateInputDTO(BaseModel):
    state: EventState = Field(..., alias="new_state")


class EventOutputDTO(EventInputDTO):
    id: UUID4


__all__ = [
    "EventStateInputDTO",
    "EventInputDTO",
    "EventOutputDTO"
]
