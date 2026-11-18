{ pkgs }:

let 
  pname = "helium"; # for some reason wrapType2 expects this not name? stupid thing.
  version = "0.22.1.1";
  arch = "x86_64";

  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
    hash = "sha256-r0aE4ONRpoU03DNEOzadArw6wmM3NMl4SMinQ5vLs2c=";
  };

  originalContents = pkgs.appimageTools.extract {
    inherit pname version src;
  }; # apparently this should mean fuzzel and stuff pick it up!

in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    install -Dm644 ${originalContents}/helium.desktop \
      $out/share/applications/helium.desktop

    install -Dm644 ${originalContents}/usr/share/icons/hicolor/256x256/apps/helium.png \
      $out/share/icons/hicolor/256x256/apps/helium.png
  ''; # 
}