#!/bin/bash

# Directory for Chrome/Edge policies
POLICY_DIR="/etc/opt"

# Ensure the policy directories exist
sudo mkdir -p "$POLICY_DIR/chrome/policies/managed"
sudo mkdir -p "$POLICY_DIR/edge/policies/managed"

# Create Chrome policy JSON file
cat <<EOF | sudo tee "$POLICY_DIR/chrome/policies/managed/policies.json" > /dev/null
{
  "RemoteDebuggingAllowed": true,
  "DeveloperToolsAvailability": 1,  // 1: Allowed, 2: Disallowed, 3: Allowed in Content Scripts Only
  "DeveloperToolsDisabled": false
}
EOF

# Create Edge policy JSON file
cat <<EOF | sudo tee "$POLICY_DIR/edge/policies/managed/policies.json" > /dev/null
{
  "RemoteDebuggingAllowed": true,
  "DeveloperToolsAvailability": 1,  // 1: Allowed, 2: Disallowed, 3: Allowed in Content Scripts Only
  "DeveloperToolsDisabled": false
}
EOF

echo "Policies for Chrome and Edge have been set successfully."