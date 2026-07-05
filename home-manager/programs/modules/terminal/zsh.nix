{ profileInfo, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    autosuggestion = {
      enable = true;
    };

    shellAliases =
      let
        nixPath = "~/.config/nix";
        externalDiskPath = "/media/veracrypt1";

        vcKeyFile = "/media/DB/arch";
        vcDataFile = "/media/32B7-92BD/data_5an40s";
        vcMountPath = "/home/san40-u5an40/ExternalDisk";
      in
      {
        nixrbl = "sudo nixos-rebuild switch --flake ${nixPath}";
        nixhmrbl = "home-manager switch --flake ${nixPath}";
        nixcg = "nix-collect-garbage -d";

        cls = "clear";
        ll = "eza --tree --icons=always --no-time --no-user --no-permissions";
        v = "nvim";
        f = "fastfetch";

        cdnix = "cd ${nixPath}";
        cdnixhm = "cd ${nixPath}/home-manager";
        cdnixos = "cd ${nixPath}/nixOs";

        cfgzsh = "nvim ${nixPath}/home-manager/programs/modules/terminal/zsh.nix";
        cfggit = "nvim ${nixPath}/home-manager/programs/modules/git.nix";
        cfgv = "nvim ${nixPath}/home-manager/programs/modules/neovim/default.nix";

        gcpall = "cp -r ${externalDiskPath}/4_programming/git/templates/. ./";

        dnb = "dotnet build --configuration Release";
        dnr = "dotnet run --configuration Release";
        dnp = "dotnet publish -r linux-x64 -c Release";
        dnnc = "dotnet nuget locals all --clear";
        dnnp = "dotnet pack --configuration Release --include-symbols --verbosity normal";

        vm = "veracrypt -t -k ${vcKeyFile} ${vcDataFile} ${vcMountPath} --fs-options=\"iocharset=utf8\" --protect-hidden=no --pim=0";
        vd = "veracrypt -t -d";
      };

    initContent = ''
      function mkcd() {
        mkdir -p "$1" && cd "$1"
      }
      function yy(){
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';

    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "pattern"
        "cursor"
        "root"
      ];
      styles =
        let
          command = "fg=green";
          attr = "fg=green";
          unknown = "fg=#e0e0e0,bold";
          extra = "fg=yellow";
        in
        {
          "unknown-token" = unknown;
          "default" = unknown;

          "command" = command;
          "builtin" = command;
          "alias" = command;
          "function" = command;
          "reserved-word" = command;

          "path" = attr;
          "path_prefix" = attr;
          "globbing" = attr;
          "single-quoted-argument" = attr;
          "double-quoted-argument" = attr;
          "back-quoted-argument" = attr;
          "dollar-double-quoted-argument" = attr;
          "back-double-quoted-argument" = attr;
          "dollar-quoted-argument" = attr;
          "single-hyphen-option" = attr;
          "double-hyphen-option" = attr;

          "assign" = extra;
          "comment" = extra;
          "separator" = extra;
          "precommand" = extra;
          "redirection" = extra;
        };
      patterns =
        let
          danger = "fg=white,bg=red";
        in
        {
          "rm -rf *" = danger;
          "sudo *" = danger;
        };
    };

    history = {
      size = profileInfo.historyLength;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "dotnet"
        "docker"
        "colored-man-pages"
        "tmux"
      ];
      theme = "bira";
    };
  };
}
