# API Python – Desafio Ília

Este repositório contém uma API simples desenvolvida em **Python (Flask)** para o desafio técnico da Ília.

### Funcionalidades:
- Rota principal retorna: `"Olá Ília"`.
- Endpoints de health check (`/healthz`) e readiness (`/readyz`) para integração com Kubernetes.
- Exposição de métricas compatíveis com Prometheus.

### Deploy:
- A aplicação é empacotada em uma imagem Docker e publicada no **ECR**.
- O deploy no cluster EKS é feito via **Helm**, com gerenciamento de sincronização pelo **ArgoCD**.

### CI/CD:
- A pipeline utiliza **GitHub Actions**:
  - Build e push da imagem para o ECR.
  - Atualização da tag do chart Helm com o **hash do commit**.
- A pipeline **estende** um repositório de **templates de pipelines**, permitindo padronizar steps comuns em diferentes APIs.

---

Esta API foi criada como exemplo para validar o fluxo de deploy, monitoramento e boas práticas no desafio técnico da Ília.
