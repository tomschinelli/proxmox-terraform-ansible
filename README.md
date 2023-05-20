# Proxmox - Ansible/Terraform Example

This project is an example on how to create and clone a proxmox template.

**Note**: This is not a fully featured project. Use it to copy and paste the code into your project.


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

## :hammer: Create VMs

You need to run the following steps to create VMs

- Create templates
- Create clones from templates

### Prepare templates

You need a configured vm template, that will be cloned with terraform.

To configure, set your proxmox host in the inventory file `templates/inventory` and
run the following commands:

```shell
cd templates
# optional edit group_vars/all.yml to configure templates
ansible-playbook site.yml -i inventory
```

### Create VMs in terraorm

```shell
cd vms
terraform init
terraform plan
terraform apply
```

## :bug: Known issues/bugs

### Debian 11
Changing the disk sizes, causes terraform to run indefinitely.
