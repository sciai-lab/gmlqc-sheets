let
  pkgs = import <nixos> {};
in
  pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (python-pkgs:
        with python-pkgs; [
          # jupyter-collaboration
          jupyter
          jupytext
          matplotlib
          numpy
          pyscf
          pytorch-lightning
          rdkit
          scikit-image
          scikit-learn
          torch
          torchvision
        ]))
    ];
  }
