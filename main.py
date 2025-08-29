from flask import Flask, jsonify
from prometheus_flask_exporter import PrometheusMetrics
import os

app = Flask(__name__)

# Expondo métricas padrão + HTTP metrics em /metrics
metrics = PrometheusMetrics(app)
# métrica de "versão" do app
metrics.info("app_info", "Informações da aplicação", version="1.0.0", env=os.getenv("ENV", "dev"))

@app.route("/")
def hello():
    return "Olá, Ilia! Meu microserviço Python está rodando no EKS!"

# Endpoints de saúde
@app.route("/healthz")
def healthz():
    return jsonify(status="ok"), 200

@app.route("/readyz")
def readyz():
    return jsonify(status="ready"), 200

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    # logs sem buffer para o Promtail/Loki capturarem em tempo real
    os.environ["PYTHONUNBUFFERED"] = "1"
    # Flask dev server é suficiente para o desafio (1 worker). Em produção, use gunicorn.
    app.run(host="0.0.0.0", port=port, debug=False)
    #trigger1
