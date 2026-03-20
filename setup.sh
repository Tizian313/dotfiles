#!/bin/bash

set -e
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
shopt -s nullglob

# Copy dotfiles to home directory
cp -r "$SCRIPT_DIR/home"/{.,}* ~/

exec bash
