#
# ~/.bash_profile
#
export PATH=$PATH:/home/vijay/.local/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi
. "$HOME/.cargo/env"
