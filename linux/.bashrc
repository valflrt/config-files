# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# imports history config
source ~/.bash/history.sh

# import miscellaneous config
source ~/.bash/misc.sh

# imports color config
source ~/.bash/colors.sh

# imports aliases config
source ~/.bash/aliases.sh

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# imports completions
source ~/.bash/completion/gh.sh

# imports prompt styles
source ~/.bash/prompt-styles.sh

# import init sequence
source ~/.bash/init-sequence.sh