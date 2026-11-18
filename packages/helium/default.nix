{ pkgs }:

let 
  pname = "helium"; # for some reason wrapType2 expects this not name? stupid thing.
  version = "0.22.1.1";
  arch = "x86_64";

  src = pkgs.fetchurl {
    url = "https://https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
    hash = "sha256-r0aE4ONRpoU03DNEOzadArw6wmM3NMl4SMinQ5vLs2c=";
  };

in
pkgs.appimageTools.wrapType2 {
  inherit pname version src;
}