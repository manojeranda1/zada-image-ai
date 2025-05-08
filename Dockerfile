
FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

ENV REDIS_HOST=zada-ai_redis:6379
ENV REDIS_PASSWORD=d534e80625a9971e571e
ENV REDIS_PORT=6379

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p static

EXPOSE 5000

CMD ["python", "app.py"]