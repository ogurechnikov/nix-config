{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    tree
    cmake
    gcc
    gnumake
    libtool
  ];
}
