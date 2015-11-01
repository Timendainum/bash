# James" zsh aliases and functions
echo "DUDE!"
alias diff="colordiff"              # requires colordiff package
alias grep="grep --color=auto"
#alias more="less"
alias df="df -h"
alias du="du -c -h"
alias mkdir="mkdir -p -v"
alias nano="nano -w"
alias ping="ping -c 5"
alias dmesg="dmesg -HL"
alias ls="ls -l --color=auto"
alias la="ls -A"

# -----------------------------------------------------------------------------
# Privileged access
if [ $UID -ne 0 ]; then
    alias reboot="sudo systemctl reboot"
    alias poweroff="sudo systemctl poweroff"
fi

# --------------------------------------------------------
# utility aliases
alias x="xinit -- :0 -nolisten tcp vt$XDG_VTNR"
alias music="ncmpcpp"
alias f="xfe"
echo "End dude!"