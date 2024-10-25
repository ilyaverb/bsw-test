from bet_maker.db.models.bet import BetModel, BetState
from bet_maker.db.dao.base import BaseDAO, T
from bet_maker.schemas.event import EventState
from bet_maker.schemas.bet import STATES_MATCHING


class BetDAO(BaseDAO[BetModel]):
    _model = BetModel

    @classmethod
    async def create(cls, *args, event_state: EventState = None, **kwargs) -> T:
        if isinstance(event_state, EventState):
            bet_state = _state if (_state:=STATES_MATCHING.get(event_state)) is not None else BetState.NOT_FINISHED
            kwargs.update({"state": bet_state})
        return await super().create(*args, **kwargs)


__all__ = [
    "BetDAO",
]
