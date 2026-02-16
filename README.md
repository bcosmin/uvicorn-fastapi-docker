# uvicorn-fastapi-docker

A modern FastAPI application with a built-in web UI, served via Uvicorn.

## Install

Install dependencies via `uv`:

```bash
uv sync
```

Or manually with pip:

```bash
pip install fastapi "uvicorn[standard]"
```

## Run

Activate the virtual environment and start the development server:

```bash
source .venv/bin/activate
uvicorn app.main:app --reload
```

Open <http://127.0.0.1:8000/> to see the interactive UI, and <http://127.0.0.1:8000/docs> for the OpenAPI docs.

## Project Structure

```
    app/
    ├── main.py              # FastAPI application entry point
    └── templates/
        ├── index.html       # Main UI template
        ├── css/
        │   └── styles.css   # Stylesheet
        └── js/
```

## Features

- **Interactive Web UI** – A responsive, modern interface built with HTML/CSS
- **API Endpoints** – JSON API endpoints ready for extension
- **Auto-reload** – Development server reloads on code changes
- **Docker Support** – Easily containerize and deploy

## Docker

Build the image:

```bash
docker build -t uvicorn-fastapi-docker:latest .
```

Run the container (maps port 8000):

```bash
docker run --rm -p 8000:8000 uvicorn-fastapi-docker:latest
```

Or use Docker Compose for local development:

```bash
docker compose up --build
```

## Notes

- The `Dockerfile` installs `fastapi` and `uvicorn[standard]` in the image.
- CSS and static assets are served from the `/static` directory.
- The API documentation is available at `/docs` (Swagger UI) and `/redoc` (ReDoc).
