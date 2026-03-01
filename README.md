# Suno Local Clone (WSL Optimized)

A high-quality, local alternative to Suno AI, optimized for **WSL (Windows Subsystem for Linux)** with NVIDIA GPU acceleration. Based on **ACE-Step 1.5**.

## 🚀 Features
- **Local & Private:** Generate songs with lyrics and vocals entirely on your own hardware.
- **Fast:** Sub-60s generation for typical song segments on modern GPUs.
- **WSL Native:** Optimized for the WSL environment with CUDA support.
- **Auto-Setup:** Single script to handle dependencies and environment.

## 🛠️ Prerequisites
1. **WSL2** installed with a Linux distribution (e.g., Ubuntu).
2. **NVIDIA GPU** with latest Windows drivers (WSL will use your Windows GPU drivers).
3. **gh CLI** (optional, for repo management).

## 📥 Installation

In your WSL terminal:

```bash
# 1. Clone this repo
git clone https://github.com/4cecoder/suno.git
cd suno

# 2. Run the setup script (installs uv, ACE-Step, and sets up .env)
./setup.sh
```

## 🎵 Usage

### Web UI (Recommended)
Launch the Gradio interface:
```bash
./run.sh
```
Open the URL (usually `http://127.0.0.1:7860`) in your **Windows** browser.

### Command Line
Generate a song directly from the terminal:
```bash
./generate_song.sh --prompt "Cyberpunk darkwave with male vocals" --auto-lyrics
```

## ⚙️ Configuration
The `setup.sh` script automatically creates a `.env` file optimized for typical WSL setups (8-12GB VRAM). You can edit `ACE-Step-1.5/.env` to tweak settings like VRAM offloading or model selection.

## 📄 License
MIT (Based on ACE-Step 1.5)
