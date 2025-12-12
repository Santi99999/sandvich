{ pkgs }: {
  deps = [
    pkgs.wineWowPackages.stable
    pkgs.xorg.xvfb
    pkgs.cabextract
    pkgs.winetricks
    pkgs.wget
    pkgs.unzip
  ];

  env = {
    WINEPREFIX = "/home/runner/.wine-roblox";
    DISPLAY = ":0";
  };
}
