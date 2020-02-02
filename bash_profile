export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ll='ls -lah'
alias l='ls -lah'
alias rma='rm -fdrv'
alias cal='cal | grep -C6 --color -e " $(date +%e)" -e "^(date +%e)"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias home='cd ~/'

alias vup='vagrant up'
alias vin='vagrant ssh'
alias vdown='vagrant halt'
alias vstat='vagrant status'

function c() {
  cd $1
  l
}

