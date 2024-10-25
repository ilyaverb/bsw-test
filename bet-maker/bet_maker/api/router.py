from fastapi import APIRouter

from bet_maker.api.bet import router as bet_router
from bet_maker.api.event import router as events_router
from bet_maker.api.healthcheck import router as healthcheck_router

api_router = APIRouter()

api_router.include_router(bet_router)
api_router.include_router(events_router)
api_router.include_router(healthcheck_router)


__all__ = [
    "api_router",
]
