# chpath

[![Shelly CI](https://github.com/ronchi-oss/chpath/actions/workflows/shelly-ci.yml/badge.svg)](https://github.com/ronchi-oss/chpath/actions/workflows/shelly-ci.yml)

`chpath` is a POSIX shell utility that allows editing the current shell PATH with ease by providing a simple API to it.

```
$ chpath help
Usage: chpath <command> [arguments]

Available commands:

	edit    Edit PATH entries with EDITOR
	list    Print PATH entries to stdout
	pop     Pop <count> entries from PATH
	push    Push <entries> to PATH

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

## Installation from source

The installation consists of building two shell scripts: `chpath.sh`, to be sourced by our login shell, and, optionally, `chpath-completion.bash`, for enabling tab completion (on bash).

```
git clone https://github.com/ronchi-oss/chpath.git
cd chpath
shelly install chpath.sh main
shelly install chpath-completion.bash bash_completion
```
