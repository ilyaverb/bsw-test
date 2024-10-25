import enum
from uuid import uuid4

from tortoise import fields

from bet_maker.db.models.mixins.time import TimeStampMixin


class BetState(enum.Enum):
    NOT_FINISHED = "not_finished"
    WIN = "win"
    LOSE = "lose"


class BetModel(TimeStampMixin):
    id = fields.UUIDField(default=uuid4, pk=True)
    amount = fields.DecimalField(
        max_digits=14,
        decimal_places=2,
    )
    event_id = fields.UUIDField()
    state = fields.CharEnumField(
        enum_type=BetState,
        default=BetState.NOT_FINISHED,
        null=True
    )


__all__ = [
    "BetState",
    "BetModel",
]
