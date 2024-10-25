from http import HTTPStatus

from fastapi import APIRouter, Depends
from starlette.requests import Request

from bet_maker.schemas.event import EventOutputDTO
from bet_maker.schemas.pagination import PaginatedRequest
from bet_maker.services.line_provider.lineprovider import LineProviderService
from bet_maker.schemas.pagination import PaginatedResponse

router = APIRouter(prefix="/events", tags=["events"])


@router.get("/")
async def get_all_allowed(
    request: Request,
    pagination: PaginatedRequest = Depends(),
) -> PaginatedResponse[EventOutputDTO] | HTTPStatus:
    events = await LineProviderService.get_events(
        params=pagination.model_dump(),
    )
    return events


__all__ = [
    "router",
]
