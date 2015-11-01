# James" zsh aliases and functions
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

    # -----------------------------------------------------------------------------
    # pacman aliases (if desired, adapt for your favourite AUR helper)
    alias pac="/usr/bin/yaourt -Sa"         # default action    - install one or more packages
    alias pacu="/usr/bin/yaourt -Syua"      # '[u]pdate'        - upgrade all packages to their newest version
    alias pacr="/usr/bin/yaourt -Rns"       # '[r]emove'        - uninstall one or more packages
    alias pacs="/usr/bin/yaourt -Ss"        # '[s]earch'        - search for a package using one or more keywords
    alias paci="/usr/bin/yaourt -Si"        # '[i]nfo'      - show information about a package
    alias paclo="/usr/bin/yaourt -Qdt"      # '[l]ist [o]rphans'    - list all packages which are orphaned
    alias pacc="/usr/bin/yaourt -Scc"       # '[c]lean cache'   - delete all not currently installed package files
    alias paclf="/usr/bin/yaourt -Ql"       # '[l]ist [f]iles'  - list all files installed by a given package
    alias pacexpl="sudo /usr/bin/pacman -D --asexp" # 'mark as [expl]icit'  - mark one or more packages as explicitly installed 
    alias pacimpl="sudo /usr/bin/pacman -D --asdep" # 'mark as [impl]icit'  - mark one or more packages as non explicitly installed
    alias paca="sudo /usr/bin/pacman -U"        # install AUR package
    alias pacqs="/usr/bin/yaourt -Qs"           # default

    # -----------------------------------------------------------------------------
    # '[r]emove [o]rphans' - recursively remove ALL orphaned packages
    alias pacro="/usr/bin/yaourt -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"
fi

# --------------------------------------------------------
# utility aliases
alias x="xinit -- :0 -nolisten tcp vt$XDG_VTNR"
alias f="xfe &"
