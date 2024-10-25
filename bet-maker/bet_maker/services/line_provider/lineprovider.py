from http import HTTPStatus

import httpx

from bet_maker.config import settings
from bet_maker.middleware.exceptions import LineProviderCommunicationError
from bet_maker.schemas.pagination import PaginatedResponse
from bet_maker.schemas.event import EventOutputDTO


class LineProviderService:
    events_url = settings.line_provider.events_endpoint

    @classmethod
    async def get_events(cls, **kwargs) -> PaginatedResponse[EventOutputDTO] | HTTPStatus:
        """Get all allowed events"""
        if (params:=kwargs.get("params")) is not None:
            params.update({"is_active": True})

        async with httpx.AsyncClient() as client:
            response = await client.get(str(cls.events_url), **kwargs)

        if response.status_code != HTTPStatus.OK:
            raise LineProviderCommunicationError(response.json().get("detail"))

        return PaginatedResponse(**response.json())

    @classmethod
    async def get_event_by_id(cls, event_id) -> EventOutputDTO | HTTPStatus:

        async with httpx.AsyncClient() as client:
            response = await client.get(''.join([str(cls.events_url), str(event_id)]))

        if response.status_code != HTTPStatus.OK:
            raise LineProviderCommunicationError(response.json().get("detail"))

        print(response.json())
        return EventOutputDTO(**response.json())


__all__ = [
    "LineProviderService",
]
