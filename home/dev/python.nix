{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    pyright              # LSP-сервер
    ruff                 # линтер + форматтер (быстрый, современный, заменяет black+flake8+isort)
   ];
}
