FROM python:3.11-slim
WORKDIR /app

# boas práticas p/ logs e bytecode
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# instalar dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copiar a app
COPY . .
EXPOSE 8080

CMD ["python", "main.py"]
