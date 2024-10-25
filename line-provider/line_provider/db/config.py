from line_provider.config import settings

MODELS_MODULES: set[str] = {
    "line_provider.db.models.event"
}

TORTOISE_CONFIG = {
    "connections": {
        "default": str(settings.db.url)
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
