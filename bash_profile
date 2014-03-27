export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#some handy alias
alias macvim='open -a MacVim'
alias vim='open -a MacVim'

alias ll='ls -lah'
alias l='ls -lah'
alias rma='rm -fdrv'
alias cal='cal | grep -C6 --color -e " $(date +%e)" -e "^(date +%e)"'

#some handy functions

#this can also be done by pressing shift-cmd-i
tabname() { printf "\033]0;$@\007\033k$@\033\"" ;}
#tabname() { echo -ne "\033]0;$@\007" ;} #the -e flag isn't alway recognised.

export MARKPATH=$HOME/.marks
function jump { 
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
    rm -i "$MARKPATH/$1"
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}

