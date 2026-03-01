#!/bin/bash
# setup.sh - Automated setup for Suno Local Clone on WSL/Linux

echo "🚀 Starting Suno Local Clone setup..."

# 1. Install uv if not found
if ! command -v uv &> /dev/null; then
    echo "📦 Installing uv package manager..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
else
    echo "✅ uv is already installed."
fi

# 2. Clone ACE-Step 1.5 if not exists
if [ ! -d "ACE-Step-1.5" ]; then
    echo "📥 Cloning ACE-Step 1.5 repository..."
    git clone https://github.com/ACE-Step/ACE-Step-1.5.git
else
    echo "✅ ACE-Step 1.5 directory exists."
fi

# 3. Sync dependencies using uv
echo "🔄 Syncing Python dependencies (this may take a few minutes)..."
cd ACE-Step-1.5
uv sync
cd ..

# 4. Create optimized .env for WSL (Assuming NVIDIA GPU)
echo "⚙️ Creating optimized .env configuration..."
cat <<EOF > ACE-Step-1.5/.env
# WSL/Linux Optimized .env (NVIDIA GPU)
ACESTEP_CONFIG_PATH=acestep-v15-turbo
ACESTEP_LM_MODEL_PATH=acestep-5Hz-lm-0.6B
ACESTEP_LM_BACKEND=vllm
ACESTEP_INIT_LLM=true
# Port and server name
PORT=7860
SERVER_NAME=0.0.0.0
# Memory & Performance Settings
OFFLOAD_TO_CPU=false
ACESTEP_QUANTIZATION=None
EOF

# 5. Make scripts executable
chmod +x run.sh generate_song.sh setup.sh 2>/dev/null || true

echo "✅ Setup complete! You can now run './run.sh' to start the Web UI."
echo "💡 First run will download several GB of models automatically."
