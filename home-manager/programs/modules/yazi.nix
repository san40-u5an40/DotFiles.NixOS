{
  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        show_hidden = true;
        show_symlink = true;
        sort_by = "alphabetical";
        sort_sensitive = false;
        sort_dir_first = true;
        ratio = [ 1 4 3 ];
      };
      preview = {
        image_quality = 90;
        max_width = 600;
        max_height = 900;
      };
    };
  };
}
