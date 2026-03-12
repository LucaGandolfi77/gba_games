#!/usr/bin/env bash
set -euo pipefail

IMAGE=gba-devkitpro:latest
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../.."

echo "Building Docker image $IMAGE..."
docker build -t "$IMAGE" -f "$DIR/docker/devkitpro/Dockerfile" "$DIR"

echo "Running container (mounting repository)..."
docker run --rm -it -v "$DIR":/workspaces/gba_games -w /workspaces/gba_games "$IMAGE"
