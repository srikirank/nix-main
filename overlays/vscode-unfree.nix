final: prev: {
  # Override vscode-extensions to allow unfree packages
  vscode-utils = prev.vscode-utils // {
    buildVscodeMarketplaceExtension = args:
      (prev.vscode-utils.buildVscodeMarketplaceExtension args).overrideAttrs (old: {
        meta = (old.meta or {}) // {
          license = prev.lib.licenses.unfree;
        };
      });
  };
}
