{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "san40-u5an40";
        email = "alexandr.dev2011@gmail.com";
      };
      alias = {
        # State
        s = "status --short --branch";
        l = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all";
        rl = "reflog";

        # Stage
        a = "add .";
        rs = "reset";

        # Commit
        c = "commit";
        cm = "commit -m";
        cappend = "commit --amend";
        cundo = "reset --soft HEAD^";
        rv = "revert";
        bl = "blame -e";

        # Remote
        rlist = "remote -v";
        rao = "remote add origin";
        rso = "remote set-url origin";
        p = "push origin";
        pa = "push --all origin";
        ft = "fetch origin";

        # Stash
        sth = "stash push -u";
        sthp = "stash pop";
        stha = "stash apply";
        sthd = "stash drop";
        sthl = "stash list";
        sths = "stash show -p -u";

        # Other
        cls = "clean -f";

        # Branching
        br = "branch";
        co = "checkout";
        sw = "switch";
        mrg = "merge --no-ff";
        mrgab = "merge --abort";

        # Conflict (но лучше ручками)
        cnfour = "checkout --ours";
        cnftheir = "checkout -- theirs";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
