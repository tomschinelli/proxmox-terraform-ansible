# Proxmox - Ansible/Terraform Example (WIP)

This project is an example on how to create and clone a proxmox template.

**Note**: This is not a fully featured project. Use it to copy and paste the code into your project.

## :bug: Known issues/bugs

### Debian 11
Changing the disk sizes, causes terraform to run indefinitely.

## :information_source: Requirements

### Software
You need the following software to be installed.
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Credentials
Create a proxmox api token:

Add token to credentials file and add all required values.

Example:

```shell
cat <<'EOF' >> vms/credentials.auto.tfvars
proxmox_api_token_secret = "12345678-abcd-4321-fghi-1234567890ab"
proxmox_api_url          = "https://192.168.1.100:8006/api2/json"
proxmox_api_token_id     = "root@pam!terraform"
EOF
```

## :construction_worker: Preparation

You need a configured vm template, that will be cloned with terraform.

To configure, set your proxmox host in the inventory file `templates/inventory` and
run the following commands:

```shell
cd templates
# optional edit group_vars/all.yml to configure templates
ansible-playbook site.yml -i inventory
```

## :information_source: Create remote state

Currently, the state is saved locally, since this is just an example project.

Make sure use safe the terraform state somewhere, your team can access it. E.g. 
a S3 bucket in AWS.

## :hammer: Create VMs

```shell
cd vms
terraform init
terraform plan
terraform apply
```

