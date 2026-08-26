{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  home.file.".config/quickshell" = {
    source = ../dotfiles/quickshell;
    recursive = true;
    force = true;
  };
}
