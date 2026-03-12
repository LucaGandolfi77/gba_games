#!/usr/bin/env bash
set -euo pipefail

# Simple build helper for game02
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

if [[ ${1:-} == "clean" ]]; then
  make clean
  echo "Clean complete"
  exit 0
fi

if ! command -v dkp-pacman >/dev/null 2>&1 && ! command -v arm-none-eabi-gcc >/dev/null 2>&1; then
  echo "devkitPro non trovato nel PATH. Installa devkitPro e i pacchetti necessari:"
  echo "  sudo dkp-pacman -S devkitARM libgba"
  exit 1
fi

echo "Building game02 (invoking make)..."
make
echo "Build finished: game02.gba"
