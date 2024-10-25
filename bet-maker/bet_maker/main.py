from contextlib import asynccontextmanager

from fastapi import FastAPI
from tortoise.contrib.fastapi import register_tortoise

from bet_maker.api import api_router
from bet_maker.broker.consumer import bet_consumer
from bet_maker.config.default import settings
from bet_maker.db.config import TORTOISE_CONFIG
from bet_maker.middleware.errors import set_errors


@asynccontextmanager
async def lifespan(app: FastAPI):
    await bet_consumer.consume(settings.rabbitmq.queue)
    yield
    await bet_consumer.disconnect()

app = FastAPI(
    lifespan=lifespan,
    title=settings.app_name,
    description=settings.description,
    version=settings.version,
)

set_errors(app)

register_tortoise(app, config=TORTOISE_CONFIG)

app.include_router(api_router)


__all__ = [
    "app",
]
