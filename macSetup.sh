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

# Step 5: Launch Google Chrome
echo "Launching Google Chrome..."
open -a "Google Chrome"

# Step 6: Use AppleScript to grant microphone access to Google Chrome
echo "Granting microphone access to Google Chrome using AppleScript..."
osascript <<EOD
tell application "System Events"
    -- Wait until Google Chrome is running
    repeat until (exists process "Google Chrome")
        delay 1
    end repeat

    -- Bring Google Chrome to the front
    set frontmost of process "Google Chrome" to true

    -- Wait for the Allow prompt to appear and click Allow
    repeat until (exists button "Allow" of window 1 of process "Google Chrome")
        delay 1
    end repeat

    click button "Allow" of window 1 of process "Google Chrome"
end tell
EOD

echo "Microphone access granted successfully. Proceeding with CI build steps..."

# Continue with other CI steps...
# Add any additional commands you need for your build process below.