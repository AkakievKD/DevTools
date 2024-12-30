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
├── modules
│   ├── aws
│   │   ├── s3_bucket
│   │   └── ec2_instance
│   ├── azure
│   │   ├── storage_account
│   │   └── virtual_machine
│   ├── minio
│   │   ├── bucket_replication
│   │   └── ilm_tier
├── examples
│   ├── aws_example
│   ├── azure_example
│   └── minio_example
├── main.tf
├── variables.tf
└── outputs.tf
```

## Requirements

- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads) v1.4+
- Provider plugins:
  - [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest)
  - [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
  - [MinIO Provider](https://registry.terraform.io/providers/aminueza/minio/latest)

## Getting Started

### Prerequisites

1. Install Terraform CLI.
2. Set up credentials for your desired cloud providers.

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

## Examples

### AWS S3 Bucket

```hcl
module "s3_bucket" {
  source      = "./modules/aws/s3_bucket"
  bucket_name = "my-example-bucket"
  region      = "us-west-2"
}
```

### Azure Storage Account

```hcl
module "storage_account" {
  source              = "./modules/azure/storage_account"
  storage_account_name = "examplestorage"
  resource_group_name  = "example-rg"
}
```

### MinIO Bucket Replication

```hcl
module "bucket_replication" {
  source  = "./modules/minio/bucket_replication"
  bucket  = "source-bucket"
  target  = {
    access_key = "minio-access-key"
    bucket     = "target-bucket"
    host       = "https://minio.example.com"
    secure     = true
  }
}
```

## Documentation

### Providers

- [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- [MinIO Provider Documentation](https://registry.terraform.io/providers/aminueza/minio/latest)

### Modules

Detailed documentation for each module is available within their respective directories.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Commit your changes.
4. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [HashiCorp](https://www.hashicorp.com/) for Terraform.
- Open-source contributors for their amazing work on provider plugins.
