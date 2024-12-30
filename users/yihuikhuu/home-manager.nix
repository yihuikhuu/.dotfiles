{ isWSL, inputs, ... }:

{ config, lib, pkgs, ... }:

{
  home.stateVersion = "25.05";

  #---------------------------------------------------------------------
  # Packages
  #---------------------------------------------------------------------

  home.packages = [
    pkgs.bat
    pkgs.fzf
    pkgs.htop
    pkgs.jq
    pkgs.ripgrep
    pkgs.tree
    pkgs.mise
    pkgs.neovim
    pkgs.lazygit
    pkgs.google-chrome
    pkgs.ghostty
  ];

  #---------------------------------------------------------------------
  # Env vars and dotfiles
  #---------------------------------------------------------------------

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = {
      ".zshenv".source = ../../.config/zsh/dot-zshenv;
      ".tmux".source = ../../.config/tmux/dot-tmux;
      ".tmux.conf".source = ../../.config/tmux/dot-tmux.conf;
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/.config/nvim/dot-config/nvim";
  };

  xdg.configFile = {
      "ghostty".source = ../../.config/ghostty/dot-config/ghostty;
      "zsh".source = ../../.config/zsh/dot-config/zsh;
  };


  #---------------------------------------------------------------------
  # Programs
  #---------------------------------------------------------------------

  programs.git = {
    enable = true;
    userName = "Yihui Khuu";
    userEmail = "yihui.khuu@gmail.com";
  };
}
