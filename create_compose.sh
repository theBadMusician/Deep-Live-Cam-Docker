#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Create docker-compose.yml dynamically
cat > "$SCRIPT_DIR/docker-compose.yml" << EOF
version: '3'
services:
  app:
    image: deep-live-cam
    runtime: nvidia
    devices:
      - "/dev/video0:/dev/video0"
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix
      - ${SCRIPT_DIR}/assets:/Deep-Live-Cam/assets
    environment:
      - DISPLAY=\${DISPLAY}
    tty: true
    stdin_open: true
EOF
