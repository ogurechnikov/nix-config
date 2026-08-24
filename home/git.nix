{ pkgs, ...}:
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Sergey Ogurechnikov";
      email = "ogurechnikov@gmail.com";
    };
  };
}
