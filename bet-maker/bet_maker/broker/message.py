from pydantic import BaseModel, UUID4

from bet_maker.schemas.event import EventState


class EventMessage(BaseModel):
    event_id: UUID4
    state: EventState


__all__ = [
    "EventMessage",
]
