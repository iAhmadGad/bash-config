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

startvnc()
{
    vncserver
}

stopvnc()
{
    vncserver -kill :1
}
