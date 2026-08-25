{ pkgs, ...}:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "alacritty";
        layer = "overlay";
        width = 40;
        lines = 10;
      };
      border = {
        width = 2;
        radius = 8;
      };
    };
  };
}
