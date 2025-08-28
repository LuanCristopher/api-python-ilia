# Estágio 1: Instala as dependências
FROM python:3.9-slim-buster as builder
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Estágio 2: Imagem final, leve e segura
FROM python:3.9-slim-buster
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY main.py .
EXPOSE 8080
CMD ["python", "main.py"]