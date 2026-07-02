{
  boot.supportedFilesystems = [
    "exfat"
    "ntfs"
  ];
  services = {
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };
    devmon.enable = true;
  };
}
