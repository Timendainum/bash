#
# ~/.bash_profile
#

# environment variables
export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gedit'; else echo 'nano'; fi)"	# gedit, nano
export WINEARCH=win32

#run bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
