#PS_0="\[\e]0;\u@\h: \w\a\]\[\033[01;36m\]╭─ \u@\h\[\033[00m\] in \[\033[01;32m\]\w\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\033[38;5;11m \1/')\n\[\033[01;36m\]╰─ "

PS_0="\[\e]0;\u@\h: \w\a\]\[\033[01;97m\]⌠\[\033[01;38;5;48m\]\u@\h\[\033[0;97m\] in \[\033[01;38;5;48m\]\w \[\033[0;97m\]\t\n"

#PS_1="$PSλ\[\033[00m\] "

PS_1="\[\033[01;97m\]⌡\[\033[01;38;2;23;147;209m\]Λ\[\033[00m\] "

#prompt
make_prompt()
{
    PS1=$PS_0

    if git rev-parse --is-inside-work-tree > /dev/null 2>&1
    then
        PS1+="\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\\033[01;97m│\\033[38;5;45m\1/')\n"
    fi

    PS1+=$PS_1
}

setps1()
{
    PS_1="\[\033[01;97m\]⌡\[\033[[38;5;4m\]$1\[\033[00m\] "
}


PROMPT_COMMAND=make_prompt

PROMPT_DIRTRIM=2
