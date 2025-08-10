# Minux packages build system

> Build scripts for the packages in the OC2:R apt repo

## Setup

You will need an Minux toolchain to use the build scripts in this repo, you can build one with https://github.com/North-Western-Development/minux-toolchain-builder.

## Usage

```
Usage: build.sh [options] <command>
    <pkg> [pkgs...]         - Build specified packages
    build <pkg> [pkgs...]   - Build specified packages
    all [pkgs...]           - Build all packages (except those specified)
    all-noclean [pkgs...]   - Same as all but doesn't cleanall first
    clean <pkg> [pkgs...]   - Clean a single package
    cleanall                - Clean all packages
    dryrun [pkgs...]        - Pretend to build all packages, for debugging
    abibreak <pkg>          - ABI break helper, opens all the control files for packages
                              that depend on <pkg> and then rebuilds them
    --target                - Specify a target (default: armv6-apple-darwin9)
    --no-tmp                - Do not use /tmp for anything, use the current directory instead
    -jN                     - Set the number of jobs passed to programs like make and ninja
```

## Examples

#### Build htop
```sh
./build.sh htop
```

#### Build htop and pfetch
```sh
./build.sh htop pfetch
```

#### Build htop for x86_64-linux-musl
```sh
./build.sh --target=x86_64-linux-musl htop
```
