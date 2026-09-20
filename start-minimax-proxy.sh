#!/bin/bash
# Lanzador del proxy MiniMax para Claude Desktop (Linux/macOS)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Verificar MINIMAX_API_KEY
if [[ -z "${MINIMAX_API_KEY}" ]]; then
  echo -e '\033[0;31mERROR: falta MINIMAX_API_KEY.\033[0m'
  echo -e '\033[0;33mCorre esto en tu terminal y abre una NUEVA terminal despues:'
  echo '  export MINIMAX_API_KEY="tu-api-key-de-minimax"'
  echo -e '\033[0mTambien puedes agregar esa linea a ~/.bashrc o ~/.zshrc'
  exit 1
fi

# Arregla el CA bundle (compatible con sistemas que lo necesiten)
if command -v python3 &> /dev/null; then
  CA_BUNDLE=$(python3 -c "import certifi; print(certifi.where())" 2>/dev/null || echo "")
  if [[ -n "$CA_BUNDLE" ]]; then
    export SSL_CERT_FILE="$CA_BUNDLE"
    export REQUESTS_CA_BUNDLE="$CA_BUNDLE"
    export CURL_CA_BUNDLE="$CA_BUNDLE"
  fi
fi

# Asegurar que litellm esté en PATH
if command -v litellm &> /dev/null; then
  :  # ya está en PATH
elif [[ -d "$HOME/.local/bin" ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

echo -e '\033[0;32mLevantando proxy MiniMax en http://localhost:4000 ...\033[0m'
echo "Modelos disponibles:"
echo "  - claude-sonnet-4-5 (MiniMax-M3)"
echo "  - minimax-text-01 (MiniMax Text 2.7 normal)"
echo "  - minimax-text-01-higsspeed (MiniMax Text 2.7 high-speed)"
echo ""

litellm --config config.yaml --port 4000
