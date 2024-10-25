FROM python:3.10-slim
LABEL authors="ilyaverb"

RUN apt-get update && apt-get install -y \
    curl \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="/root/.local/bin:$PATH"
ENV POETRY_VIRTUALENVS_CREATE=false

WORKDIR /app

COPY pyproject.toml ./

RUN poetry install --no-root --no-interaction --no-ansi

COPY . .

RUN chmod +x /app/scripts/aerich.sh

EXPOSE 8000

CMD ["uvicorn", "line_provider.main:app", "--host", "0.0.0.0", "--port", "8000"]
