{ config, lib, pkgs, emacs-overlay, ... }: {
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs29-gtk3;
    };
  };
  nixpkgs.overlays = [ (import emacs-overlay) ];
  environment.systemPackages = [
    (pkgs.emacsWithPackagesFromUsePackage {
      package = pkgs.emacs29-gtk3;  # replace with pkgs.emacsPgtk, or another version if desired.
      config = "~/.emacs.d/init.el";
      defaultInitFile = true;
      # Optionally provide extra packages not in the configuration file.
      extraEmacsPackages = epkgs: [
        epkgs.use-package
      ];

      
    })
  ];

}
