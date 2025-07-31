#!/bin/bash
set -e
source "$(dirname "$0")/config.sh"

echo "Generating new ED25519 key at $NEW_KEY"
ssh-keygen -t ed25519 -f "$NEW_KEY" -C "$(whoami)@$(hostname)" -N ""

echo "✅ New key generated."
