# Random Cats

A small toy project for practising **DevOps and Platform Engineering principles**.

Random Cats displays a random cat picture every time the page is loaded. The application is built with **React, TypeScript, and Python/FastAPI**, containerised with Docker, and deployed to **AWS** using infrastructure managed by Terraform.

## Architecture

The application is composed of Dockerised frontend and backend services running on AWS.

The infrastructure uses the following AWS services:

| Service | Purpose |
|---|---|
| **Amazon ECS / Fargate** | Runs the containerised application services |
| **Amazon ECR** | Stores and hosts Docker images |
| **Amazon S3** | Stores the cat pictures |
| **Amazon VPC** | Provides networking and network isolation |
| **Application Load Balancer** | Routes incoming requests to the appropriate services |
| **AWS IAM** | Manages permissions, policies, and roles |

## Infrastructure & Deployment

Infrastructure is provisioned using **Terraform** and deployed through **GitHub Actions**.

### Terraform

The AWS infrastructure can be provisioned through a **manually triggered GitHub Actions workflow**.

Terraform is also scanned with **Checkov** to identify potential security misconfigurations and infrastructure-as-code issues.

### CI

On every pull request targeting `main`, GitHub Actions runs the project's automated tests.

### Container Deployment

A separate **manually triggered GitHub Actions workflow** builds and deploys the application containers to **Amazon ECR**.

The pipeline interacts with AWS through OIDC and assumes a role to perform the actions it needs to perform, no long lived credentials are used.

### Container Security

**Trivy** is used to scan the Docker images for known vulnerabilities.

The containers do not run as root and run as a user with non root privileges.

## CI/CD Overview

```text
Pull Request → GitHub Actions → Tests

Manual Trigger → Terraform → AWS Infrastructure

Manual Trigger → Docker Build → Trivy Scan → ECR







