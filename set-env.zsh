asdf_update_golang_env() {
  local go_path
  go_path="$(asdf which go)"
  if [[ -n "${go_path}" ]]; then
    export GOROOT
    GOROOT="$(dirname "$(dirname "${go_path:A}")")"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_golang_env
