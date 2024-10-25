from pydantic import BaseModel, UUID4

from line_provider.db.models.event import EventState


class Message(BaseModel):
    event_id: UUID4
    state: EventState


__all__ = [
    "Message",
]
