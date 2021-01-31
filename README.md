# Simple khard integration for rofi

This provides a really simple modus for [rofi][rofi] to integrate
contacts from [khard][khard]. The motivation for this is that, coming
from macOS I was spoilt by the contacts integration [Alfred][alfred]
had. I'm forever looking up phone numbers and email addresses and just
wanted them to be easily accessible (and copyable).

## TODO

- [x] Basic script with emails and phone numbers
- [ ] Package the modus so it is installable
- [ ] Create a PKGBUILD so it is `pacman` installable
- [ ] Make it possible to include addresses as well as emails and phones

## Requirements

* `X11` and `xclip` for copying to the clipboard
* `python3` and `pyyaml` to interpret the `khard` output
* `zsh` for the main script
* `khard`, obviously, otherwise there's not much point

## Installation

TODO

## Usage

When the modus first runs it provides a list of all contact names (as
per the `formatted_name`). When you hit `enter` on one of your contacts,
it will show phone numbers and email addresses (using the labels in your
contacts). If you hit `enter` on one of those then it will copy to the
clipboard using `xclip`.

    rofi -modi contacts:/path/to/rofi-khard/rofi_khard.sh -show contacts

[rofi]: https://github.com/davatorium/rofi
[khard]: https://github.com/scheibler/khard/
[alfred]: https://www.alfredapp.com/
