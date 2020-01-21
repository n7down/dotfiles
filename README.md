# Dotfiles
A collection of my dotfiles that include tricks to hacking on Linux. 

## Prerequisites
1. [Git](https://git-scm.com/)

## Todo
- [ ] st
 - [Luke Smith st](https://github.com/LuckSmithxyz/st)
- [x] bspwm
- [ ] nvim
- [ ] dmenu
 - [ ] Customize dmenu colors
- [ ] [Lock desktop via smart watch](https://www.reddit.com/r/unixporn/comments/e65cb1/ticwatch_pro_launching_scripts_from_smartwatch/)
- [ ] lemonbar
 - [x] Use lemonbar-script.sh
 - [ ] Use [bitmap-fonts](https://github.com/Tecate/bitmap-fonts)
- [x] [powerline-extra-symbols](https://github.com/ryanoasis/powerline-extra-symbols)
- [ ] All install scripts use one `install.sh` that args - i.e. `install.sh tmux`
- [x] tmux
 - [x] [.tmux](https://github.com/gpakosz/.tmux)
 - [x] Need to figure out the best font in st for displaying powerline `\` fonts

## Notes
```
# Use colourxxx with tmux
for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
	done
```
