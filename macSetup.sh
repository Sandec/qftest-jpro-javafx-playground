#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.
set -x

set -e  # Exit immediately if a command exits with a non-zero status.

# Step 1: Check for administrative privileges
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root. Exiting..."
  exit 1
fi

# Step 2: Install required Python package
echo "Installing required Python packages..."
pip install packaging

# Step 3: Download the modified tccutil.py script
echo "Downloading tccutil.py script..."
curl -O https://raw.githubusercontent.com/jacobsalmela/tccutil/master/tccutil.py

# Step 4: Modify the script to use `packaging.version` instead of `distutils.version`
echo "Modifying tccutil.py script..."
sed -i '' 's/from distutils.version import StrictVersion as version/from packaging.version import Version as version/' tccutil.py

# Step 5: Make the script executable
echo "Making the tccutil.py script executable..."
chmod +x tccutil.py

# Step 6: Modify the TCC database to allow microphone access for Google Chrome
echo "Modifying TCC database to grant microphone access to Google Chrome..."
sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" "INSERT OR REPLACE INTO access VALUES('kTCCServiceMicrophone','com.google.Chrome',0,1,1,NULL,NULL,NULL,'UNUSED',NULL,0,strftime('%s','now'));"

echo "Microphone access granted successfully. Proceeding with CI build steps..."

# Continue with other CI steps...
# Add any additional commands you need for your build process below.