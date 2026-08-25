{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil          # LSP-сервер для Nix
    nixfmt-rfc-style   # форматтер (актуальное имя пакета для форматирования по RFC-стилю)
  ];
}
