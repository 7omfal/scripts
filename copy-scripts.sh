#!/bin/bash

# Directory containing your local scripts
LOCAL_SCRIPTS_DIR=$HOME/scripts

# Destination directory
DEST_DIR=/usr/local/bin

# Copy each script to /usr/local/bin with .sh extension removed
for script in "$LOCAL_SCRIPTS_DIR"/*.sh; do
    if [ -f "$script" ]; then
        # Extract the filename without the extension
        base_name=$(basename "$script" .sh)
        
        # Copy the script with the new name
        sudo cp "$script" "$DEST_DIR/$base_name"
        echo "Copied $(basename "$script") to $DEST_DIR/$base_name"
    fi
done
