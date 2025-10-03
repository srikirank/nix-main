{ pkgs, ... }: {
  # Terminal Emulator: Ghostty
  # Note: Ghostty is installed via brew cask in pkgs/brew.nix
  
  # Shell: Nushell with custom config
  programs.nushell = {
    enable = true;
    # Config is imported from nu.nix
  };

  # Theme: Rose Pine (consistent across all tools)
  # Applied to: btop, tmux, starship, yazi, k9s
  
  # Modern CLI Tools (replacements for traditional tools)
  programs = {
    # bat instead of cat
    bat = {
      enable = true;
      config.theme = "base16"; # Rose Pine compatible
    };
    
    # btop instead of htop  
    btop = {
      enable = true;
      settings.color_theme = "rose-pine";
    };
    
    # zoxide instead of cd
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };
    
    # starship prompt with rose pine theme
    starship = {
      enable = true;
      # Config imported from starship.nix
    };
    
    # tmux with custom keybindings and rose pine
    tmux = {
      enable = true;
      # Config imported from tmux.nix
    };
  };

  # Terminal Workflow Preferences
  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "bat";
    MANPAGER = "bat";
  };
}
