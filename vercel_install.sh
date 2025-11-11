#!/usr/bin/env bash
set -euo pipefail

# Install Flutter SDK (stable) into home cache to speed up builds
if [ ! -d "$HOME/flutter" ]; then
  echo "Cloning Flutter SDK (stable)..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$HOME/flutter"
else
  echo "Flutter SDK already present in $HOME/flutter"
fi

export PATH="$HOME/flutter/bin:$HOME/flutter/bin/cache/dart-sdk/bin:$PATH"

flutter --version
flutter config --no-analytics
flutter doctor -v || true
flutter config --enable-web || true

# Fetch Dart/Flutter deps for this project
flutter pub get
