{ pkgs, lib, writeShellScript }:

writeShellScript "download-time-of-day-wallpapers" ''
  set -e
  
  WALLPAPER_DIR="$HOME/.local/share/wallpapers/time-of-day"
  mkdir -p "$WALLPAPER_DIR"
  
  # Use the local macOS aerials JSON file
  JSON_FILE="/Library/Application Support/com.apple.idleassetsd/Customer/entries.json"
  
  if [ ! -f "$JSON_FILE" ]; then
    echo "Aerials JSON file not found at $JSON_FILE"
    echo "Make sure you have macOS Sonoma aerials enabled in System Preferences"
    exit 1
  fi
  
  echo "Reading wallpaper list from local macOS aerials..."
  
  # Parse JSON and download wallpapers using jq
  echo "Parsing wallpaper list..."
  
  ${pkgs.jq}/bin/jq -r '.assets[] | "\(.id)|\(.accessibilityLabel)|\(.["url-4K-SDR-240FPS"] // .["url-1080-SDR"])"' "$JSON_FILE" | while IFS='|' read -r id name url; do
    if [ -n "$url" ] && [ "$url" != "null" ]; then
      filename="''${id}_''${name// /_}.mov"
      # Remove problematic characters
      filename=$(echo "$filename" | sed 's/[\/:]/_/g')
      filepath="$WALLPAPER_DIR/$filename"
      
      if [ ! -f "$filepath" ]; then
        echo "Downloading: $name"
        if /usr/bin/curl -L -o "$filepath" "$url"; then
          echo "✓ Downloaded: $name"
        else
          echo "✗ Failed to download: $name"
          rm -f "$filepath"  # Remove partial file
        fi
      else
        echo "Skipping: $name (already exists)"
      fi
    fi
  done
  
  # Count downloaded files
  count=$(ls -1 "$WALLPAPER_DIR"/*.mov 2>/dev/null | wc -l || echo 0)
  echo "Download completed: $count wallpapers in $WALLPAPER_DIR"
''
