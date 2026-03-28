# Dotfiles

Personal dotfiles for an Arch Linux development environment, targeting a bspwm tiling window manager setup with Neovim, Zsh, and Go development tooling.

## Contents

- [Structure](#structure)
- [Tools Configured](#tools-configured)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Shell Configuration](#shell-configuration)
- [Custom Scripts](#custom-scripts)
- [Screen Layouts](#screen-layouts)

---

## Structure

All dotfiles are prefixed with `_` in the repository. Install scripts translate `_` → `.` when creating symlinks in `$HOME`.

```
dotfiles/
├── _aliases              # Shell aliases
├── _bin/                 # Custom scripts installed to ~/.bin
├── _config/              # XDG config entries (nvim, bspwm, sxhkd, polybar, rofi, tig, etc.)
├── _docker_functions     # Docker shell helpers
├── _exports              # Environment variable exports
├── _fonts/               # Custom fonts
├── _functions            # General shell functions
├── _gdbinit              # GDB dashboard (gdb-dashboard)
├── _gitconfig            # Git config and aliases
├── _mpd/                 # MPD music daemon config
├── _myclirc              # mycli (MySQL CLI) config
├── _ncmpcpp/             # ncmpcpp music player config
├── _path                 # PATH exports
├── _screenlayout/        # xrandr screen layout scripts
├── _tmux.conf.local      # tmux local customization (gpakosz/.tmux base)
├── _wallpapers/          # Wallpaper images
├── _xinitrc              # X11 init (loads Xresources, starts bspwm)
├── _Xresources           # X11 cursor config
├── _zprofile             # Zsh login profile (auto-starts X on VT1)
├── _zshrc                # Zsh config
├── oh-my-zsh/themes/     # Custom ZSH theme: gitster
├── Makefile              # Symlink installer
└── scripts/              # Installation shell scripts
```

---

## Tools Configured

### Shell — Zsh
- Framework: oh-my-zsh with custom `gitster` theme
- Plugins: `zsh-autosuggestions`, `autojump`, `docker`, `httpie`, `vi-mode`
- FZF integration, menu-select completion
- Auto-starts X on VT1 via `_zprofile`

### Editor — Neovim
Config at `_config/nvim/init.vim` using vim-plug:

| Plugin | Purpose |
|---|---|
| NERDTree | File tree (F2/F3) |
| fzf + fzf.vim | Fuzzy finder with ag/rg |
| ALE | Linting (Go: golint, go vet) |
| vim-airline | Status bar with powerline symbols |
| vim-go | Go development (goimports, GoDecls, metalinter) |
| vim-fugitive + vim-gitgutter | Git integration |
| UltiSnips | Snippets |
| Tagbar | Tag browser (F4) |
| codedark | VS Code Dark+ theme |
| vim-easymotion | Motion (`<Leader>j/k`) |

Leader key: `,`

### Window Manager — bspwm
- 10 desktops on LVDS-1
- Border width: 2px, gap: 7px
- Starts: sxhkd, polybar, feh (wallpaper)

### Hotkeys — sxhkd

| Binding | Action |
|---|---|
| `Super+Enter` | `st` terminal |
| `Super+Shift+Enter` | Brave browser |
| `Super+Space` | Rofi launcher |
| `Super+Shift+Space` | dmenu_sys (power menu) |
| `Super+Shift+m` | ncmpcpp |
| `Super+Shift+n` | nnn file manager |
| `Super+hjkl` | vi-style window focus/swap |
| Multimedia keys | Volume (amixer), brightness (xbacklight) |

### Status Bar — Polybar
- Modules: bspwm workspaces, CPU, memory, filesystem, backlight, MPD, WiFi, battery, clock
- Font Awesome 5 icons
- Profiles for laptop, Samsung 32", Wacom Cintiq displays
- Smart multi-monitor launch script

### Git
Aliases defined in `_gitconfig`:

| Alias | Command |
|---|---|
| `g s` | status |
| `g l` | log |
| `g co` | checkout |
| `g cob` | checkout -b (new branch) |
| `g ap` | add -p |
| `g cam` | commit -am |
| `g lg1/lg2/lg3` | Color-coded graph log |
| `g dm` | Delete merged branches |
| `g reb` | Interactive rebase |

Default editor: nvim. Credential cache: 8-hour timeout.

### Tmux
Uses [gpakosz/.tmux](https://github.com/gpakosz/.tmux) as the base. Local customizations in `_tmux.conf.local`:
- Light blue active pane border
- Status: `session:window | uptime`
- Battery bar with gradient palette
- 24-hour clock, no mouse mode

### Rofi
- Modes: run, drun, window
- Font: Source Code Pro for Powerline Regular 8
- Terminal: `st`
- Dark theme matching bspwm border color

### Tig
- Vi-style `hjkl` keybindings
- Custom git commands: cherry-pick, stash pop/drop, branch checkout/delete
- Vertical split, auto-refresh every 10s

### GDB
Full [gdb-dashboard](https://github.com/cyrus-and/gdb-dashboard) setup via `_gdbinit`:
- Source, assembly, stack, memory, and expression history views
- Pygments syntax highlighting
- Auto-loads modules from `~/.gdbinit.d/`

### Music
- MPD daemon (port 6600) + ncmpcpp player
- Polybar now-playing module with progress bar
- Newsboat with 24 podcast RSS feeds

### Database CLIs
- **mycli** (`_myclirc`): vi keybindings, monokai syntax, vertical table format
- **pgcli** (`_config/pgcli/config`): PostgreSQL CLI config

---

## Prerequisites

- [Git](https://git-scm.com/)
- [Arch Linux](https://archlinux.org/) (Makefile targets use `pacman`)
- Core tools: `zsh`, `neovim`, `bspwm`, `sxhkd`, `polybar`, `rofi`, `feh`, `st`, `tmux`, `fzf`

Install all Arch dependencies at once:

```sh
make deps
```

---

## Installation

### Full setup via Makefile

```sh
git clone https://github.com/n7down/dotfiles.git ~/Source/dotfiles
cd ~/Source/dotfiles
make <target>
```

Individual targets:

| Target | What it does |
|---|---|
| `make zsh` | Installs zsh, oh-my-zsh, gitster theme, autosuggestions, symlinks .zshrc |
| `make nvim` | Symlinks `_config/nvim` to `~/.config/nvim` |
| `make tmux` | Clones gpakosz/.tmux, symlinks .tmux.conf.local |
| `make bspwm` | Symlinks bspwm + sxhkd configs |
| `make xorg` | Symlinks Xresources, xinitrc, zprofile |
| `make fonts` | Symlinks fonts directory, runs `fc-cache` |
| `make deps` | Installs all Arch dependencies via pacman |

### Legacy script installer

```sh
./scripts/install.sh
```

Auto-symlinks all `_*` files, installs oh-my-zsh, fzf, and sets zsh as default shell.

### Uninstall

```sh
./scripts/uninstall.sh
```

Removes all symlinked dotfiles, `~/.oh-my-zsh`, `~/.config`, and `~/.bin`.

---

## Shell Configuration

The Zsh config is split into sourced files:

| File | Purpose |
|---|---|
| `_aliases` | Directory shortcuts, git, docker, awk column helpers, ctags |
| `_exports` | Terminal (`st`), browser (`brave-browser`), VI cursor, ZSH path |
| `_path` | PATH: `~/.bin`, Go (`/usr/local/go/bin`, `$GOPATH/bin`), `~/.local/bin`, opencode |
| `_functions` | `v`/`n` (vim/nvim), `calc`, `mkd`, `wea` (weather), `extract`, `countdown`, `stopwatch`, docker helpers, USB mount/unmount |
| `_docker_functions` | Docker build+push helpers, exec shortcuts, container lifecycle management |

---

## Custom Scripts

Scripts in `_bin/` are symlinked to `~/.bin`:

| Script | Purpose |
|---|---|
| `dmenu_sys` | Rofi power menu: shutdown / reboot / logout |
| `lock` | Pixelated blur screen lock (scrot + ImageMagick + i3lock) |
| `sys_backup` | Full system rsync backup to `/media/backup` |
| `sys_restore` | System restore |
| `wacom` | Wacom Cintiq 13HD xrandr + xsetwacom setup/teardown |
| `samsung-32` | Samsung 32" monitor helper |
| `tldr` | tldr client (man page summaries) |
| `cht` | cht.sh cheat sheet client |
| `dump-mysql-schema.sh` | MySQL schema dump utility |
| `dump-mysql-tables.sh` | MySQL tables dump utility |

---

## Screen Layouts

xrandr scripts in `_screenlayout/`:

| Script | Configuration |
|---|---|
| `laptop.sh` | Single screen: eDP1 at 1920×1080 |
| `samsung-32.sh` | Dual: eDP1 (1920×1080) + DP2-2 Samsung 32" (2560×1440) |
| `wacom.sh` | Wacom Cintiq 13HD on DP2-1 |
