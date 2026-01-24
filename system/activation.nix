{ pkgs, ... }: {
  system.activationScripts.loginItems.text = ''
    # Clear all existing login items
    /usr/bin/osascript -e 'tell application "System Events" to delete every login item'
    
    # Add desired login items
    /usr/bin/osascript -e 'tell application "System Events" to make login item at end with properties {path:"/Applications/Raycast.app", hidden:false}'
  '';

  system.activationScripts.setupShellCache.text = ''
    # Setup zoxide cache for nushell
    for user_home in /Users/*; do
      if [ -d "$user_home" ] && [ "$(basename "$user_home")" != "Shared" ]; then
        user=$(basename "$user_home")
        cache_dir="$user_home/.cache"
        zoxide_cache="$cache_dir/zoxide.nu"
        
        # Create cache directory if it doesn't exist
        sudo -u "$user" mkdir -p "$cache_dir"
        
        # Initialize zoxide cache if it doesn't exist
        if [ ! -f "$zoxide_cache" ]; then
          sudo -u "$user" /run/current-system/sw/bin/zoxide init nushell --cmd=cd > "$zoxide_cache"
        fi
      fi
    done
  '';
}
