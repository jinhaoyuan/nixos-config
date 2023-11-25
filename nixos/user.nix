
{ config, lib, pkgs, ... }:
{
  imports =
    [ 
    ];
  security = {
    sudo.wheelNeedsPassword = false;
    pam.services.swaylock = {};
  };
  users = {
    # mutableUsers = false;
    users = {
      jinhaoyuan = {
        hashedPassword = "$y$j9T$KUQP4YthE10tvID0H43ca.$nJfVHEE.2Br52KACCVe8b84kKkLaM6doxMHSGAN3IH8";
        isNormalUser = true;
        shell = pkgs.zsh;
	      ignoreShellProgramCheck = true;
        description = "jinhaoyuan home";
        home = "/home/jinhaoyuan";
        extraGroups = [ 
          "jinhaoyuan"
	        "wheel"
          "networkmanager"
          "video"
          "audio"
          "docker"
          "podman"
          "libvirt"
	      ];
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCojdLOATIzaNc6bntIVEOYE3O3ajZcV60XNRwnuXMA1SiboQTI6k2xe++4AxBfrvLMEnThX/XVhWKRAGFqnlP/dcplxFlQ/xmzMiMhx09vX62p2tAGWmPfavo57WDsE2HE7OsDpt/Tmus2/ekgo3/58N8xxWnc22bqLtAuMKePSaJ9ktfr+bjS5YncT8xMzOlZ5+XRy7jF4uixAzXX7DRFVo1VCEQDM2a9EPqJ4w+B/4yCjdmHpJ7u7UjFsReQzc5AFPUx2o7b3S+U8lcXdAu/ddflgcXiQcCx7VubK4cdQPnBQOaKtQPSoYsQnVPaghUHFT+WbUWFdYOCL/vdVYyJmltZvvLJ+jyI01uzQjW2PkOpOImFJvZaOhf3WSPRwpDxaN/0MB6fgdoRkwKeNgzlvsXX75B7rPDIrE+vQgkRV+zhRAIKY599TH84H0KBw9Of2jfnRhjM/PZblPWh6XAYrqo3WrOFam41AegT4z0H5nZoQVn+ENiBoNm8tfonAW8= jinhaoyuan02@gmail.com"
        ];
      };
    };
  };

}
