from fastapi import APIRouter

from line_provider.api.event import router as events_router
from line_provider.api.healthcheck import router as healthcheck_router

api_router = APIRouter()

api_router.include_router(events_router)
api_router.include_router(healthcheck_router)

__all__ = [
    "api_router",
]
