{ pkgs, lib, ... }: {
  # Sublime Text configuration
  home.file = {
    # Main preferences
    "Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings".text = builtins.toJSON {
      always_show_minimap_viewport = true;
      bold_folder_labels = true;
      font_options = ["gray_antialias"];
      font_size = 14;
      ignored_packages = ["Vintage"];
      line_padding_bottom = 3;
      line_padding_top = 3;
      overlay_scroll_bars = "enabled";
      folder_exclude_patterns = [
        ".svn" ".git" ".hg" "CVS" ".Trash" ".Trash-*" 
        "__pycache__" ".pytest_cache" ".history"
      ];
      index_files = false;
      auto_complete = true;
    };

    # Package Control settings - your current packages + commonly useful ones
    "Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings".text = builtins.toJSON {
      installed_packages = [
        "Package Control"
        # Add popular packages that complement your workflow
        # Uncomment as needed:
        # "A File Icon"              # Better file icons
        # "BracketHighlighter"       # Bracket matching
        # "GitGutter"                # Git diff in gutter
        # "SideBarEnhancements"      # Enhanced sidebar
        # "SublimeLinter"            # Code linting
        # "Terminus"                 # Terminal in Sublime
        # "LSP"                      # Language Server Protocol
        # "Markdown Preview"         # Markdown preview
        # "Pretty JSON"              # JSON formatting
        # "Theme - One Dark"         # Popular dark theme
      ];
      in_process_packages = [];
    };

    # Custom keybindings
    "Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap".text = builtins.toJSON [
      {
        keys = ["super+shift+k"];
        command = "run_macro_file";
        args = { file = "res://Packages/Default/Delete Line.sublime-macro"; };
      }
      {
        keys = ["alt+shift+l"];
        command = "split_selection_into_lines";
      }
      {
        keys = ["super+["];
        command = "jump_back";
      }
      {
        keys = ["super+]"];
        command = "jump_forward";
      }
      {
        keys = ["super+alt+down"];
        command = "goto_definition";
      }
    ];

    # Language-specific settings
    "Library/Application Support/Sublime Text 3/Packages/User/JSON.sublime-settings".text = builtins.toJSON {
      tab_size = 2;
      translate_tabs_to_spaces = true;
    };

    "Library/Application Support/Sublime Text 3/Packages/User/Shell-Unix-Generic.sublime-settings".text = builtins.toJSON {
      tab_size = 2;
    };

    "Library/Application Support/Sublime Text 3/Packages/User/Side Bar.sublime-settings".text = builtins.toJSON {
      version = "setting no apply";
    };

    # Python settings (if you work with Python)
    "Library/Application Support/Sublime Text 3/Packages/User/Python.sublime-settings".text = builtins.toJSON {
      tab_size = 4;
      translate_tabs_to_spaces = true;
    };

    # Markdown settings
    "Library/Application Support/Sublime Text 3/Packages/User/Markdown.sublime-settings".text = builtins.toJSON {
      tab_size = 2;
      translate_tabs_to_spaces = true;
      wrap_width = 80;
    };
  };

  home.activation.sublimeInfo = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "✅ Sublime Text settings configured"
    echo "📦 Current packages: Package Control only"
    echo "💡 To add more packages:"
    echo "   1. Edit home/sublime.nix"
    echo "   2. Uncomment desired packages in installed_packages list"
    echo "   3. Run: darwin-rebuild switch --flake .#darkstar"
    echo ""
    echo "⌨️  Custom keybindings:"
    echo "   Cmd+Shift+K: Delete line"
    echo "   Alt+Shift+L: Split selection into lines"
    echo "   Cmd+[/]: Jump back/forward"
    echo "   Cmd+Alt+Down: Go to definition"
  '';
}
