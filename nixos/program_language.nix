{ config, lib, pkgs, ... }:
{
    let
      my-python-packages = ps: with ps; [
        pandas
        requests
        # other python packages
      ];
    in
    environment.systemPackages = [
        python3
        (pkgs.python3.withPackages my-python-packages)
    ];
}