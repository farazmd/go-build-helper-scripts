# go-build-helper-scripts
A set of scripts and makefiles to help build go projects


## Overview
- `build/scripts/init.sh` is used to set all required environment variables.
- `build/scripts/build_helper.sh` has all build related functions and creates required directories for all builds.
- `build/scripts/build.sh` drives the build for the project.
- `build/scripts/install_deps.sh` has all external dependencies for the project.

## Installation
- Change directory to the root of your go project and run: 
```shell
curl https://raw.githubusercontent.com/farazmd/go-build-helper-scripts/master/install.sh | bash
```

## Dependencies

- Uses [golangci-lint](https://github.com/golangci/golangci-lint) for linting.

## Customization

### Build
- Add/Update the following in `build/scripts/init.sh` based on your project:
    - `export APP_NAME=<output-binary-name>`.
    - `export BINARY=<path/to/main/package>`.
- You can add additional external go dependencies like cobra-cli, etc at `build/scripts/install_deps.sh`.
- `DEFAULT_PLATFORM_LIST` can be modified to list supported platforms for the project.This can also be overrided using `OVERRIDE_PLATFORM_LIST` variable. All values are space delimited.
- Additional global env variables can be in `build/scripts/init.sh`.
- Additional platform specific env variables can be set using the function `go_set_env_vars_for_platform` in `build/scripts/build_helper.sh`.

### Lint
- The `default.golangci.yaml` is just a sample configuration and can be customised based on project needs. 
- The golangci-lint [configuration](https://golangci-lint.run/usage/configuration/) page has detailed information. 

## Usage

### Using Makefile
- Make has the following targets:
```shell
Usage:
    make <target>

    Targets:
    Help:
        help                    Show this help.
    Build:
        clean                   Clear out dist/ directory.
        install-deps            Install dependencies listed in build/scripts/install_deps.sh
        scripts-executable      Make all scripts under build/scripts executable
        build-all               Builds project for all platforms
        lint                    Runs linter
```

- Run `make scripts-executable` to have all helper scripts under `build/scripts` set with executable permissions.
- `make lint` runs linter using `build/scripts/lint.sh` script.
- `make build-all` creates binaries for all platforms under `dist/` directory.
- `make install-deps` is used to install any external dependencies for the project.


### Using scripts

- You can also use the scripts under `build/scripts/` if you choose not to use `Makefile`.

- The `build/scripts/build.sh` is the main driver for running builds.
```shell
build.sh [-h] [ -t <targets> ]
        -h       Prints this help
        -t       A target platform or a set of target platforms to build. (Space demilited)      Optional
Eg:
        build.sh                                         Will build for all platforms listed in DEFAULT_PLATFORM_LIST or OVERRIDE_PLATFORM_LIST
        build.sh -t "darwin/arm64 darwin/amd64"          Will build only darwin arm64 and amd64 versions
```
- If using the `-t` option with multiple platforms, the value has to be within quotes as in the example above.
