#!/bin/bash
# Suno Local Clone - One-Script Launcher for WSL/Linux

echo "🎵 Initializing Suno Local..."

# 1. Dependency: uv
if ! command -v uv &> /dev/null; then
    echo "📦 Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
fi

# 2. Dependency: ACE-Step Engine
if [ ! -d "engine" ]; then
    echo "📥 Cloning engine..."
    git clone --depth 1 https://github.com/ACE-Step/ACE-Step-1.5.git engine
fi

# 3. Optimized Configuration
if [ ! -f "engine/.env" ]; then
    echo "⚙️ Applying memory-optimized config..."
    cat <<EOT > engine/.env
ACESTEP_CONFIG_PATH=acestep-v15-turbo
ACESTEP_LM_MODEL_PATH=acestep-5Hz-lm-0.6B
ACESTEP_LM_BACKEND=vllm
ACESTEP_INIT_LLM=false
ACESTEP_NO_INIT=true
PORT=7890
SERVER_NAME=0.0.0.0
OFFLOAD_TO_CPU=true
ACESTEP_QUANTIZATION=int8_weight_only
VAE_DECODE_TILE_SIZE=256
VAE_DECODE_OVERLAP=32
EOT
fi

# 4. Run
echo "🚀 Starting Web UI on port 7890..."
cd engine && uv sync && uv run acestep --port 7890 --server-name 0.0.0.0
