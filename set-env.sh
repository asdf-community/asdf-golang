asdf_update_golang_env='go_path="$(asdf which go)"; if [[ -n "${go_path}" ]]; then export GOROOT; GOROOT="$(dirname "$(dirname "${go_path:A}")")"; fi'

PROMPT_COMMAND="${PROMPT_COMMAND};${asdf_update_golang_env}"
