{pkgs ? import <nixpkgs> {}}: let
  fhs = pkgs.buildFHSUserEnv {
    name = "my-fhs-environment";

    targetPkgs = _: [
      pkgs.micromamba
    ];

    profile = ''
      set -e
      eval "$(micromamba shell hook --shell=posix)"
      export MAMBA_ROOT_PREFIX=${builtins.getEnv "PWD"}/.mamba
      if ! test -d $MAMBA_ROOT_PREFIX/envs/my-mamba-environment; then
          micromamba create --yes -q -n my-mamba-environment
      fi
      micromamba activate my-mamba-environment
      micromamba install --yes -f conda-requirements.txt -c conda-forge
      set +e
    '';
  };
in
  fhs.env
