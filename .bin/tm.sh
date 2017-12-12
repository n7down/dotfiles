#!/bin/zsh
tmux splitw -v
tmux splitw -v
tmux splitw -t 3 -h -d
tmux select-pane -t 2
tmux send-keys -t 1 "voltron view command 'source list -a \$rip -c 25' --lexer c" Enter
tmux send-keys -t 4 "voltron view command 'frame variable' --lexer c" Enter
tmux send-keys -t 3 'voltron view b' Enter
tmux send-keys -t 2 'lldb ' $1 Enter

#tmux send-keys "voltron view command 'source list -a $rip -c 25' --lexer c" Enter
#tmux select-pane -t 2
#tmux send-keys "voltron view 'frame variable' --lexer c" Enter
#tmux select-pane -t 4
#tmux send-keys "voltron view b" Enter
#tmux select-pane -t 2
#tmux send-keys "lldb" Enter


#tmux send-keys -t 3 C-z 'tmux splitw -h' Enter
#tmux send-keys -t 1 C-z "voltron view command 'source list -a $rip -c 25' --lexer c" Enter
#tmux send-keys -t 2 C-z "voltron view 'frame variable' --lexer c" Enter
#tmux send-keys -t 4 C-z "voltron view b" Enter
#tmux send-keys -t 2 C-z "lldb" Enter
