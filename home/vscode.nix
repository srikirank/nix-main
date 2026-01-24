{ pkgs, ... }: {
  enable = true;
  
  profiles.default = {
    # Extensions based on your current installation
    extensions = with pkgs.vscode-extensions; [
      # Core development
      ms-python.python
      ms-vscode.cpptools
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      github.vscode-pull-request-github
      github.codespaces
      
      # Git & Version Control
      eamodio.gitlens
      mhutchie.git-graph
      
      # Language Support
      redhat.java
      castwide.solargraph  # Ruby
      bbenoist.nix
    
    # Productivity
    alefragnani.bookmarks
    alefragnani.project-manager
    formulahendry.code-runner
    
    # Themes & Icons
    pkief.material-icon-theme
  ] ++ (with pkgs.vscode-extensions; [
    # Additional extensions that might not be in nixpkgs
    # These will be installed manually or via extension marketplace
  ]);

    userSettings = {
    # AWS & Cloud
    "AWSGuruQLinter.ruleSet" = "topsecurity";
    "cloudcode.enableTelemetry" = false;
    
    # Language-specific settings
    "[brazilPackageConfig]" = {
      "workbench.editor.languageDetection" = false;
    };
    "[python]" = {
      "editor.formatOnType" = true;
    };
    "[ruby]" = {
      "editor.defaultFormatter" = "Shopify.ruby-lsp";
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.insertSpaces" = true;
      "editor.semanticHighlighting.enabled" = true;
      "editor.tabSize" = 2;
    };
    
    # Spell checking
    "cSpell.enabled" = false;
    "cSpell.userWords" = [
      "APIGW"
      "Backplane"
      "cloudcode"
      "codestream"
      "denoms"
      "levelname"
      "rtype"
      "skanchib"
      "Subarray"
    ];
    
    # Editor settings
    "editor.acceptSuggestionOnEnter" = "on";
    "editor.accessibilitySupport" = "off";
    "editor.autoIndent" = "full";
    "editor.detectIndentation" = true;
    "editor.dragAndDrop" = true;
    "editor.emptySelectionClipboard" = true;
    "editor.find.autoFindInSelection" = "never";
    "editor.fontFamily" = "JetBrainsMonoNL-ExtraLight";
    "editor.fontLigatures" = true;
    "editor.fontSize" = 13;
    "editor.minimap.enabled" = false;
    "editor.mouseWheelZoom" = true;
    "editor.quickSuggestionsDelay" = 50;
    "editor.rulers" = [120];
    "editor.scrollbar.verticalScrollbarSize" = 4;
    
    # File settings
    "files.associations" = {
      "*.strings" = "plist";
      "*.tks" = "thinkscript";
    };
    "files.atomicWrites" = false;
    "files.autoSave" = "onFocusChange";
    "files.encoding" = "utf8";
    "files.exclude" = {
      "**/.DS_Store" = true;
      "**/.git" = true;
      "**/.hg" = true;
      "**/.ruby-lsp" = true;
      "**/.svn" = true;
      "**/CVS" = true;
      "**/Thumbs.db" = true;
      ".bemol" = true;
      ".viceroy" = true;
      "apollo-overrides" = true;
      "build" = false;
      "env" = true;
      "packageInfo*" = true;
      "release-info" = true;
      "src/*/build" = false;
    };
    "files.insertFinalNewline" = true;
    "files.trimTrailingWhitespace" = true;
    "files.watcherExclude" = {
      "**/.git/objects/**" = true;
      "**/.git/subtree-cache/**" = true;
      "**/.hg/store/**" = true;
      "**/build/**" = true;
      "**/node_modules/*/**" = true;
    };
    
    # Search settings
    "search.exclude" = {
      "**/*.code-search" = true;
      "**/.ruby-lsp" = true;
      "**/bower_components" = true;
      "**/node_modules" = true;
      "build" = true;
      "env" = true;
      "src/*/build" = true;
    };
    
    # Security & Privacy
    "security.workspace.trust.untrustedFiles" = "open";
    "telemetry.telemetryLevel" = "off";
    "gitlens.telemetry.enabled" = false;
    "redhat.telemetry.enabled" = false;
    "code-runner.enableAppInsights" = false;
    
    # Terminal settings
    "terminal.external.osxExec" = "Ghostty.app";
    "terminal.integrated.fontSize" = 15;
    "terminal.integrated.shellIntegration.enabled" = false;
    
    # TypeScript settings
    "typescript.tsserver.maxTsServerMemory" = 10240;
    
    # Workbench & UI
    "window.autoDetectColorScheme" = true;
    "window.closeWhenEmpty" = false;
    "workbench.colorTheme" = "Darcula Theme from IntelliJ";
    "workbench.editorAssociations" = {
      "*.plist" = "default";
    };
    "workbench.iconTheme" = "material-icon-theme";
    "workbench.preferredDarkColorTheme" = "GitHub Dark Dimmed";
    "workbench.preferredHighContrastColorTheme" = "GitHub Dark High Contrast";
    "workbench.preferredHighContrastLightColorTheme" = "GitHub Light High Contrast";
    "workbench.preferredLightColorTheme" = "GitHub Light";
    
    # Kubernetes
    "vs-kubernetes" = {
      "vscode-kubernetes.helm-path.mac" = "/Users/sri/.vs-kubernetes/tools/helm/darwin-arm64/helm";
      "vscode-kubernetes.kubectl-path.mac" = "/Users/sri/.vs-kubernetes/tools/kubectl/kubectl";
    };
    
    # YAML schemas
    "yaml.schemas" = {
      "file:///Users/sri/.vscode/extensions/marklel.vscode-brazil-0.51.201448/assets/languages/rde/schema.json" = "**/definition.yaml";
    };
    
    # Viceroy (Amazon internal tool settings)
    "viceroy.config.internal.lastUpdateTime" = "2023-06-28T00:14:04.347Z";
    "viceroy.config.lastVersion" = "0.51.201448";
    "viceroy.doc.welcome.showAtStartup" = false;
    "viceroy.marketplace.extensionUpdateChannels" = {
      "amzn.AWSGuruQLinter" = "stable";
      "marklel.vscode-brazil" = "stable";
    };
    "viceroy.workspaceSyncStrategy" = "automatic";
    
    # Run in terminal
    "runInTerminal.commands" = [];
    };
  };
}
