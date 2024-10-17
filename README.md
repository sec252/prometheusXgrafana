# Deploy Prometheus with Grafana using Ansible and Terraform

## Overview

This project demonstrates one way to deploy Prometheus and Grafana services on AWS instances using Ansible, Terraform and, Github actions.

## How This Repo Works

This repository is structured to automate the deployment of Prometheus and Grafana on AWS using a combination of Ansible, Terraform, and GitHub Actions. Here is a high-level overview of the workflow:

1. **Terraform**: Used to provision the necessary AWS infrastructure, including EC2 instances, security groups, and other resources.
2. **Ansible**: Once the infrastructure is in place, Ansible is used to configure the instances, install Prometheus and Grafana, and set up necessary configurations.
3. **GitHub Actions**: Automates the workflow by triggering Terraform and Ansible scripts based on changes to the repository, ensuring continuous deployment and integration.

By following this approach, you can achieve a scalable and automated deployment of monitoring services on AWS.

## Running Manually on the Command Line

To run this repository manually on the command line, follow these steps:

1. **Clone the Repository**:

   - Clone this repository to your local machine:

   ```sh
   git clone https://github.com/yourusername/prometheusXgrafana.git
   cd prometheusXgrafana
   ```

2. **Set Up Terraform**:

   - Navigate to the `./terraform` dir.
   - Insure you have your AWS credentials set up in your environment.
   - Initialize Terraform:
     ```sh
     terraform init
     ```
   - Apply the Terraform configuration to provision the AWS infrastructure:
     ```sh
     terraform apply
     ```

3. **Run Ansible Playbooks**:
   - In the `./ansible` dir execute the Ansible playbook to configure the instances:
     ```sh
     ansible-playbook main.yml
     ```

By following these steps, you can manually deploy Prometheus and Grafana on AWS instances using the command line.
