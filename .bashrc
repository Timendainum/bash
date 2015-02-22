#
# ~/.bashrc
#

# -----------------------------------------------------------------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# functions

# -----------------------------------------------------------------------------
# old set prompt function
set_prompt () {
    local Last_Command=$? # Must come first!
    local Blue='\[\e[01;34m\]'
    local White='\[\e[01;37m\]'
    local Red='\[\e[01;31m\]'
    local Green='\[\e[01;32m\]'
    local Reset='\[\e[00m\]'
    local FancyX='\342\234\227'
    local Checkmark='\342\234\223'

    # Add a bright white exit status for the last command
    PS1="$White\$? "

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w \\\$$Reset "
}

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
# script

# -----------------------------------------------------------------------------
## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
# }}}

# -----------------------------------------------------------------------------
# Privileged access
if [ $UID -ne 0 ]; then
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
fi

# -----------------------------------------------------------------------------
## ls ## {{{
alias ls='ls -l --color=auto'
alias la='ls -A'
# }}}

# -----------------------------------------------------------------------------
# pacman aliases (if desired, adapt for your favourite AUR helper)
alias pac="/usr/bin/yaourt -Sa"			# default action	- install one or more packages
alias pacu="/usr/bin/yaourt -Syua"		# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="/usr/bin/yaourt -Rns"		# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/yaourt -Ss"		# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/yaourt -Si"		# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/yaourt -Qdt"		# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="/usr/bin/yaourt -Scc"		# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/yaourt -Ql"		# '[l]ist [f]iles'	- list all files installed by a given package
alias pacexpl="sudo /usr/bin/pacman -D --asexp"	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
alias pacimpl="sudo /usr/bin/pacman -D --asdep"	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed
alias paca="sudo /usr/bin/pacman -U"		# install AUR package
alias pacqs="/usr/bin/yaourt -Qs"			# default

# -----------------------------------------------------------------------------
# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="/usr/bin/yaourt -Qtdq > /dev/null && sudo /usr/bin/pacman -Rns \$(/usr/bin/pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# -----------------------------------------------------------------------------
# ssh aliases
alias sshminer="ssh james@miner.syndicate23.com"
alias sshwintermute="ssh root@wintermute.syndicate23.com"

export PATH=$PATH:/home/james/bin
export PATH=$PATH:/opt/brlcad/bin
export EDITOR=nano

# -----------------------------------------------------------------------------
# set up prompt
source /usr/share/git/completion/git-prompt.sh
[[ -f ~/.bash_colors ]] && . ~/.bash_colors
[[ -f ~/.bash_ps1 ]] && . ~/.bash_ps1


#PROMPT_COMMAND='set_prompt'
