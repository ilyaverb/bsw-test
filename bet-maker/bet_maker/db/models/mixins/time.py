from tortoise.models import Model
from tortoise import fields


class TimeStampMixin(Model):
    created_at = fields.DatetimeField(auto_now_add=True, null=True)
    updated_at = fields.DatetimeField(auto_now=True, null=True)

    class Meta:
        abstract = True


__all__ = [
    "TimeStampMixin",
]
