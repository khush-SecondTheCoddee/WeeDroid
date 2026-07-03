#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE_DIR="$ROOT_DIR/live-build"
BUILD_DIR="$ROOT_DIR/build"

command -v lb >/dev/null 2>&1 || {
  echo "live-build is required. Install it with: sudo apt install live-build" >&2
  exit 127
}

mkdir -p "$BUILD_DIR"
cd "$PROFILE_DIR"

./auto/config
sudo lb build

ISO="$(find . -maxdepth 1 -name '*.iso' -o -name '*.hybrid.iso' | head -n 1)"
if [[ -z "${ISO:-}" ]]; then
  echo "Build finished but no ISO was found in $PROFILE_DIR" >&2
  exit 1
fi

mv "$ISO" "$BUILD_DIR/weedroid-live-amd64.hybrid.iso"
echo "ISO created at $BUILD_DIR/weedroid-live-amd64.hybrid.iso"
