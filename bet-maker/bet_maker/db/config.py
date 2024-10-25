from bet_maker.config import settings

MODELS_MODULES: set[str] = {
    "bet_maker.db.models.bet"
}

TORTOISE_CONFIG = {
    "connections": {
        "default": str(settings.db.uri)
    },
    "apps": {
        "models": {
            "models": list(MODELS_MODULES) + ["aerich.models"]
        }
    }
}

__all__ = [
    "TORTOISE_CONFIG",
]
