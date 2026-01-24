{ pkgs, lib, ... }:
let
  customConfig = ''
# Custom Settings
cursor-style = bar
theme = dark:Atom One Dark,light:Atom One Light'';
in {
  home.activation.ghosttyConfig = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # Create ghostty config directory
    mkdir -p "$HOME/Library/Application Support/com.mitchellh.ghostty"
    # Write custom config
    echo '${customConfig}' > "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
  '';
}
