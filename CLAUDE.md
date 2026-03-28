# CLAUDE.md — Dotfiles Repository Context

This file provides context for Claude Code when working in this repository.

## What This Repository Is

Personal dotfiles for an Arch Linux desktop environment. All configuration files are prefixed with `_` in the repo and symlinked to `$HOME` (with `_` translated to `.`) by the Makefile or install scripts.

**Owner:** Joshua Adams (`n7down@gmail.com`)  
**Primary OS:** Arch Linux  
**Window manager:** bspwm  
**Shell:** Zsh (oh-my-zsh, gitster theme)  
**Editor:** Neovim  
**Terminal:** st (suckless terminal)

---

## File Naming Convention

| Repo name | Symlink target |
|---|---|
| `_zshrc` | `~/.zshrc` |
| `_gitconfig` | `~/.gitconfig` |
| `_config/nvim` | `~/.config/nvim` |
| `_bin/` | `~/.bin/` |
| `_tmux.conf.local` | `~/.tmux.conf.local` |

All `_` prefixes map to `.` prefixes at the destination. The `_config/` directory maps to `~/.config/`.

---

## Installation

The primary installer is the `Makefile`. Each tool has its own target.

```sh
make <target>     # install a specific tool
make deps         # install all Arch Linux pacman dependencies
```

Key Makefile targets:

| Target | Action |
|---|---|
| `zsh` | Installs zsh, oh-my-zsh, gitster theme, autosuggestions, symlinks .zshrc |
| `nvim` | Symlinks `_config/nvim` → `~/.config/nvim` |
| `tmux` | Clones gpakosz/.tmux, symlinks .tmux.conf.local |
| `bspwm` | Symlinks bspwm + sxhkd configs |
| `xorg` | Symlinks Xresources, xinitrc, zprofile |
| `gitconfig` | Symlinks `_gitconfig` → `~/.gitconfig` |
| `fonts` | Symlinks fonts, runs `fc-cache` |
| `bin` | Symlinks `_bin/` → `~/.bin/` |
| `deps` | `pacman -S feh git bspwm dmenu curl tmux neovim htop xorg-xbacklight ctags mpd tig ncmpcpp zsh-autosuggestions newsboat` |

The legacy `scripts/install.sh` auto-symlinks all `_*` files and installs oh-my-zsh + fzf.

---

## Directory Structure

```
dotfiles/
├── _aliases              # Shell aliases (sourced by .zshrc)
├── _bin/                 # Custom scripts → ~/.bin
├── _config/              # XDG configs (nvim, bspwm, sxhkd, polybar, rofi, tig, etc.)
├── _docker_functions     # Docker shell helpers (sourced by .zshrc)
├── _exports              # Environment variable exports (sourced by .zshrc)
├── _fonts/               # Custom fonts → ~/.local/share/fonts
├── _functions            # Shell functions (sourced by .zshrc)
├── _gdbinit              # GDB dashboard (gdb-dashboard, Python-based)
├── _gitconfig            # Git config and aliases
├── _mpd/                 # MPD music daemon config
├── _myclirc              # mycli (MySQL CLI) config
├── _ncmpcpp/             # ncmpcpp music player config
├── _path                 # PATH exports (sourced by .zshrc)
├── _screenlayout/        # xrandr screen layout scripts
├── _tmux.conf.local      # tmux local config (gpakosz/.tmux base)
├── _wallpapers/          # Wallpaper images → ~/Pictures/wallpapers
├── _xinitrc              # X11 init: loads Xresources, starts bspwm
├── _Xresources           # X11 cursor config
├── _zprofile             # Zsh login profile: sources exports/path, auto-starts X on VT1
├── _zshrc                # Main Zsh config
├── oh-my-zsh/themes/     # Custom ZSH theme: gitster
├── Makefile              # Symlink installer
├── scripts/              # Shell install scripts
├── README.md
└── CLAUDE.md             # This file
```

---

## Shell Configuration Architecture

`_zshrc` sources these files in order:

| File | Purpose |
|---|---|
| `_exports` | `$TERM=st-256color`, `$BROWSER=brave-browser`, VI cursor sequences |
| `_path` | `~/.bin`, `/usr/local/go/bin`, `$GOPATH/bin`, `~/.local/bin`, `~/.opencode/bin` |
| `_aliases` | Directory shortcuts, git shortcuts, docker aliases, awk column helpers |
| `_functions` | General shell functions (see below) |
| `_docker_functions` | Docker build/push/exec helpers |

### Key aliases

| Alias | Expands to |
|---|---|
| `g` | `git` |
| `n` / `v` | `nvim` / `vim` (also accept no args to open `.`) |
| `oc` | `opencode` |
| `srn` | `cd ~/Source/go/src/github.com/n7down` |
| `dots` | `~/Source/dotfiles` |
| `dlv-debug` | `dlv debug --headless --listen=:2345 --api-version 2 --log` |
| `dcp` | `docker-compose` |
| `dk` | `docker` |
| `c1`–`c9` | `awk '{print $N}'` column extractors |
| `xc` | `xclip -selection clipboard` |

### Key functions

| Function | Purpose |
|---|---|
| `v` / `sv` | vim / sudo vim (no args = open current dir) |
| `n` / `sn` | nvim / sudo nvim (no args = open current dir) |
| `calc` | Shell calculator using `bc` |
| `mkd` | `mkdir -p` then `cd` |
| `fs` | File/directory size via `du` |
| `wea` | Weather via `wttr.in` (default: Lehi, Utah) |
| `cs` | Generate ctags + cscope index for C/C++ |
| `extract` | Universal archive extractor |
| `countdown` / `stopwatch` | Timer utilities |
| `ssh-setup` | Start ssh-agent and add `~/.ssh/id_ed25519` |
| `docker-start/stop/status` | systemctl wrappers for Docker |
| `mount-usb` / `umount-usb` | Mount/unmount `/dev/sdc` at `/media/usb-drive` |
| `get-external-ip` | External IP via opendns |
| `all-git-status` | Git status for all repos under `~` |

---

## Git Configuration

Config in `_gitconfig`. Default editor is `nvim`. Credential cache timeout: 8 hours.

### Git aliases (used via `g` alias)

| Alias | Command |
|---|---|
| `g s` | `status -s` |
| `g l` | Pretty one-line log |
| `g lg` / `lg1` / `lg2` / `lg3` | Color-coded graph logs |
| `g co` | `checkout` |
| `g cob` | `checkout -b` |
| `g ap` | `add -p` |
| `g cm` | `commit -m` |
| `g cam` | `commit -a -m` |
| `g d` / `ds` / `dc` | `diff` / `diff --stat` / `diff --cached` |
| `g st` | `stash` |
| `g go` | Smart checkout (creates branch if it doesn't exist) |
| `g dm` | Delete merged branches |
| `g reb` | Interactive rebase (`HEAD~N`) |
| `g fb` / `ft` / `fc` / `fm` | Find by branch / tag / code / commit message |
| `g p` | `push && push --tags` |

---

## Neovim Configuration

Config at `_config/nvim/init.vim`. Uses vim-plug (auto-installs on first run).

- **Leader key:** `,`
- **Theme:** codedark (VS Code Dark+)
- **File tree:** NERDTree (`F2` toggle, `F3` tab toggle)
- **Tags:** Tagbar (`F4`)
- **Fuzzy finder:** fzf + fzf.vim (uses `ag`/`rg` if available)
- **Linting:** ALE — Go: `golint`, `go vet`
- **Go support:** vim-go — `goimports` on save, GoDecls, metalinter, full syntax highlighting
- **Git:** vim-fugitive, vim-gitgutter, vim-rhubarb (`:GBrowse`)
- **Snippets:** UltiSnips + vim-snippets
- **Status bar:** vim-airline with powerline symbols
- **Motion:** vim-easymotion (`<Leader>j` / `<Leader>k`)

---

## Display / Hardware Setup

Three display configurations managed by `_screenlayout/` scripts and `_bin/` helpers:

| Config | Displays |
|---|---|
| Laptop only | eDP1 @ 1920×1080 |
| + Samsung 32" | eDP1 + DP2-2 (2560×1440) |
| + Wacom Cintiq 13HD | eDP1 + DP2-1 |

Polybar has a named bar profile for each display. `_bin/wacom` and `_bin/samsung-32` configure xrandr + xsetwacom.

---

## Development Environment

- **Language focus:** Go (`GOPATH` configured, vim-go, Delve debugger)
- **Go source root:** `~/Source/go/src/github.com/n7down` (alias: `srn`)
- **Debugger:** `dlv-debug` alias starts Delve headless on port 2345
- **C/C++ indexing:** `cs` function generates cscope + ctags

---

## Tmux

Uses [gpakosz/.tmux](https://github.com/gpakosz/.tmux) as base (`~/.tmux.conf` is a symlink to that repo). Local overrides in `_tmux.conf.local`:

- Active pane border: light blue (`#00afff`)
- Status left: `session:window | uptime`
- Status bar background: `#080808`
- Battery bar with gradient palette
- 24-hour clock, no mouse mode

---

## Music Stack

- **MPD** daemon on port 6600, config in `_mpd/`
- **ncmpcpp** player, config + keybindings in `_ncmpcpp/`
- **Polybar** shows now-playing with progress bar in the center module
- **Newsboat** subscribed to 24 podcast feeds, config in `_config/newsboat/`

---

## Notes for Claude

- When adding a new tool's config, follow the `_` prefix convention and add a corresponding `make <target>` to the Makefile.
- The Makefile uses `pacman` — this repo targets Arch Linux.
- Symlinks use `ln -sf` (force overwrite), so re-running `make <target>` is safe.
- `scripts/install.sh` is a legacy cross-platform script; prefer the Makefile for new work.
- Do not add secrets, tokens, or credentials to any tracked file.
- The `_bin/lock` script requires `scrot`, `imagemagick`, and `i3lock`.
- SSH key in use: `~/.ssh/id_ed25519`.
