from decimal import Decimal

from pydantic import UUID4, ConfigDict, Field

from bet_maker.db.models.bet import BetModel, BetState
from bet_maker.schemas.mixins.time import TimeStampMixin
from bet_maker.schemas.event import EventState

STATES_MATCHING = {
    EventState.FINISHED_WIN: BetState.WIN,
    EventState.FINISHED_LOSE: BetState.LOSE,
}

class BetInputDTO(TimeStampMixin):
    model_config = ConfigDict(orig_model=BetModel, use_enum_values=True)
    amount: Decimal = Field(ge=0.01, decimal_places=2)
    event_id: UUID4


class BetOutputDTO(BetInputDTO):
    id: UUID4
    state: BetState


__all__ = [
    "STATES_MATCHING",
    "BetInputDTO",
    "BetOutputDTO",
]
