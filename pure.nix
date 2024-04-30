let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.numpy
        python-pkgs.matplotlib
        python-pkgs.scikit-image
        python-pkgs.jupyter
        python-pkgs.torch
        python-pkgs.torchvision
        python-pkgs.pytorch-lightning
        python-pkgs.rdkit
        python-pkgs.pyscf
      ]))
    ];
  }
