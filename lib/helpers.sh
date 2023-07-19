#!/usr/bin/env bash
set -eu
[ "${BASH_VERSINFO[0]}" -ge 3 ] && set -o pipefail

get_platform() {
  local silent=${1:-}
  local platform=""

  platform="$(uname | tr '[:upper:]' '[:lower:]')"

  case "$platform" in
    linux | darwin | freebsd)
      [ -z "$silent" ] && msg "Platform '${platform}' supported!"
      ;;
    *)
      fail "Platform '${platform}' not supported!"
      ;;
  esac

  printf "%s" "$platform"
}

get_arch() {
  local arch=""
  local arch_check=${ASDF_GOLANG_OVERWRITE_ARCH:-"$(uname -m)"}
  case "${arch_check}" in
    x86_64 | amd64) arch="amd64" ;;
    i686 | i386 | 386) arch="386" ;;
    armv6l | armv7l) arch="armv6l" ;;
    aarch64 | arm64) arch="arm64" ;;
    ppc64le) arch="ppc64le" ;;
    *)
      fail "Arch '${arch_check}' not supported!"
      ;;
  esac

  printf "%s" "$arch"
}

msg() {
  echo -e "\033[32m$1\033[39m" >&2
}

err() {
  echo -e "\033[31m$1\033[39m" >&2
}

fail() {
  err "$1"
  exit 1
}
