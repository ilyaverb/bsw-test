from typing import Type

from fastapi import APIRouter, Depends, Request
from pydantic import UUID4
from starlette import status
from tortoise.queryset import QuerySet
from tortoise.transactions import atomic

from line_provider.broker.message import Message
from line_provider.broker.services import send_event_state_change
from line_provider.db.dao.event import EventDAO
from line_provider.filters.event import EventFilter
from line_provider.schemas.event import EventOutputDTO, EventInputDTO, EventStateInputDTO
from line_provider.schemas.pagination import PaginatedRequest, PaginatedResponse

router = APIRouter(prefix="/events", tags=["events"])


@router.get("/", response_model=PaginatedResponse[EventOutputDTO], status_code=status.HTTP_200_OK)
async def get_all(
        request: Request,
        filter_schema: EventFilter = Depends(),
        pagination: PaginatedRequest = Depends(),
) -> PaginatedResponse[Type[EventOutputDTO]] | list[Type[EventOutputDTO]]:
    events_qs: QuerySet = EventDAO.all()

    events_qs = await filter_schema.apply(events_qs)

    return await PaginatedResponse.resolve_pagination(
        queryset=events_qs,
        schema=EventOutputDTO,
        skip=pagination.skip,
        limit=pagination.limit
    )


@router.get("/{event_id:uuid}")
async def get(
        event_id: UUID4,
) -> EventOutputDTO:
    event = await EventDAO.get(id=event_id)
    return await EventOutputDTO.from_tortoise_orm(event)


@router.put("/{event_id:uuid}/set-state")
@atomic()
async def update(
        event_id: UUID4,
        schema: EventStateInputDTO,
) -> EventOutputDTO:
    event = await EventDAO.get(id=event_id)
    event.update_from_dict(schema.model_dump())
    await event.save()
    await send_event_state_change(
        Message(
            event_id=event_id,
            **schema.model_dump()
        )
    )
    return await EventOutputDTO.from_tortoise_orm(event)


@router.post("/")
@atomic()
async def create(
        request: Request,
        schema: EventInputDTO
) -> EventOutputDTO:
    obj = await EventDAO.create(**schema.model_dump())
    return await EventOutputDTO.from_tortoise_orm(obj)


__all__ = [
    "router",
]
