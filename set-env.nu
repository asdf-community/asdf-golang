$env.GOROOT = (asdf which go | path split | drop 2 | path join)
