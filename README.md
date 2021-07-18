# youtube-mode

A YouTube mode for [Tridactyl](https://github.com/tridactyl/tridactyl).

## Usage

Whenever a YouTube watch page is loaded, `youtube-mode` will
automatically be enabled. This simply enables the default YouTube
keybindings.

The escape hatch is `<ESC>`.

## Installation

Copy the contents of `src/` to your `~/.config/tridactyl/`, and add
the following to a (possibly new) `~/.config/tridactyl/tridactylrc`:

```
source ~/.config/tridactyl/youtube-mode
```

A binding to re-enter `youtube-mode` after exiting can be set like so:

```
bind yt mode youtube-mode
```

This is not done by default to prevent clutter.
