
{ config, lib, pkgs, ... }:
{
  imports =
    [ 
    ];
  users = {
    users = {
      jinhaoyuan = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
        shell = pkgs.zsh;
	ignoreShellProgramCheck = true;
        description = "jinhaoyuan home";
        home = "/home/jinhaoyuan";
      };
    };
  };

}
