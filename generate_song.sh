#!/bin/bash
# generate_song.sh - CLI song generation for WSL/Linux

# Get absolute path to this script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ACE_STEP_DIR="$SCRIPT_DIR/ACE-Step-1.5"

if [ ! -d "$ACE_STEP_DIR" ]; then
    echo "❌ ACE-Step 1.5 directory not found. Please run './setup.sh' first."
    exit 1
fi

# Use uv run to execute the entry point with current .env settings
# CLI version uses more parameters than UI to give you more control
cd "$ACE_STEP_DIR" && uv run python3 -m acestep.acestep_v15_pipeline "$@"
