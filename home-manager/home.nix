{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "jjorgens";
  home.homeDirectory = "/home/jjorgens";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # One imagines that one would need to install an emacs variant
    # before installing packages, but that appears to not be the case.
    # emacsGit
    git
    htop
    keepassxc
    steam
    slack

    ((emacsPackagesFor emacsGit).emacsWithPackages (epkgs: [
      epkgs.vterm
      epkgs.multi-vterm
      epkgs.geiser-guile
      epkgs.geiser
      epkgs.direnv
      epkgs.counsel
      epkgs.yasnippet-snippets
      epkgs.yasnippet
      epkgs.toml-mode
      epkgs.csv-mode
      epkgs.company-quickhelp
      epkgs.company
      epkgs.exec-path-from-shell
      epkgs.markdown-mode
      epkgs.js2-mode
      epkgs.yaml-mode
      epkgs.projectile
      epkgs.rust-mode
      epkgs.auto-complete
      epkgs.web-mode
      epkgs.magit
      epkgs.flycheck
      epkgs.nix-mode
      # The nixpkgs irony package seems to function ok.
      emacsPackages.irony
      emacsPackages.platformio-mode
      emacsPackages.irony-eldoc
      emacsPackages.flycheck-irony
      emacsPackages.company-irony

      # irony from emacs-overlay won't pass its tests right now. Save for later.
      # epkgs.irony
      # epkgs.platformio-mode
      # epkgs.irony-eldoc
      # epkgs.flycheck-irony
      # epkgs.company-irony
    ]))
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/jjorgens/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
