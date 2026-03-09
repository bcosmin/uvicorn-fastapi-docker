# 1. Use a multi-stage build to keep the final image tiny
FROM python:3.11-slim AS builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# 2. Set working directory
WORKDIR /app

# 3. Prevent Python from writing .pyc files and buffer logs
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_COMPILE_BYTECODE=1

# 4. Install dependencies first (for better caching)
# We only copy the configuration files first so changes to your 
# code don't trigger a full re-install of your packages.
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project

# 5. Copy your application code
COPY ./app ./app

# 6. Final Production Stage
FROM python:3.11-slim
WORKDIR /app

# Copy the virtual environment from the builder
COPY --from=builder /app/.venv /app/.venv
COPY ./app ./app
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Ensure the app uses the virtual environment
ENV PATH="/app/.venv/bin:$PATH"

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]