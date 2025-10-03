{ pkgs, lib, ... }: {
  home.activation.wallpaperSetup = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # Set up Tahoe wallpaper shuffling
    /usr/bin/osascript -e '
      tell application "System Events"
#        tell every desktop
#          set picture rotation to 1
#          set random order to true
#          set change interval to 1800
#          set pictures folder to "/System/Library/Desktop Pictures/Tahoe.heic"
#        end tell
      end tell
    '
  '';
}
