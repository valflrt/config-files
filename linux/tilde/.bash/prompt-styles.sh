git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

fileAmount() {
    ls -1 | wc -l | sed 's: ::g'
}

dirSize() {
    ls -lah | grep -m 1 total | sed 's/total //'
}

battery() {
    cat /sys/class/power_supply/BAT0/capacity
}

length() {
    expr length "$1"
}

# text styling

underline() {
    tput smul
}

bold() {
    tput bold
}

blink() {
    tput blink
}

dim() {
    tput dim
}

# tput bold – Set bold mode
# tput dim – turn on half-bright mode
# tput smul – begin underline mode
# tput rmul – exit underline mode
# tput rev – Turn on reverse mode
# tput smso – Enter standout mode (bold on rxvt)
# tput rmso – Exit standout mode
# tput sgr0 – Turn off all attributes

bgc() {
    tput setab $1
}

fgc() {
    tput setaf $1
}

bold() {
    tput bold
}

underline() {
    tput smul
}

reset() {
    tput sgr0
}

execStatus() {
    if [ \$? = 0 ];
    then printf "$(fgc 1)×$(reset)";
    else
        printf "$(fgc 2)✓$(reset)";
    fi
}

prompt1="\n \[$(fgc 0 && bgc 5)\] \W \[$(reset)\] - "
prompt7="\n \[$(bgc 5 && fgc 0 && bold)\] \u \[$(reset && bgc 2 && fgc 5)\]◤\[$(fgc 0 && bgc 2)\] \W \[$(bgc 4 && fgc 2)\]◤\[$(fgc 0 && bgc 4)\] \$(fileAmount) items \[$(reset)\] - "
prompt2="\n \[\e[0;33m\]◢\[\e[43;30m\] \W \[\e[0;33m\]◤\[\e[0m\] \[\e[34m\]➜\[\e[0m\]  "
prompt3="\n ╭  \[\e[35m\]$(bold)\W$(reset) \[\e[34m\]・\[\e[0m\] \[\e[33m\]$(bold)\$(fileAmount)$(reset)\[\e[0m\] files → \[\e[33m\]$(bold)$(dirSize)B$(reset)\[\e[0m\] \[\e[34m\]・\[\e[0m\] \[\e[32m\]$(bold)$(battery)%$(reset)\[\e[0m\]\n │\n ╰  "
prompt4="\n \[\e[0;33m\]◢\[\e[43;30m\] \h \[\e[44;33m\]◤\[\e[44;30m\] \u \[\e[45;34m\]◤\[\e[45;30m\] \W \[\e[47;35m\]◤\[\e[47;30m\] $(git_branch) \[\e[0;37m\]◤\[\e[0m\] "
prompt5="╭ \w\n├ \u ─ \A\n│\n╰ "
prompt6="\[\033[00m\] \n\[\033[30;45m\] \T \[\033[00m\]\[\033[30;46m\] \h@\u \[\033[00m\]\[\033[37;44m\] \w \[\033[1;00m\] "

PS1=$prompt7
