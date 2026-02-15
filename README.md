# uvicorn-fastapi-docker

## Install

Install dependencies (choose one):

```bash
# Install directly with pip
pip install fastapi "uvicorn[standard]"

# Or install from this project (build system required)
pip install .
```

## Run

Start the development server with:

```bash
uvicorn app.main:app --reload
```

Open http://127.0.0.1:8000/ to see the app, and http://127.0.0.1:8000/docs for the OpenAPI docs.

## Docker

Build the image:

```bash
docker build -t uvicorn-fastapi-docker:latest .
```

Run the container (maps port 8000):

```bash
docker run --rm -p 8000:8000 uvicorn-fastapi-docker:latest
```

Or use Docker Compose for local development (bind-mounts source):

```bash
docker compose up --build
```

Notes:
- The `Dockerfile` installs `fastapi` and `uvicorn[standard]` in the image. If you prefer installing from `pyproject.toml`, update the Dockerfile to `pip install .` and ensure a proper `build-system` section is present.
- I can't run Docker here; run the above commands locally to build and start the container.
