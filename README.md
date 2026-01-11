Trend React Application – Complete DevOps CI/CD Deployment
This document explains a full end-to-end DevOps implementation for deploying a ReactJS
application using Docker, Jenkins, Terraform, AWS EKS, and Monitoring.
PROJECT OBJECTIVE
Deploy a production-ready React application on Kubernetes with automated CI/CD, infrastructure
as code, and monitoring.
APPLICATION DETAILS
Application Type: ReactJS
Source Repo: https://github.com/Vennilavan12/Trend.git
Port: 3000
Platform: AWS EKS
ARCHITECTURE FLOW
Developer → GitHub → Jenkins → DockerHub → AWS EKS → LoadBalancer
TOOLS USED
ReactJS, GitHub, Docker, Jenkins, Terraform, AWS, Kubernetes, Prometheus, Grafana
STEP 1: CLONE AND TEST APPLICATION
git clone https://github.com/Vennilavan12/Trend.git
npm install
npm start
STEP 2: DOCKERIZATION
Dockerfile creates Node-based image exposing port 3000.
STEP 3: TERRAFORM INFRASTRUCTURE
Terraform provisions EC2, IAM, networking.
Commands:
terraform init
terraform plan
terraform apply
STEP 4: JENKINS SETUP
Jenkins installed on EC2 with Git, Docker, Kubernetes plugins.
STEP 5: DOCKERHUB
Docker image built and pushed to DockerHub.
STEP 6: KUBERNETES (EKS)
eksctl create cluster --name trend-cluster
STEP 7: K8S DEPLOYMENT
Deployment with replicas and LoadBalancer service.
STEP 8: CI/CD PIPELINE
Automated build, push, deploy using Jenkinsfile.
STEP 9: MONITORING
Prometheus and Grafana installed via Helm.
STEP 10: APPLICATION ACCESS
Access via AWS LoadBalancer URL.
LOADBALANCER ARN
Retrieved from AWS EC2 console.
FINAL RESULT
Production-ready React application deployed on AWS EKS with CI/CD and monitoring.
