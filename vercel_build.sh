#!/usr/bin/env bash
set -euo pipefail

export PATH="$HOME/flutter/bin:$HOME/flutter/bin/cache/dart-sdk/bin:$PATH"

# Ensure deps are present (idempotent)
flutter pub get

# Build Flutter Web
flutter build web --release --web-renderer canvaskit

# Print brief summary
ls -alh build/web || true
