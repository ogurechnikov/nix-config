{ pkgs, ... }:
{
  home.packages = with pkgs; [
    go
    gopls
    gotools        # goimports
    go-tools       # staticcheck
    delve
  ];

  home.sessionVariables = {
    GOPATH = "$HOME/go";
    GOBIN = "$HOME/go/bin";
  };

  home.sessionPath = [ "$HOME/go/bin" ];
}
