#!/usr/bin/env bash
set -euo pipefail

export PATH="$HOME/flutter/bin:$HOME/flutter/bin/cache/dart-sdk/bin:$PATH"
export FLUTTER_SUPPRESS_ANALYTICS=true
export CI=true

echo "Flutter version:"
flutter --version || true

# Ensure web support is enabled and deps are present (idempotent)
flutter config --enable-web || true
flutter pub get

# Build Flutter Web (avoid renderer flag for widest compatibility)
flutter build web --release

# Print brief summary
echo "Build output:"
ls -alh build/web || true
