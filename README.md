# Proxmox - Ansible/Terraform Example (WIP)

This project is an example on how to create and clone a proxmox template.

Note: This is a very early version with much work to do. 

## Requirements
Create a proxmox api token: 

Add token to credentials file and add all required values.

Example:
```shell
cat <<'EOF' >> credentials.auto.tfvars
proxmox_api_token_secret = "12345678-abcd-4321-fghi-1234567890ab"
proxmox_api_url          = "https://192.168.1.100:8006/api2/json"
proxmox_api_token_id     = "root@pam!terraform"
EOF
```

## Run

```shell
# Create template
cd configuration
ansible-playbook site.yml -i inventory

# Create VM
cd ..
terraform plan
terraform apply
```

