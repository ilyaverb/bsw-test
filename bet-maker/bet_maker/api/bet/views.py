from datetime import datetime, timezone
from typing import Type

from fastapi import APIRouter, Request, Depends
from starlette import status
from tortoise.transactions import atomic

from bet_maker.db.dao.bet import BetDAO
from bet_maker.middleware.exceptions import EventNotAllowedError
from bet_maker.schemas.bet import BetOutputDTO, BetInputDTO
from bet_maker.schemas.pagination import PaginatedRequest, PaginatedResponse
from bet_maker.services.line_provider.lineprovider import LineProviderService

router = APIRouter(prefix="/bets", tags=["bets"])


@router.get("/", response_model=PaginatedResponse[BetOutputDTO], status_code=status.HTTP_200_OK)
async def get_all(
    request: Request,
    pagination: PaginatedRequest = Depends(),
) -> PaginatedResponse[Type[BetOutputDTO]] | list[Type[BetOutputDTO]]:
    bet_qs = BetDAO.all()

    return await PaginatedResponse.resolve_pagination(
        queryset=bet_qs,
        schema=BetOutputDTO,
        skip=pagination.skip,
        limit=pagination.limit
    )


@router.post("/")
@atomic()
async def create(
    request: Request,
    schema: BetInputDTO,
) -> BetOutputDTO:
    event = await LineProviderService.get_event_by_id(schema.event_id)
    if datetime.now(timezone.utc) > event.deadline:
        raise EventNotAllowedError("No bets are accepted on this event")

    return await BetOutputDTO.from_tortoise_orm(
        await BetDAO.create(**schema.model_dump(), event_state=event.state)
    )


__all__ = [
    "router",
]
