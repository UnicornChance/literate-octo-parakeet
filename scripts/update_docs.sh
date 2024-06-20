#!/bin/bash

# Configuration
SUBMODULES_PATH="submodules"
HUGO_CONTENT_PATH="content/en"

# copy uds-docs to site content
rm -rf content/en/*
cp -r docs/* $HUGO_CONTENT_PATH

# Iterate over each submodule directory in the submodules path
for SUBMODULE_PATH in $SUBMODULES_PATH/*; do

  # Initialize and update all submodules
  git submodule update --init --recursive --depth 1 $SUBMODULE_PATH

  if [ -d "$SUBMODULE_PATH" ]; then
    SUBMODULE_NAME=$(basename "$SUBMODULE_PATH")

    # Define the destination directory
    DEST_PATH="$HUGO_CONTENT_PATH/$SUBMODULE_NAME"
    
    # Recreate directory structure for repo submodule docs
    mkdir -p "$DEST_PATH"
    
    # Copy the new documentation from the repo submodule
    if [ -d "$SUBMODULE_PATH/docs" ]; then
      cp -r "$SUBMODULE_PATH/docs/"* "$DEST_PATH"
    fi
  fi
done