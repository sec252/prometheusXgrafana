# Deploy Prometheus with Grafana using Ansible

## Basic Instructions

Step 1: Update ip address of instances in inventory file.
Note: You may need to remove/replace the ssh key in deploy_prometheus.yml

Step 2: Run ansible command to setup prometheus and Grafana services

Ansible command: ansible-playbook deploy_prometheus.yml
