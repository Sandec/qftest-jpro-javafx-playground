#!/bin/bash

# Determine the browser directory (change to 'edge' for Microsoft Edge)
BROWSER_DIR="/etc/opt/chrome/policies/managed"
# For Edge, uncomment the following line:
# BROWSER_DIR="/etc/opt/edge/policies/managed"

# Create the directory if it doesn't exist
sudo mkdir -p "$BROWSER_DIR"

# Define the JSON content
POLICY_CONTENT='{
  "RemoteDebuggingAllowed": true,
  "DeveloperToolsAvailability": 1,
  "DeveloperToolsDisabled": false
}'

# Write the content to the policy file
echo "$POLICY_CONTENT" | sudo tee "$BROWSER_DIR/managed_policies.json" > /dev/null

# Feedback to user
echo "Policies have been set in $BROWSER_DIR/managed_policies.json"