from fastapi import HTTPException
from starlette import status


class EventNotAllowedError(HTTPException):
    def __init__(self, msg):
        self.status_code = status.HTTP_400_BAD_REQUEST
        self.detail = msg


class LineProviderCommunicationError(HTTPException):
    def __init__(self, msg):
        self.status_code = status.HTTP_400_BAD_REQUEST
        self.detail = msg


__all__ = [
    "EventNotAllowedError",
    "LineProviderCommunicationError",
]
