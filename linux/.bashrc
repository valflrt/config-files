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
source ~/.bash/functions-and-aliases.sh

# imports completion
source ~/.bash/completion/index.sh

# imports prompt styles
source ~/.bash/prompt-styles.sh

# import init sequence
source ~/.bash/init-sequence.sh