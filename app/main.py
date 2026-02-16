from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
import os

app = FastAPI()

# Mount static files (CSS, JS, images, etc.)
static_dir = os.path.join(os.path.dirname(__file__), "templates")
app.mount("/static", StaticFiles(directory=static_dir), name="static")


@app.get("/")
async def read_root():
    """Serve the HTML UI"""
    return FileResponse(
        os.path.join(os.path.dirname(__file__), "templates", "index.html"),
        media_type="text/html"
    )


@app.get("/api/message")
async def get_message():
    """API endpoint that returns a JSON message"""
    return {"message": "Hello from FastAPI!", "status": "success"}
