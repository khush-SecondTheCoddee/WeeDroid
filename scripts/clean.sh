#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR/live-build"

if command -v lb >/dev/null 2>&1; then
  sudo lb clean --purge
else
  rm -rf .build auto/build config/binary config/bootstrap config/chroot config/common config/source
fi
rm -rf "$ROOT_DIR/build"
