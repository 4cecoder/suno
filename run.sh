#!/bin/bash
# run.sh - Launch the Gradio UI on WSL/Linux

# Get absolute path to this script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ACE_STEP_DIR="$SCRIPT_DIR/ACE-Step-1.5"

if [ ! -d "$ACE_STEP_DIR" ]; then
    echo "❌ ACE-Step 1.5 directory not found. Please run './setup.sh' first."
    exit 1
fi

echo "🎵 Launching Suno Local Clone UI..."
echo "💡 Models will be loaded into GPU memory (this may take 1-2 mins on first run)."

# Use uv run to execute the entry point with current .env settings
cd "$ACE_STEP_DIR" && uv run acestep --port 7860 --server-name 0.0.0.0
