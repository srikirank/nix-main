{ pkgs, lib, inputs, ... }: {
  ## Generate SSH key if it doesn't exist
  generateSshKey = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
      /run/current-system/sw/bin/ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N "" -C "kvrs.kiran@gmail.com"
      chmod 600 "$HOME/.ssh/id_ed25519"
      chmod 644 "$HOME/.ssh/id_ed25519.pub"
      /run/current-system/sw/bin/gh ssh-key add ~/.ssh/id_ed25519.pub --type authentication --title darkstar
      /run/current-system/sw/bin/gh ssh-key add ~/.ssh/id_ed25519.pub --type signing --title darkstar
    fi
  '';

  # Alternative approach: Add to activation script
  sshPermissions = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [ -d "$HOME/.ssh" ]; then
      chmod 700 "$HOME/.ssh"
    fi
  '';

  # Install btop Rose Pine theme
  btopTheme = lib.hm.dag.entryAfter ["writeBoundary"] ''
    themesDir="$HOME/.config/btop/themes"
    mkdir -p "$themesDir"
    if [ ! -f "$themesDir/rose-pine.theme" ]; then
      cp ${inputs.rose-btop}/rose-pine.theme "$themesDir/"
    fi
  '';

  # Install yazi Rose Pine theme
  yaziTheme = lib.hm.dag.entryAfter ["writeBoundary"] ''
    themesDir="$HOME/.config/yazi"
    mkdir -p "$themesDir"
    if [ ! -f "$themesDir/theme.toml" ]; then
      cp ${inputs.rose-yazi}/theme.toml "$themesDir/"
    fi
  '';

  # Adds all k9s skins
  k9Skins = lib.hm.dag.entryAfter ["writeBoundary"] ''
    skinsDir="$HOME/Library/Application Support/k9s/skins"
    mkdir -p "$skinsDir"
    if [ ! -f "$skinsDir/rose-pine.yaml" ]; then
      cp ${inputs.k9s-repo}/skins/*.yaml "$skinsDir/" && \
      sed -i 's/\(background: &background\) ".*"/\1 default/' "$skinsDir/rose-pine.yaml"
    fi
  '';

  # Set up default shell
  postActivation = lib.hm.dag.entryAfter ["writeBoundary"] ''
    current_shell=$(basename "$SHELL")
    if [ "$current_shell" != "nu" ]; then
      echo "Changing shell to nushell..."
      /usr/bin/chsh -s /run/current-system/sw/bin/nu
    else
      echo "Shell is already nushell, no change needed."
    fi
  '';
}
