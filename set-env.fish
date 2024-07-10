function asdf_update_golang_env --on-event fish_prompt
  set --local go_bin_path (asdf which go 2>/dev/null)
  if test -n "$go_bin_path"
    set --local full_path (builtin realpath "$go_bin_path")

    set -gx GOROOT (dirname (dirname "$full_path"))
    set -gx GOPATH (dirname "$GOROOT")/packages
    set -gx GOBIN (dirname "$GOROOT")/bin
  end
end
