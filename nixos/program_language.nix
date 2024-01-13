{ config, lib, pkgs, ... }:
{ 
  environment.systemPackages = with pkgs;
  let
    my-python-packages = python-packages: with python-packages; [
      pandas
      requests
      sexpdata tld
      pyqt6 pyqt6-sip
      pyqt6-webengine epc lxml # for eaf
      qrcode # eaf-file-browser
      pysocks # eaf-browser
      # pymupdf # eaf-pdf-viewer
      pypinyin # eaf-file-manager
      psutil # eaf-system-monitor
      retry # eaf-markdown-previewer
      markdown
    ];
    python-with-my-packages = python3.withPackages my-python-packages;
  in
  [
    # python3
    # python310Packages.pymupdf
    python-with-my-packages
  ];

}