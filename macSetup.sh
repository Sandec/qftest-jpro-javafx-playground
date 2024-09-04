#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

# Step 1: Install required Python package
echo "Installing required Python packages..."
pip install packaging

# Step 2: Download the modified tccutil.py script
echo "Downloading tccutil.py script..."
curl -O https://raw.githubusercontent.com/jacobsalmela/tccutil/master/tccutil.py

# Step 3: Modify the script to use `packaging.version` instead of `distutils.version`
echo "Modifying tccutil.py script..."
sed -i '' 's/from distutils.version import StrictVersion as version/from packaging.version import Version as version/' tccutil.py

# Step 4: Make the script executable
echo "Making the tccutil.py script executable..."
chmod +x tccutil.py

# Step 5: Grant microphone access to Google Chrome
echo "Granting microphone access to Google Chrome..."
./tccutil.py --bundle-identifier=com.google.Chrome --service=Microphone --state=1

echo "Microphone access granted successfully. Proceeding with CI build steps..."

# Continue with other CI steps...
# Add any additional commands you need for your build process below.