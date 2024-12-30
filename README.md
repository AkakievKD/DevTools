# Terraform Project

## Overview

This project consists of Terraform modules designed to streamline the management and deployment of cloud infrastructure and services. Each module encapsulates reusable and configurable resources for various services, providing a modular and scalable approach to infrastructure as code.

## Features

- Modular structure for reusable Terraform code.
- Easily configurable input variables for customization.
- Automated resource management

## Supported modules

- Helm
- Argocd
- Harbor
- MinIO
- Vault

## Project Structure

```plaintext
├── terraform-modules
│   ├── argocd
│   ├── harbor
│   ├── helm
|   ├── minio
|   ├── vault-secrets
├── examples
│   ├── argocd
│   ├── harbor
│   ├── helm
|   ├── minio
|   ├── vault-secrets
```

## Requirements

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- [Registry Mirror](https://docs.comcloud.xyz)

- Provider plugins:
  - [Argocd](https://registry.terraform.io/providers/argoproj-labs/argocd/latest)
  - [Harbor](https://registry.terraform.io/providers/goharbor/harbor/latest)
  - [Helm](https://registry.terraform.io/providers/hashicorp/helm/latest)
  - [MinIO](https://registry.terraform.io/providers/aminueza/minio/latest)
  - [Vault](https://registry.terraform.io/providers/hashicorp/vault/latest)

## Getting Started

### Prerequisites

1. Install Terraform CLI.
2. Set up credentials for your desired providers.

### Usage

#### Step 1: Initialize the Project

Run the following command to download the required provider plugins:

```bash
terraform init
```

#### Step 2: Plan the Infrastructure

Preview the changes Terraform will apply:

```bash
terraform plan
```

#### Step 3: Apply the Configuration

Deploy the resources to your cloud provider:

```bash
terraform apply
```

#### Step 4: Destroy the Infrastructure

Clean up the deployed resources:

```bash
terraform destroy
```

### Modules Examples

Detailed documentation for each module is available within their respective directorie "examples".

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Commit your changes.
4. Open a pull request.

## License

This project is licensed under the Apache-2.0 License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [HashiCorp](https://www.hashicorp.com/) for Terraform.
