{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    bat
    tree
    cmake
    gcc
    gnumake
    libtool
    gitflow
  ];
}
