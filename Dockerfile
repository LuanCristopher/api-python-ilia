# Estágio 1: dependências
FROM python:3.9-slim-buster AS builder
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Estágio 2: imagem final
FROM python:3.9-slim-buster
WORKDIR /app
ENV PYTHONUNBUFFERED=1
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY main.py .
EXPOSE 8080
CMD ["python", "main.py"]
