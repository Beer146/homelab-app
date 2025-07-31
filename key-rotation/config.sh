#!/bin/bash

# === CONFIGURATION ===
export EC2_HOST="deployer@54.85.2.45"
export OLD_KEY="$HOME/.ssh/homelab_key"
export NEW_KEY="$HOME/.ssh/homelab_key_rotated"
export NEW_KEY_PUB="${NEW_KEY}.pub"
