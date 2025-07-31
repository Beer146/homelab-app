#!/bin/bash
set -e
source "$(dirname "$0")/config.sh"

# Ensure key exists
if [ ! -f "$NEW_KEY_PUB" ]; then
  echo "❌ New key not found. Please run generate_key.sh first."
  exit 1
fi

echo "🔐 Uploading new public key to EC2..."
ssh-copy-id -i "$NEW_KEY_PUB" "$EC2_HOST"

echo "🧼 Cleaning up old key from authorized_keys..."
OLD_PUB_CONTENT=$(ssh-keygen -y -f "$OLD_KEY" 2>/dev/null)
ssh "$EC2_HOST" "grep -v \"$OLD_PUB_CONTENT\" ~/.ssh/authorized_keys > ~/.ssh/authorized_keys.tmp && mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys"

echo "✅ Old key removed. New key is active."

echo "🧪 Testing new key access..."
ssh -i "$NEW_KEY" "$EC2_HOST" "echo '🚀 SSH with new key successful!'"

echo "📌 Done. Rotate complete."
