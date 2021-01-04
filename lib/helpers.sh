#!/usr/bin/env bash
set -eu
[ "${BASH_VERSINFO[0]}" -ge 3 ] && set -o pipefail

get_platform () {
    local platform=""

    platform="$(uname | tr '[:upper:]' '[:lower:]')"

    case "$platform" in
        linux|darwin|freebsd)
            msg "Platform '${platform}' supported!"
            ;;
        *)
            fail "Platform '${platform}' not supported!"
            ;;
    esac

    echo -n "$platform"
}

msg () {
    echo -e "\033[32m$1\033[39m" >&2
}

err () {
    echo -e "\033[31m$1\033[39m" >&2
}

fail () {
    err "$1"
    exit 1
}
