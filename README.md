# Personal dotfiles

> A clean & versatile rice.

These are my personal dotfiles, feel free to take inspiration.

## Installation

```shell
curl -L loiccoyle.com/dots/install | bash
```

This will clone the repository into your `$HOME` and will create the git dir at `~/.dotfiles`. It will also move any conflicting files into `~/.config-backup`

Check `~/.config/Makefile` to install dependencies (requires `paru`).

> Disclaimer: don't run a random person's code without understanding [it](https://github.com/loiccoyle/dots/blob/gh-pages/install).

### Screenshots

![Green](https://i.imgur.com/jG794AK.png)

![Blue](https://i.imgur.com/ml9aaRP.png)

![Black & White](https://i.imgur.com/F8VkwtS.png)

### Applications

| Purpose              | Application                                                 | Configuration            |
| -------------------- | ----------------------------------------------------------- | ------------------------ |
| Window mananager     | [`BSPWM`](https://github.com/baskerville/bspwm)             | `~/.config/bspwm/`       |
| Key bindings         | [`sxhkd`](https://github.com/baskerville/sxhkd)             | `~/.config/sxhkd/`       |
| Status bar           | [`polybar`](https://github.com/polybar/polybar)             | `~/.config/polybar/`     |
| Terminal             | [`alacritty`](https://github.com/alacritty/alacritty)       | `~/.config/alacritty/`   |
| Browser              | [`qutebrowser`](https://github.com/qutebrowser/qutebrowser) | `~/.config/qutebrowser/` |
| Editor               | [`neovim`](https://github.com/neovim/neovim)                | `~/.config/nvim/`        |
| Compositor           | [`picom`](https://github.com/yshui/picom)                   | `~/.config/picom/`       |
| Shell                | [`zsh`](https://www.zsh.org/)                               | `~/.config/zsh/`         |
| File viewer          | [`lf`](https://github.com/gokcehan/lf)                      | `~/.config/lf/`          |
| Image viewer         | [`sxiv`](https://github.com/muennich/sxiv)                  | `~/.config/sxiv/`        |
| PDF viewer           | [`zathura`](https://github.com/pwmt/zathura)                | `~/.config/zathura/`     |
| Colour management    | [`flavours`](https://github.com/Misterio77/flavours)        | `~/.config/flavours/`    |
| Application launcher | [`rofi`](https://github.com/davatorium/rofi)                | `~/.config/rofi/`        |

### Details

- **Wallpapers**:
  - My wallpapers can be found [here](https://loiccoyle.com/walls).
- **zsh**:
  - Plugin manager: [`zinit`](https://github.com/zdharma/zinit)
  - Prompt: [`pure`](https://github.com/sindresorhus/pure)
  - Quick jump: [`fasd`](https://github.com/clvv/fasd)
- **neovim**:
  - Plugin manager: [`packer.nvim`](https://github.com/wbthomason/packer.nvim)
- **Keeping the `$HOME` clean**:
  - In `~/.profile` there are a bunch of environment variables to keep files out of the home dir.
- **`python` dev environment**:
  - Virtual environment: [`poetry`](https://github.com/python-poetry/poetry)
- **Maintaining dotfiles**:
  - These dotfiles are maintained using a [git bare repository](https://www.atlassian.com/git/tutorials/dotfiles).
