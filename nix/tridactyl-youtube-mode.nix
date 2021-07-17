{ stdenv }:

stdenv.mkDerivation {
  pname = "tridactyl-youtube-mode";
  version = "0.1";
  src = ../.;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/tridactyl/
    cp src/* $out/share/tridactyl/
  '';
}
