from tortoise import Model

from line_provider.db.dao.base import BaseDAO, T
from line_provider.db.models.event import EventModel, EventState


class EventDAO(BaseDAO[EventModel]):
    _model: Model = EventModel


__all__ = [
    "EventDAO",
]
