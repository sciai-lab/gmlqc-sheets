let
  pkgs = import <nixos-unstable> {};
in
  pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (python-pkgs:
        with python-pkgs; [
          numpy
          matplotlib
          scikit-image
          scikit-learn
          jupyter
          torch
          torchvision
          pytorch-lightning
          # jupyter-collaboration
          jupytext
        ]))
    ];
  }
