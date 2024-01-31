### Custom bash config

#defaults
#PS_0="\[\e]0;\u@\h: \w\a\]\[\033[01;36m\]╭─ \u@\h\[\033[00m\] in \[\033[01;32m\]\w\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\033[38;5;11m \1/')\n\[\033[01;36m\]╰─ "

PS_0="\[\e]0;\u@\h: \w\a\]\[\033[01;97m\]⌠\[\033[01;38;5;48m\]\u@arch\[\033[0;97m\] in \[\033[01;38;5;48m\]\w \[\033[0;97m\]\t\n"

#PS_1="$PSλ\[\033[00m\] "

PS_1="\[\033[01;97m\]⌡\[\033[01;36m\]Λ\[\033[00m\] "

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

export LIBRARY_PATH=/usr/local/lib

#startup
#clear

#compile c++ file
cppc()
{
    if [[ $# -eq 1 ]]
    then
	g++ $1.cpp -o $1.out
    elif [[ $# -eq 2 ]]
    then
	g++ $1.cpp -o $2.out
    fi
}

#run c++ file
cppr()
{
    if [[ $# -eq 0 ]]
    then
	./a.out
    elif [[ $# -eq 1 ]]
    then
	./$1.out
    fi
}

#compile c++ file, run it &  delete .out file
cpp()
{
    arg=$1
    for (( i=0; i<${#arg}; i++ )); do
	if [[ "${arg:$i:1}" = "c" ]]
	then
	    if [[ $# -eq 2 ]]
	    then
	       cppc $2
	    elif [[ $# -eq 3 ]]
	    then
		cppc $2 $3
	    fi
	elif [[ "${arg:$i:1}" = "r" ]]
	then
	    if [[ $# -eq 2 ]]
	    then
		cppr $2
	    elif [[ $# -eq 3 ]]
	    then
		cppr $3
	    fi
	elif [[ "${arg:$i:1}" = "d" ]]
	then
	    if [[ $# -eq 2 ]]
	    then
		rm $2.out
	    elif [[ $# -eq 3 ]]
	    then
		rm $3.out 
	    fi
	fi
    done
}

#compile haskell file
hsc()
{
    ghc $1.hs
}

#run haskell file
hsr()
{
    ./$1
}

#compile haskell file, run it & delete the executable file
hs()
{
    arg=$1
    for (( i=0; i<${#arg}; i++ )); do
	if [[ "${arg:$i:1}" = "c" ]]
	then
	    hsc $2
	elif [[ "${arg:$i:1}" = "r" ]]
	then
	    hsr $2
	elif [[ "${arg:$i:1}" = "d" ]]
	then
	    rm $2 $2.o $2.hi
	fi
    done
}

#add changes to git, commit & push
lazygit()
{
    git add $1
    git commit -m "$2"
    git push -u origin HEAD
}

startx()
{
    termux-x11 :1 -xstartup "dbus-launch --exit-with-session xfce4-session"
}

#stop x server
#stopx()
#{
#    id=pidof termux-x11
#    kill -9 id
#}

startvnc()
{
    vncserver
}

stopvnc()
{
    vncserver -kill :1
}
