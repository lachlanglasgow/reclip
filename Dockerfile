FROM python:3.12-slim

LABEL org.opencontainers.image.source="https://github.com/averygan/reclip"
LABEL org.opencontainers.image.description="ReClip - video downloader"
LABEL org.opencontainers.image.licenses="MIT"

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8099
ENV HOST=0.0.0.0
ENV PORT=80
CMD ["python", "app.py"]
