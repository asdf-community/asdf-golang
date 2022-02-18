#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(realpath "$0" | xargs dirname | xargs dirname)"
PARSE_LEGACY_FILE="${REPO_ROOT}/bin/parse-legacy-file"

parse_legacy_file_test::assert() {
  local testname actual expected result
  testname="$1"
  actual="$2"
  expected="$3"

  if [[ "${actual}" != "${expected}" ]]; then
    result=failed
  else
    result=passed
  fi

  echo "${result}: ${testname}: expected '${expected}', got '${actual}'"
}

parse_legacy_file_test::test_valid_go_mod() {
  local tmpdir expected actual result
  tmpdir="$(mktemp -d)"
  expected=1.17.2

  echo "go ${expected}" > "${tmpdir}/go.mod"
  actual="$("${PARSE_LEGACY_FILE}" "${tmpdir}/go.mod")"

  parse_legacy_file_test::assert "${FUNCNAME[0]}" "${actual}" "${expected}"
}

parse_legacy_file_test::test_valid_go_mod_heroku() {
  local tmpdir expected actual result
  tmpdir="$(mktemp -d)"
  expected=1.11

  cat <<EOF > "${tmpdir}/go.mod"
// +heroku goVersion go${expected}
// this line, and the one below, should effectively be ignored.
go 1.0.0 

EOF
  actual="$("${PARSE_LEGACY_FILE}" "${tmpdir}/go.mod")"

  parse_legacy_file_test::assert "${FUNCNAME[0]}" "${actual}" "${expected}"
}

parse_legacy_file_test::test_valid_go_version() {
  local tmpdir expected actual result
  tmpdir="$(mktemp -d)"
  expected=1.12

  echo "${expected}" > "${tmpdir}/.go-version"
  actual="$("${PARSE_LEGACY_FILE}" "${tmpdir}/.go-version")"

  parse_legacy_file_test::assert "${FUNCNAME[0]}" "${actual}" "${expected}"
}

parse_legacy_file_test::main() {
  parse_legacy_file_test::test_valid_go_mod
  parse_legacy_file_test::test_valid_go_mod_heroku
  parse_legacy_file_test::test_valid_go_version
}

parse_legacy_file_test::main
