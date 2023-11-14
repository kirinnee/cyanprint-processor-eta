{ pkgs, packages }:
with packages;
{
  system = [
    coreutils
    sd
    bash
    findutils
  ];

  dev = [
    pls
    git
  ];

  infra = [
    docker
  ];

  main = [
    # cyanprint
    bun
    infisical
  ];

  lint = [
    # core
    treefmt
    hadolint
    gitlint
    shellcheck
    sg
  ];

  ci = [
  ];

  releaser = [
  ];

}
