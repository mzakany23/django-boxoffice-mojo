FROM python:3.11-slim

WORKDIR /app

# install build deps for psycopg2
RUN apt-get update \
    && apt-get install -y build-essential libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

# Entrypoint script
ENTRYPOINT ["sh", "./docker-entrypoint.sh"]
