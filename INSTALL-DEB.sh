#!/bin/bash

set -e

echo "🔍 Checking latest Cursor IDE version..."
URL=$(curl -sL https://www.cursor.sh/ | grep -oP 'https://download\.cursor\.sh/linux_deb/cursor_.*?\.deb' | head -n 1)

if [[ -z "$URL" ]]; then
  echo "❌ Failed to retrieve Cursor IDE download URL."
  exit 1
fi

FILENAME=$(basename "$URL")

echo "⬇️ Downloading $FILENAME..."
wget -O "/tmp/$FILENAME" "$URL"

echo "📦 Installing Cursor IDE..."
sudo dpkg -i "/tmp/$FILENAME" || sudo apt -f install -y

echo "✅ Cursor IDE installed successfully."
