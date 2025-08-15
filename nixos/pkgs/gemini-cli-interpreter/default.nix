{ lib, python3Packages, writeScriptBin }:

python3Packages.buildPythonApplication rec {
  pname = "gemini-cli-interpreter";
  version = "0.1.0"; # You can update this version as you develop

  src = writeScriptBin "gemini" ''
    #!${python3Packages.python.interpreter}
    ${builtins.readFile ./gemini-cli-interpreter.py}
  '';

  # Python dependencies
  propagatedBuildInputs = with python3Packages; [
    google-generativeai
  ];

  # Ensure the script is executable
  postInstall = ''
    chmod +x $out/bin/gemini
  '';

  meta = with lib; {
    description = "A natural language shell interpreter powered by Gemini API";
    homepage = "https://github.com/your-repo/gemini-cli-interpreter"; # Update with your repo if applicable
    license = licenses.unfree; # Or appropriate license if you open source it
    platforms = platforms.linux;
  };
}
