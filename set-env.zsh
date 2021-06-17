function absolute_dir_path {
    local absolute_path
    absolute_path="$( cd -P "$( dirname "$1" )" && pwd )"
    echo "$absolute_path"
}

asdf_update_golang_env() {
  local go_path
  go_path="$(asdf which go)"
  if [[ -n "${go_path}" ]]; then
    export GOROOT
    GOROOT="$(dirname "$(absolute_dir_path "${go_path}")")"   
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd asdf_update_golang_env
