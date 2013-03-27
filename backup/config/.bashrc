alias ls='ls --color=auto'
[ ! "$UID" = "0" ] && archbey -c white
[  "$UID" = "0" ] && archbey -c red
#PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"

# User specific aliases and functions:
export EDITOR="emacsclient -c"
export PATH=$PATH:~/bin
export PATH=$PATH:/opt/ruby-enterprise/bin:
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
alias et=~/scripts/et.sh
alias eg=~/scripts/eg.sh
alias egn=~/scripts/egn.sh
alias etn=~/scripts/etn.sh
alias edn=~/scripts/edn.sh
export GENDEV="/opt/toolchains/gen"
export PATH=$GENDEV/sh-elf/bin:$GENDEV/m68k-elf/bin:$GENDEV/bin:$PATH 
export PATH=~/.gem/ruby/1.9.1/bin:$PATH
export GEM_HOME=~/.gem/ruby/1.9.3

# colored terminal
alias ls="ls -h --color=auto"

export PS1='\[\033[01;32m\]\u@\h \[\033[00;31m\]\W \$ \[\033[00m\]'

# User specific environment and startup programs:
export LANG=ja_JP.UTF8
export INPUTRC=~/.inputrc

