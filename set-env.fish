function asdf_update_golang_env --on-event fish_prompt
  set --local go_path (asdf which go 2>/dev/null)
  if test -n "$go_path"
    set --local full_path (builtin realpath "$go_path")

    set -gx GOROOT (dirname (dirname "$full_path"))
  end
end
