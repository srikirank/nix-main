{ pkgs, inputs, ... }: {
  enable = true;
  config = {
    map-syntax = [
      "*.jenkinsfile:Groovy"
      "*.props:Java Properties"
    ];
    theme = "rose-pine";
  };
  themes = {
   "rose-pine" = {
     src = inputs.rose-bat;
     file = "dist/themes/rose-pine.tmTheme";
   };
 };
}
