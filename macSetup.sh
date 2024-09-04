#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.
set -x

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

# Step 5: Use AppleScript to grant microphone access to Google Chrome
echo "Granting microphone access to Google Chrome using AppleScript..."
osascript <<EOD
tell application "System Events"
    set frontmost of process "Google Chrome" to true
    delay 1
    tell process "System Events"
        click button "Allow" of window "Google Chrome" of application process "System Events"
    end tell
end tell
EOD

echo "Microphone access granted successfully. Proceeding with CI build steps..."

# Continue with other CI steps...
# Add any additional commands you need for your build process below.