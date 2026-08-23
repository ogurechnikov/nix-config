{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  home.file.".config/quickshell".source = ../dotfiles/quickshell;
  home.file.".config/quickshell".recursive = true;
}
