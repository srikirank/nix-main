{ pkgs, inputs, ... }: 
let
  marketplace = pkgs.vscode-marketplace;
in {
  enable = true;
  mutableExtensionsDir = true;
  
  profiles.default = {
    keybindings = [
#      {
#        key = "cmd+[";
#        command = "-editor.action.outdentLines";
#        when = "editorTextFocus && !editorReadonly";
#      }
#      {
#        key = "shift+tab";
#        command = "markdown.extension.onOutdentLines";
#        when = "editorTextFocus && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
#      }
#      {
#        key = "cmd+[";
#        command = "-markdown.extension.onOutdentLines";
#        when = "editorTextFocus && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
#      }
#      {
#        key = "cmd+[";
#        command = "workbench.action.navigateBack";
#        when = "canNavigateBack";
#      }
#      {
#        key = "ctrl+-";
#        command = "-workbench.action.navigateBack";
#        when = "canNavigateBack";
#      }
#      {
#        key = "cmd+]";
#        command = "extension.arrowForwardBtn";
#      }
#      {
#        key = "tab";
#        command = "editor.action.indentLines";
#        when = "editorTextFocus && !editorReadonly";
#      }
#      {
#        key = "cmd+]";
#        command = "-editor.action.indentLines";
#        when = "editorTextFocus && !editorReadonly";
#      }
#      {
#        key = "alt+backspace";
#        command = "-extension.hungryDelete";
#        when = "editorTextFocus && !editorReadonly";
#      }
#      {
#        key = "alt+backspace";
#        command = "-workbench.action.terminal.sendSequence";
#        when = "terminalFocus";
#      }
#      {
#        key = "alt+backspace";
#        command = "-metaGo.metaJump.deleteToBefore";
#        when = "editorTextFocus";
#      }
    ];

    extensions = [
      ## --- Ruby Ecosystem (Crucial for BrowserStack) ---
      marketplace.shopify.ruby-lsp
      marketplace.castwide.solargraph
      marketplace.groksrc.ruby
      marketplace.misogi.ruby-rubocop
      marketplace.vortizhe.simple-ruby-erb
      marketplace.hoovercj.ruby-linter
      marketplace.miguel-savignano.ruby-symbols
      marketplace.walkme.ruby-extension-pack
      marketplace.vayan.haml

      ## --- Java & Gradle Ecosystem ---
      marketplace.redhat.java
      marketplace.vscjava.vscode-java-pack
      marketplace.vscjava.vscode-java-debug
      marketplace.vscjava.vscode-java-dependency
      marketplace.vscjava.vscode-java-test
      marketplace.vscjava.vscode-gradle
      marketplace.vscjava.vscode-maven
      marketplace.richardwillis.vscode-gradle-extension-pack
      marketplace.naco-siren.gradle-language
      marketplace.vscjava.vscode-java-pack

      ## --- Python & Go ---
      marketplace.ms-python.python
      marketplace.ms-python.vscode-pylance
      marketplace.ms-python.debugpy
      marketplace.kevinrose.vsc-python-indent
      marketplace.golang.go

      ## --- Web & Infrastructure ---
      marketplace.ecmel.vscode-html-css
      marketplace.ms-vscode.powershell
      marketplace.ms-vscode.makefile-tools
      marketplace.redhat.vscode-yaml
      marketplace.mikestead.dotenv
      marketplace.codezombiech.gitignore
      marketplace.bbenoist.nix
      marketplace.pepri.smithy-vscode

      ## --- AI & Cloud ---
      marketplace.github.copilot-chat

      ## --- Git & Collaboration ---
      marketplace.eamodio.gitlens
      marketplace.mhutchie.git-graph
      marketplace.github.vscode-pull-request-github
      marketplace.github.remotehub
      marketplace.ms-vscode.azure-repos
      marketplace.ms-vsliveshare.vsliveshare
      marketplace.vsls-contrib.gistfs
      marketplace.lostintangent.vsls-whiteboard
      marketplace.codestream.codestream
      marketplace.vivaxy.vscode-conventional-commits
      marketplace.github.vscode-github-actions

      ## --- Productivity & Navigation ---
      marketplace.alefragnani.bookmarks
      marketplace.alefragnani.project-manager
      marketplace.atishay-jain.all-autocomplete
      marketplace.metaseed.metago
      marketplace.metaseed.metajump
      marketplace.metaseed.metaword
      marketplace.junv.recent-files
      marketplace.lhybdv.goto-recent-files
      marketplace.percygrunwald.vscode-intellij-recent-files
      marketplace.pyronaur.jump-to-recent
      marketplace.tenorok.recent-picker
      marketplace.nick-rudenko.back-n-forth
      marketplace.formulahendry.code-runner
      marketplace.streetsidesoftware.code-spell-checker
      marketplace.gruntfuggly.todo-tree
      marketplace.ctf0.macros
      marketplace.hoovercj.vscode-settings-cycler
      marketplace.inu1255.easy-snippet
      marketplace.slevesque.vscode-multiclip

      ## --- AI Code Assist ---
      marketplace.google.geminicodeassist
      marketplace.google.gemini-cli-vscode-ide-companion
      marketplace.ms-windows-ai-studio.windows-ai-studio

      ## --- Text Manipulation ---
      marketplace.tyriar.sort-lines
      marketplace.tyriar.vscode-terminal-here
      marketplace.adamhartford.vscode-base64
      marketplace.flesler.url-encode
      marketplace.bibhasdn.unique-lines
      marketplace.yuvraj.json-scape-unscape
      marketplace.nickdemayo.vscode-json-editor
      marketplace.jasonlhy.hungry-delete
      marketplace.jkjustjoshing.vscode-text-pastry
      marketplace.lacroixdavid1.vscode-format-context-menu
      marketplace.jakearl.search-editor-apply-changes

      ## --- Remote & Filesystem ---
      marketplace.ms-vscode-remote.remote-ssh
      marketplace.ms-vscode-remote.remote-ssh-edit
      marketplace.ms-vscode-remote.remote-containers
      marketplace.ms-vscode.remote-explorer
      marketplace.ms-vscode.remote-repositories
      marketplace.ms-vscode.remote-server
      marketplace.github.codespaces
      marketplace.ms-azuretools.vscode-docker
      marketplace.ms-azuretools.vscode-containers
      marketplace.ms-kubernetes-tools.vscode-kubernetes-tools
      marketplace.xyz.local-history
      marketplace.micnil.vscode-checkpoints
      marketplace.peterschmalfeldt.explorer-exclude
      marketplace.nemesv.copy-file-name
      marketplace.moshfeu.compare-folders
      marketplace.davidkol.fastcompare

      ## --- UI & Themes ---
      marketplace.pkief.material-icon-theme
      marketplace.trinm1709.dracula-theme-from-intellij
      marketplace.github.github-vscode-theme
      marketplace.rokoroku.vscode-theme-darcula
      marketplace.jprestidge.theme-material-theme
      marketplace.johnpapa.vscode-peacock
      marketplace.ibm.output-colorizer
      marketplace.nhoizey.gremlins
      marketplace.pkubik.hide-all
      marketplace.pnp.polacode
      marketplace.tomoki1207.pdf
      marketplace.yzhang.markdown-all-in-one
      marketplace.darkriszty.markdown-table-prettify
      marketplace.ms-vscode.sublime-keybindings
      marketplace.jabacchetta.vscode-essentials
    ];

    userSettings = {
    # AWS & Cloud
    # Language-specific settings
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
      "codestream"
      "denoms"
      "levelname"
      "rtype"
      "Subarray"
    ];
    
    # Editor settings
    "editor.acceptSuggestionOnEnter" = "smart";
    "editor.tabCompletion" = "on";
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
    "http.systemCertificatesNode" = true;
    
    # Terminal settings
    "terminal.external.osxExec" = "Ghostty.app";
    "terminal.integrated.fontSize" = 15;
    "terminal.integrated.shellIntegration.enabled" = false;
    
    # TypeScript settings
    "typescript.tsserver.maxTsServerMemory" = 10240;
    "aws.cloudformation.telemetry.enabled" = false;

    # AI
    "chat.mcp.gallery.enabled" = true;

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
    "terminal.integrated.env.osx" = {
        "Q_NEW_SESSION" = "1";
    };
    };
  };
}
