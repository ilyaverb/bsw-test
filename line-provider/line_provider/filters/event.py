from datetime import datetime

from pydantic import BaseModel
from tortoise.expressions import Q
from tortoise.queryset import QuerySet

from line_provider.db.models.event import EventState, EventModel


class EventFilter(BaseModel):
    state: EventState | None = None
    is_active: bool | None = None

    async def apply(self, queryset: QuerySet) -> QuerySet:
        if self.state is not None:
            queryset = queryset.filter(state=self.state)

        if self.is_active:
            queryset = queryset.filter(
                Q(deadline__isnull=True) | Q(deadline__gt=datetime.now())
            )

        return queryset


__all__ = [
    "EventFilter",
]
