#!/bin/bash
# Script to create a deployment package for Raspberry Pi

echo "Creating deployment package for SL Transport Departures Display..."

# Create a temporary directory
TEMP_DIR="deployment-package"
mkdir -p $TEMP_DIR

# Copy necessary files
echo "Copying files..."
cp index.html $TEMP_DIR/
cp server.js $TEMP_DIR/
cp clock.js $TEMP_DIR/
cp config.js $TEMP_DIR/
cp weather.js $TEMP_DIR/
cp ticker.js $TEMP_DIR/
cp package.json $TEMP_DIR/
cp README.md $TEMP_DIR/
cp documentation.md $TEMP_DIR/
cp raspberry-pi-setup.sh $TEMP_DIR/
cp .gitignore $TEMP_DIR/

# Copy any image files if they exist
if [ -d "images" ]; then
    mkdir -p $TEMP_DIR/images
    cp -r images/* $TEMP_DIR/images/
fi

# Create a version file with timestamp
echo "Creating version file..."
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo "SL Transport Departures Display" > $TEMP_DIR/version.txt
echo "Packaged on: $DATE" >> $TEMP_DIR/version.txt
echo "Version: 1.0.0" >> $TEMP_DIR/version.txt

# Create a ZIP archive
echo "Creating ZIP archive..."
ZIP_FILE="sl-departures-display-$(date +"%Y%m%d").zip"
zip -r $ZIP_FILE $TEMP_DIR

# Clean up
echo "Cleaning up..."
rm -rf $TEMP_DIR

echo "Deployment package created: $ZIP_FILE"
echo "To deploy to Raspberry Pi:"
echo "1. Transfer the ZIP file to your Raspberry Pi"
echo "2. Unzip the file: unzip $ZIP_FILE"
echo "3. Navigate to the directory: cd deployment-package"
echo "4. Make the setup script executable: chmod +x raspberry-pi-setup.sh"
echo "5. Run the setup script: sudo ./raspberry-pi-setup.sh"
