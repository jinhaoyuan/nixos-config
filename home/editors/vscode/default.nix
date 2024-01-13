{ config, pkgs, lib, ... }:
# with pkgs; let
#   patchDesktop = pkg: appName: from: to: lib.hiPrio (runCommand "$patched-desktop-entry-for-${appName}" { } ''
#     ${coreutils}/bin/mkdir -p $out/share/applications
#     ${gnused}/bin/sed 's#${from}#${to}#g' < ${pkg}/share/applications/${appName}.desktop > $out/share/applications/${appName}.desktop
#   '');
# in
{
  # home.packages = [
  #   vscode (patchDesktop vscode "code" "^Exec=code" "Exec=code --gtk-version=4")
  # ];
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode;
    };
  };
}
