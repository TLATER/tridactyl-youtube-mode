{ stdenv }:

stdenv.mkDerivation {
  pname = "tridactyl-youtube-mode";
  version = "0.1";
  src = ../.;
  dontBuild = true;

  configurePhase = ''
    substituteInPlace ./src/youtube-mode --replace "js -r lib/" "js -s $out/share/tridactyl/lib/"
  '';

  installPhase = ''
    mkdir -p $out/share/tridactyl/
    cp -r src/* $out/share/tridactyl/
  '';
}
