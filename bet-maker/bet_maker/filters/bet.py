from pydantic import BaseModel


class BetFilter(BaseModel):
    state: None = None


__all__ = [
    "BetFilter",
]
