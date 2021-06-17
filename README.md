# asdf-golang

[![Build Status](https://travis-ci.org/kennyp/asdf-golang.svg?branch=master)](https://travis-ci.org/kennyp/asdf-golang)

golang plugin for [asdf version manager](https://github.com/asdf-vm/asdf)

## Requirements

### MacOS

* [GNU Core Utils](http://www.gnu.org/software/coreutils/coreutils.html) - `brew install coreutils`

### Linux (Debian)

* [GNU Core Utils](http://www.gnu.org/software/coreutils/coreutils.html) - `apt install coreutils`
* [curl](https://curl.haxx.se) - `apt install curl`

## Install

```bash
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
```

## Use

Check the [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of go.

## `GOROOT`

To set `GOROOT` in your shell's initialization add the following:

**zsh shell**  
`. ~/.asdf/plugins/golang/set-env.zsh`  

## When using `go get`

After using `go get` to install a package you need to run `asdf reshim golang` to get any new shims.

### Default `go get` packages

asdf-golang can automatically install a default set of packages with `go get -u $PACKAGE` right after installing a new Go version.
To enable this feature, provide a \$HOME/.default-golang-pkgs file that lists one package per line, for example:

```bash
// allows comments
github.com/Dreamacro/clash
github.com/jesseduffield/lazygit
```

## Contributing

Feel free to create an issue or pull request if you find a bug.

## Issues

* Assumes Linux, FreeBSD, or Mac
* Assumes x86_64, i386, i686, armv6l, armv7l, arm64 and ppc64le

## License

MIT License
