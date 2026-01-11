Trend React Application – Production Ready DevOps Deployment (Nginx Based)


This document explains a complete real-world DevOps implementation for deploying a React
application with pre-built static files using Nginx, Docker, Jenkins, Terraform, and AWS EKS.


PROJECT OBJECTIVE


Deploy a static React application using Nginx without Node.js or npm in production, following
industry best practices.


APPLICATION DETAILS

Application Type: React (Static Build)
Source Repository: https://github.com/Vennilavan12/Trend.git
Runtime Required: Node.js NOT required
Web Server: Nginx
Container Platform: Docker
Orchestration: Kubernetes (AWS EKS)
CI/CD Tool: Jenkins
Monitoring: Prometheus & Grafana


IMPORTANT PROJECT CONDITION

This project already contains build files. Therefore npm and Node.js are not used in production.
Nginx is used to serve static content.

ARCHITECTURE FLOW
Developer → GitHub → Jenkins → DockerHub → AWS EKS → LoadBalancer

TOOLS USED
GitHub, Docker, Nginx, Jenkins, Terraform, AWS, Kubernetes, Prometheus, Grafana
DOCKERIZATION (NGINX BASED)

Dockerfile uses nginx:alpine image and copies static files to /usr/share/nginx/html.
DOCKER COMMANDS

docker build -t trend-nginx-app .
docker run -d -p 3000:80 trend-nginx-app


TERRAFORM

Terraform provisions EC2, IAM, security groups, and networking resources.
JENKINS CI/CD
Pipeline automates Docker build, push, and Kubernetes deployment triggered by GitHub webhook.
KUBERNETES (EKS)
Application deployed as Deployment with multiple replicas and exposed using LoadBalancer
service.


MONITORING

Prometheus and Grafana used for monitoring cluster and application health.
APPLICATION ACCESS
Access the application using AWS LoadBalancer DNS.
LOADBALANCER ARN
Retrieved from AWS EC2 console.
FINAL RESULT
Production-ready, scalable, and monitored React application deployed on AWS EKS using Nginx
and CI/CD pipeline.
