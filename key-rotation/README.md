# SSH Key Rotation for Homelab EC2

This folder automates rotating SSH keys for your homelab instance.

## 🔧 Setup

Edit `config.sh` with the correct EC2 IP and key paths.

## 🔐 Generate a New Key

```bash
./generate_key.sh

🔁 Rotate Key on EC2
bash
Copy
Edit
./rotate_key.sh
This script will:

Upload the new public key

Remove the old public key from ~/.ssh/authorized_keys

Test the new key

🧽 Clean Up
Once verified, remove old key files manually:

bash
Copy
Edit
rm ~/.ssh/homelab_key ~/.ssh/homelab_key.pub
yaml
Copy
Edit

---

## ✅ Final Notes
- Make sure all scripts are executable:  
  ```bash
  chmod +x rotate-keys/*.sh