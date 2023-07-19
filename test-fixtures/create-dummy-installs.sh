#!/usr/bin/env bash

declare -a fake_install_versions=(
  1.16
  1.17.1
  1.17.7
  1.17.13
  1.18.1
  1.18.2
  1.18.6
  1.19
  1.19.3
)

mkdir -p ../../installs/asdf-golang
for version in "${fake_install_versions[@]}"; do
  mkdir "../../installs/asdf-golang/${version}"
done
