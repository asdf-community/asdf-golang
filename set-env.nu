def --env asdf-update-golang-env [] {
  let go_path = asdf which go | complete
  if $go_path.exit_code != 0 {return}
  let root = ($go_path.stdout | str trim | path split | drop 2 | path join)
  if $root != $env.GOROOT? {
    $env.GOROOT = $root
    $env.GOPATH = ($root | path dirname | path join packages)
    $env.GOBIN = ($root | path dirname | path join bin)
  }
}

asdf-update-golang-env

$env.config.hooks.pre_prompt = (
  $env.config.hooks | get -o pre_prompt | default [] | prepend {|| asdf-update-golang-env }
)
