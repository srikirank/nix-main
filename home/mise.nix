{ pkgs, ... }: {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    globalConfig = {
      tools = {
        go = "latest";
        python = "latest";
        node = "latest";
        java = "corretto-21";
      };
      settings = {
        asdf_compat = true;
        jobs = 4;
      };
    };
}
