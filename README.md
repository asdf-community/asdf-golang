# asdf-golang

[![CI](https://github.com/asdf-community/asdf-golang/actions/workflows/main.yml/badge.svg)](https://github.com/asdf-community/asdf-golang/actions/workflows/main.yml)

golang plugin for [asdf version manager](https://github.com/asdf-vm/asdf)

## Requirements

### MacOS

* [GNU Core Utils](http://www.gnu.org/software/coreutils/coreutils.html) - `brew install coreutils`

### Linux (Debian)

* [GNU Core Utils](http://www.gnu.org/software/coreutils/coreutils.html) - `apt install coreutils`
* [curl](https://curl.haxx.se) - `apt install curl`

## Install

```bash
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
```

## Use

Check the [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of go.

## `GOROOT`

To set `GOROOT` in your shell's initialization add the following:

**zsh shell**  
`. ~/.asdf/plugins/golang/set-env.zsh`  

**fish shell**  
`source ~/.asdf/plugins/golang/set-env.fish`  

**nushell shell**
Add this to your env.nu
`source ('~/.asdf/plugins/golang/set-env.nu')`

**bash shell**
Add this to your .bashrc:
`. ~/.asdf/plugins/golang/set-env.bash` 

## When using `go get` or `go install`

After using `go get` or `go install` to install a package you need to run `asdf reshim golang` to get any new shims.

### Default `go get` packages

asdf-golang can automatically install a default set of packages with `go get -u $PACKAGE` right after installing a new Go version.
To enable this feature, provide a \$HOME/.default-golang-pkgs file that lists one package per line, for example:

```bash
// allows comments
github.com/Dreamacro/clash
github.com/jesseduffield/lazygit
```

You can specify a non-default location of this file by setting a `ASDF_GOLANG_DEFAULT_PACKAGES_FILE` variable.

## Version selection

When using `.tool-versions` or `.go-version`, the exact version specified in the
file will be selected.

When using `go.mod`, the highest compatible version that is currently installed
will be selected. As per the [Go modules
reference](https://golang.org/ref/mod#go-mod-file-go), that is the highest minor
version with a matching major version. For example, a `go 1.14` directive in a
`go.mod` file will result in the highest installed `1.minor.patch` being
selected, not necessarily `1.14.patch`.

**Note**: Users can explicitly exclude or include `go.mod` and `go.work` by
setting `ASDF_GOLANG_MOD_VERSION_ENABLED`. Currently it defaults to `true`, but that
may change in the future, so it should be explicitly set.

## Architecture Override

The `ASDF_GOLANG_OVERWRITE_ARCH` variable can be used to override the architecture 
that is used for determining which Go build to download. The primary use case is when attempting 
to install an older version of Go for use on an Apple M1 computer as Go was not being built for ARM at the time.

#### Without ASDF_GOLANG_OVERWRITE_ARCH

```
> asdf install golang 1.15.8
Platform 'darwin' supported!
URL: https://dl.google.com/go/go1.15.8.darwin-arm64.tar.gz returned status 404
```

#### With ASDF_GOLANG_OVERWRITE_ARCH

```
> ASDF_GOLANG_OVERWRITE_ARCH=amd64 asdf install golang 1.15.8
Platform 'darwin' supported!
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  116M  100  116M    0     0  98.6M      0  0:00:01  0:00:01 --:--:-- 98.6M
verifying checksum
/Users/<home>/.asdf/downloads/golang/1.15.8/archive.tar.gz: OK
checksum verified
```

## Skipping Checksums

By default we try to verify the checksum of each install but ocassionally [that's not possible](https://github.com/asdf-community/asdf-golang/issues/91).
If you need to skip the checksum for some reason just set `ASDF_GOLANG_SKIP_CHECKSUM`.

## Contributing

Feel free to create an issue or pull request if you find a bug.

## Issues

* Assumes Linux, FreeBSD, or Mac
* Assumes x86_64, i386, i686, armv6l, armv7l, arm64 and ppc64le

## License

MIT License
