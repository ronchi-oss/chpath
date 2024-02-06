# chpath

[![Shelly CI](https://github.com/ronchi-oss/chpath/actions/workflows/shelly-ci.yml/badge.svg)](https://github.com/ronchi-oss/chpath/actions/workflows/shelly-ci.yml)

`chpath` is a POSIX shell utility that allows editing the current shell PATH with ease by providing a simple API to it. In fact, as long as the variable value follows the `<path1>:<path2>:<pathN>` notation, `chpath` can operate on any variable name (e.g. `INFOPATH`, `MANPATH`) by providing the `-n <VAR_NAME>` option. For simplicity's sake, the variable that `chpath` operates on is called `PATH` throughout most of this documentation or the embedded help system.

```
$ chpath help
Usage: chpath [-n <VAR_NAME>] <command> [arguments]

Available commands:

	edit    Edit PATH entries with EDITOR
	list    Print PATH entries to stdout
	pop     Pop <count> entries from PATH
	push    Push <entries> to PATH

Global options:

	-n <VAR_NAME>
	If set, operates on <VAR_NAME> instead of PATH

Run "chpath help <command>" for further information about a command.
```

## Intended usage

In interactive shell sessions, all 4 commands may prove useful. For `.profile` shell files, consider using `chpath push`. For instance, for adding both `$HOME/.config/bin` and `$HOME/go/bin` as top-most and second top-most directories to the path:

```
$ chpath push $HOME/go/bin $HOME/.config/bin

$ chpath list
$HOME/.config/bin
$HOME/go/bin
...

$ echo $PATH
$HOME/.config/bin:$HOME/go/bin:...
```

## Installation

Since `chpath` is a POSIX shell **function** that modifies the current shell environment, installation methods require, as a last step, that your shell of choice sources `chpath.sh` in its `.profile` file (or equivalent depending on shell/system).

### Homebrew

```
brew tap ronchi-oss/tap
brew install chpath

# then source `chpath.sh` from your ~/.profile (or similar)
# this assumes you have also exported HOMEBREW_PREFIX as per `brew shellenv`
source "$HOMEBREW_PREFIX/opt/chpath/src/chpath.sh"
```

Note: the chpath homebrew formula builds, installs and sources the bash shell completion; no manual step required.

### From source

The installation consists of building two shell scripts: `chpath.sh`, to be sourced by a (login) shell, and, optionally, `chpath-completion.bash`, for enabling tab completion (on bash). Building `chpath` requires [shelly](https://github.com/ronchi-oss/shelly). The steps below assume `SHELLY_BIN` is set and that your (login) shell loads files placed in there.

Builds and installs the scripts under `SHELLY_BIN`:

```sh
git clone https://github.com/ronchi-oss/chpath.git
cd chpath
shelly install chpath.sh main
shelly install chpath-completion.bash bash_completion
```

Required to source the `chpath` function into all shell sessions:

```sh
for file in $SHELLY_BIN/*.sh; do
    source "$file"
done
```

Optionally, load bash shell completion into all shell sessions:

```sh
for path in $SHELLY_BIN/*-completion.bash; do
    source "$path"
done
```
