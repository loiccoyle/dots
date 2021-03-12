# Dots

## Personal dotfiles

> A clean & versatile rice.

### Screenshots

![Green](https://i.imgur.com/jG794AK.png)

![Blue](https://i.imgur.com/ml9aaRP.png)

![Black & White](https://i.imgur.com/F8VkwtS.png)

### Applications

| Purpose              | Application                                                 | Configuration            |
| ---                  | ---                                                         | ---                      |
| Window mananager     | `[BSPWM](https://github.com/baskerville/bspwm)`             | `~/.config/bspwm/`       |
| Key bindings         | `[sxhkd](https://github.com/baskerville/sxhkd)`             | `~/.config/sxhkd/`       |
| Status bar           | `[polybar](https://github.com/polybar/polybar)`             | `~/.config/polybar/`     |
| Terminal<sup>1</sup> | `[termite](https://github.com/thestinger/termite)`          | `~/.config/termite/`     |
| Browser              | `[qutebrowser](https://github.com/qutebrowser/qutebrowser)` | `~/.config/qutebrowser/` |
| Editor               | `[neovim](https://github.com/neovim/neovim)`                | `~/.config/nvim/`        |
| Compositor           | `[picom](https://github.com/yshui/picom)`                   | `~/.config/picom/`       |
| Shell                | `[zsh](https://www.zsh.org/)`                               | `~/.config/zsh/`         |
| File viewer          | `[lf](https://github.com/gokcehan/lf)`                      | `~/.config/lf/`          |
| Image viewer         | `[sxiv](https://github.com/muennich/sxiv)`                  | `~/.config/sxiv`         |
| PDF viewer           | `[zathura](https://github.com/pwmt/zathura)`                | `~/.config/zathura`      |
| Colour management    | `[flavours](https://github.com/Misterio77/flavours)`        | `~/.config/flavours`     |
| Application launcher | `[rofi](https://github.com/davatorium/rofi)`                | `~/.config/rofi`         |

<sup>1</sup>: `termite` is currently unmaintained, should be switched out for another terminal, probably `alacritty`.

### Details

* zsh:

Plugin manager: `[zinit](https://github.com/zdharma/zinit)`

Prompt: `[pure](https://github.com/sindresorhus/pure)`

Quick jump: `[fasd](https://github.com/clvv/fasd)`

* neovim:

Plugins: see the the `init.vim` file.

Lanquage Server Client: `[coc](https://github.com/neoclide/coc.nvim)`

* Keeping the `$HOME` clean:

In `~/.profile` there a a bunch of environment variables to keep files out the home dir.

* `python` dev environment:

Virtual environment: `[poetry](https://github.com/python-poetry/poetry)`
