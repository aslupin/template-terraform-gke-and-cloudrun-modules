## Template for creating infrastructure as code (IaC) with Terraform ✨
this template will use for project that apply with microservice and require GCP as provider

## Prerequisite
- Terraform CLI
- Create project on GCP
- Create service account on GCP
- Enable GKE on GCP
- Enable Cloud run on GCP
- Create Terraform Cloud as a backend for storing state of infrastructure

## Environment
### Production
Terraform configuration to create GKE resource on GCP provider

### Staging
Terraform configuration tp create cloud run on GCP provider

## Usage
```bash
terraform init
terraform plan

terraform apply -auto-approve
```

## Git Ignore for Terraform
following ignore files on [Terraform Gitignore](https://github.com/github/gitignore/blob/master/Terraform.gitignore)
