#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
# when changing this file plase run 'src' on the command line after each save.

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
MAILCHECK=0

# autoload -U colors
#colors

HISTFILE=~/.zsh.hist
HISTSIZE=5000
SAVEHIST=5000
setopt autocd extendedglob notify
#set VIM keybindings
#bindkey -v
#set EMACS keybindings
bindkey -e
# End of lines configured by zsh-newuser-install

# to enable themes we need a functionsdir
fpath=(~/.zshfn $fpath)
autoload -U promptinit
promptinit

# Get my personal aliasses from my homedir
if [[ -r ~/.zsh.alias ]]; then
  echo "Loading aliasses ... "
	. ~/.zsh.alias
fi

# Get some host specific settings from .zsh.host
if [[ -r ~/.zsh.host ]]; then
  echo "Loading host specific settings ... "
	. ~/.zsh.host
fi

# Get some web development specific settings from .zsh.web
if [[ -r ~/.zsh.web ]]; then
  echo "Loading webserver specific settings ... "
	. ~/.zsh.web
fi

# Let the user know we're finished setting up
echo "Goodday $USER I'm done setting up environment."

if [ -n "$SSH_CLIENT" -a -z "$SSH_SCREEN" ]; then
  fromhost=`who|sed -n 's,.*(\([^:]*\)).*,\1,p'`
  echo "Logged in from host"
  if [[ "$fromhost" == *vpn.gx.nl* ]]; then
    echo "Logged in from <GX>"
    export SSH_SCREEN="iscreenset"
    exec screen -RR
  fi
fi

## invoke this every time when u change .zshrc to
## recompile it.
src ()
{
    autoload -U zrecompile
    [ -f ~/.zshrc ] && zrecompile -p ~/.zshrc
    [ -f ~/.zcompdump ] && zrecompile -p ~/.zcompdump
    [ -f ~/.zshrc.zwc.old ] && rm -f ~/.zshrc.zwc.old
    [ -f ~/.zcompdump.zwc.old ] && rm -f ~/.zcompdump.zwc.old
    source ~/.zshrc
}

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
