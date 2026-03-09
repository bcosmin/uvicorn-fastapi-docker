# uvicorn-fastapi-docker

A modern, high-performance FastAPI application managed by **uv**, featuring automated CI/CD, optimized multi-stage Docker builds, and real-time development syncing.

## 🚀 Getting Started

### 1. Prerequisites

Install [uv](https://docs.astral.sh/uv/getting-started/installation/) to manage your Python environment with maximum speed and reliability.

### 2. Local Development (Native)

Sync your environment and run the app:

```bash
uv sync --all-groups
uv run uvicorn app.main:app --reload
```

- App UI: http://127.0.0.1:8000/
- API Docs: http://127.0.0.1:8000/docs

### 3. Local Development (Docker Compose)

This project uses **Compose Watch** to sync code changes instantly to the container without full rebuilds.

```bash
docker compose up --watch
```

## 🛠 Project Structure

```Plaintext
.
├── app/
│   ├── main.py              # FastAPI application entry point
│   ├── static/              # CSS, JS, and Images
│   └── templates/           # HTML Jinja2 templates
├── .github/workflows/       # GitHub Actions (Pylint CI)
├── pyproject.toml           # Unified Project, Dependencies & Pylint config
├── uv.lock                  # Deterministic dependency lockfile
├── Dockerfile               # Multi-stage optimized production image
└── docker-compose.yml       # Local dev environment with 'watch' mode
```

## 🧪 Quality Control (Pylint)

Linting is automatically enforced via GitHub Actions on every push. The configuration is centralized within `pyproject.toml`.

```bash
uv run pylint $(git ls-files '*.py')
```

- **Custom Rules:** Module docstrings (C0114) are disabled by default to keep the boilerplate minimal.
- **CI Speed:** The workflow uses setup-uv with uv.lock caching for near-instant dependency installs.

## 🐳 Production Deployment

The `Dockerfile` utilizes a multi-stage build to ensure the final production image is lightweight (~120MB). It separates the build-time dependencies from the runtime environment.

### Build the production image:

```bash
docker build -t uvicorn-fastapi-docker:latest .
```

### Run the container:

```bash
docker run --rm -p 8000:8000 uvicorn-fastapi-docker:latest
```

## ✨ Features

- **Lightning Fast:** Powered by `uv` for dependency management and environment isolation.
- **Hot Reloading:** Docker Compose `watch` mode syncs `./app` changes instantly to the container.
- **Clean Configuration:** No `.pylintrc` or `requirements.txt` clutter; all settings live in `pyproject.toml.`

Production Ready: Multi-stage builds ensure that development tools (like Pylint) never leak into your final image.
