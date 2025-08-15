{ lib
, fetchFromGitHub
, runtimeShell
, python3
, gobject-introspection
, libwnck
, glib
, gtk3
, python3Packages
, wrapGAppsHook
}:

python3Packages.buildPythonApplication {
  pname = "nebula-welcome";
  version = "0-unstable-2025-08-03";

  src = fetchFromGitHub {
    owner = "nebula-OS";
    repo = "nebula-welcome";
    rev = "77fd59df7fe2d2339974d2bdaf904ab3a4f68e2d";
    hash = "sha256-dru0dUM/T0YoD7STKhE4fq0Xtt9Td9vyiebisU53Rps=";
  };

  format = "other";
  
  nativeBuildInputs = [ gobject-introspection wrapGAppsHook ];
  buildInputs = [ glib gtk3 libwnck ];
  propagatedBuildInputs = with python3Packages; [ pygobject3 ];

  makeWrapperArgs = [
    "--set GI_TYPELIB_PATH \"$GI_TYPELIB_PATH\""
  ];

  postPatch = ''
    substituteInPlace share/applications/nebula-welcome.desktop \
      --replace /usr/bin/nebula-welcome $out/bin/nebula-welcome
    substituteInPlace share/nebula-welcome/ui/GUI.py \
      --replace images/htb.png $out/share/nebula-welcome/images/htb.png
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/{bin,share/applications,share/nebula-welcome,share/icons/hicolor/scalable/apps}
    cp -r share/applications/nebula-welcome.desktop $out/share/applications/nebula-welcome.desktop
    cp -r share/nebula-welcome/* $out/share/nebula-welcome/
    cp -r share/icons/hicolor/scalable/apps/nebulaos.svg $out/share/icons/hicolor/scalable/apps/
    makeWrapper ${python3}/bin/python $out/bin/nebula-welcome \
      --add-flags "$out/share/nebula-welcome/nebula-welcome.py" \
      --prefix PYTHONPATH : "$PYTHONPATH"
    runHook postInstall
  '';

  postInstall = ''
    install -Dm644 share/applications/nebula-welcome.desktop $out/etc/xdg/autostart/nebula-welcome.desktop
  '';

  meta = with lib; {
    description = "nebula Welcome application";
    mainProgram = "nebula-welcome";
    homepage = "https://github.com/nebula-OS/nebula-welcome";
    maintainers = with maintainers; [ d3vil0p3r ];
    platforms = platforms.unix;
    license = licenses.gpl3Plus;
  };
}
