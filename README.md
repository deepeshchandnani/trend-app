# Trend Application – Production Ready DevOps Deployment

## Project Overview

This project demonstrates an **end-to-end production deployment** of a **React-based static application (Trend App)** using **Docker, NGINX, AWS EKS (Kubernetes), Jenkins CI/CD, Terraform, and Prometheus/Grafana monitoring**.

The application is served as **static build files through NGINX**, containerized using Docker, deployed on **AWS EKS**, and fully automated using a **CI/CD pipeline triggered via GitHub webhooks**.

This setup follows **real-world DevOps best practices** by removing unnecessary runtimes (Node.js/npm) from production and using a lightweight, secure web server.

---

## Tech Stack Used

- **Frontend**: React (Pre-built Static Files)
- **Web Server**: NGINX
- **Containerization**: Docker
- **Container Registry**: DockerHub
- **Orchestration**: AWS EKS (Kubernetes)
- **CI/CD**: GitHub → Jenkins Pipeline
- **Infrastructure as Code**: Terraform
- **Monitoring**: Prometheus & Grafana
- **Cloud Provider**: AWS
- **Region**: ap-south-1 (Mumbai)

---

## Repository Structure

├── static/ or build/ # Pre-built React static files
├── k8s/
│ ├── deployment.yaml # Kubernetes Deployment
│ └── service.yaml # Kubernetes LoadBalancer Service
├── terraform/
│ └── main.tf # Infrastructure provisioning
├── Dockerfile # NGINX-based Docker image
├── Jenkinsfile # CI/CD pipeline definition
├── nginx.conf # (Optional) Custom NGINX config
├── .dockerignore
├── .gitignore
└── README.md

Docker Image Build (Local / Jenkins)

The application is served using NGINX, not Node.js.

Dockerfile (NGINX Based)
FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY . /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

Build Docker Image
docker build -t trend-nginx-app .

Docker Image Push to DockerHub

Create DockerHub repository

Authenticate Docker

Tag & push image

🔁 These steps are automatically handled via Jenkins pipeline.

Kubernetes Deployment (AWS EKS)

Apply Kubernetes manifests:

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Deployment Details

Replicas: 2

Container: NGINX serving static files

Port: 80

Service Details

Type: LoadBalancer

Public access enabled

Traffic routed to NGINX pods

Application Access

The application is accessible via AWS LoadBalancer DNS:

http://<load-balancer-dns>


Mapped internally to:

Container Port: 80

CI/CD Pipeline Explanation
Source Stage

GitHub Repository

GitHub Webhook triggers pipeline on every push to main branch

Build Stage (Jenkins)

Pipeline stages:

Clone source code

Build Docker image (NGINX based)

Tag Docker image

Push image to DockerHub

Deploy Stage (Jenkins + kubectl)

Jenkins updates kubeconfig

Applies Kubernetes Deployment

Applies Kubernetes Service

Deploys latest image to EKS cluster

CI/CD Pipeline Flow Diagram
GitHub
  ↓
Jenkins Pipeline
  ↓
Docker Build (NGINX)
  ↓
DockerHub
  ↓
AWS EKS (Kubernetes Deployment)
  ↓
AWS LoadBalancer

Monitoring & Logs
Cluster & Application Monitoring

Monitoring is implemented using Prometheus & Grafana.

Metrics monitored:

Node CPU & memory usage

Pod health & restarts

Application availability

Kubernetes Logs

Pod logs via kubectl logs

NGINX access & error logs

Container stdout/stderr

Kubernetes LoadBalancer Details

Service Type: LoadBalancer

Application Port: 80

External Access: Public

LoadBalancer ARN (Captured During Deployment)
arn:aws:elasticloadbalancing:ap-south-1:xxxx:loadbalancer/app/xxxx


ℹ️ Infrastructure was cleaned up after successful deployment to avoid unnecessary AWS costs.
ARN and screenshots were captured as deployment proof.

Screenshots Included

Jenkins Pipeline (Successful Execution)

DockerHub Image Repository

EKS Cluster & Worker Nodes

Kubernetes Services

Prometheus & Grafana Dashboards

Application Running via LoadBalancer URL

Conclusion

This project demonstrates a production-grade DevOps workflow using modern cloud-native technologies and best practices, including:

Static application served via NGINX

Lightweight Docker containers

Automated CI/CD pipeline

Kubernetes-based orchestration

Infrastructure as Code

Centralized monitoring & observability

This setup closely reflects real-world enterprise DevOps deployments.

Author
Deepesh Chandanani




