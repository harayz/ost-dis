#// DISCOVER
alias i='echo ; echo ; echo "DHCP " $dhcp ; echo "DNS " $dns ; echo ; ifconfig ; ping google.com -c3 ; echo ; echo'
alias l='ls -l'
alias n='echo ; netstat -antup | egrep -v "(Active|p6)" ; echo ;
echo -n "Interface: "$interface ; echo ;
echo -n "MAC address: "$mac ; echo ;
echo -n "Internal IP: "$ip ; echo ;
echo -n "External IP: " ; curl ifconfig.me ; echo'
alias r='cd /root/ ; clear'
alias o='cd /opt/ost-dis/ ; clear'

#// POWERLINE
function _update_ps1() {
	export PS1="$(~/.config/powerline-shell/powerline-shell.py $? 2> /dev/null)"
		}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
export TERM='xterm-256color'

#// ALIASES

alias upd='update-apt-xapian-index ; update-grub ; update-desktop-database ; update-menus ; update-mime'

alias sid='aptitude -t sid install'
alias dev='aptitude -t kali-dev install'

alias mem='cat /proc/meminfo ; free -m'
alias ram='echo 3 | sudo tee /proc/sys/vm/drop_caches ; tree && sync && echo 3 > /proc/sys/vm/drop_caches && tree'

alias ??='clear ; echo "cheat-shieeeeet" ; cat /repo/notes/cheatsheet'
alias ?e='sudo nano /repo/notes/cheatsheet'
alias ?n='cd /repo/notes ; clear ; ls'

alias g='gksu gedit'

alias vpn='echo $( curl -s "http://www.vpnbook.com" | grep -A 1 "Username: vpnbook" | tail -n 2 | cut -f2 -d " " | cut -f1 -d "<" )'
# echo "openvpn --auth-nocache --config"'

alias msf='service postgresql start ; service metasploit start'

alias anon='tor % ; sh /opt/tor-browser/tor-browser'

alias c='clear'
alias cc='clear ; cd ; ls'

alias adl='aptitude download'
alias apt='nano /etc/apt/sources.list ; apt-get autoclean ; apt-get update ; apt-get upgrade'
alias ali='nano ~/.bashrc ; source ~/.bashrc'
alias acp='apt-cache policy'
alias acs='apt-cache search'
alias agi='apt-get install'

alias con='/root/.linconnect/LinConnectServer/main/linconnect_server.py'

alias dfo='dpkg --force-overwrite -i'
alias dca='dpkg --configure -a'
alias dpi='dpkg --install'

alias fix='apt-get clean && apt-get autoclean && apt-get -f install ; apt-get update --fix-missing'

alias get='apt-get install'

alias key='apt-key adv --recv-keys --keyserver keyserver.ubuntu.com'

alias lib='cd /repo/notes ; clear ; ls'



#// If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

#// Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

#// Append to the history file, don't overwrite it
shopt -s histappend

#// for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

#// check the window size after each command and, if necessary update the values of LINES and COLUMNS.
shopt -s checkwinsize

#// Make the pattern "**" used to match all files and zero or more directories and subdirectories.
shopt -s globstar

#// Make 'less' more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#// Set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

#// Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#// Force the motherfuNkin color in the prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
		color_prompt=yes
	else
		color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#// If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

#// Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

#// Alias entries on top or in .bash_aliases (sometimes maintained by /opt/discover)
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#// enable programmable completion features (you don't need to enable
#// this, if it's already enabled in /etc/bash.bashrc and /etc/profile
#// sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi












############### T R A S H #####################################################
#export NACL_INC_DIR=/root/nacl/nacl-20110221/build/kali/include/amd64
#export NACL_LIB_DIR=/root/nacl/nacl-20110221/build/kali/lib/amd64
#export NACL_INC_DIR=/root/nacl/nacl-20110221/build/kali/include/amd64
#export NACL_LIB_DIR=/root/nacl/nacl-20110221/build/kali/lib/amd64

#source /usr/local/rvm/scripts/rvm
#python import sys; sys.path.append ("/usr/local/lib/python2.7/site-packages/")
#PS1="\[\e[1;33m\][ \u\[\e[1;37m\]@\[\e[1;32m\]\h\[\e[1;33m\] \W\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/ {\[\e[1;36m\]\1#\[\e[1;33m\]}/') ]\[\e[0m\]\n==> "
#    function _update_ps1() {
#       export PS1="$(~/powerline-shell.py $? 2> /dev/null)"
#    }
#    export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/shell/powerline.sh ]; then
#	source /usr/local/lib/python2.7/dist-packages/powerline/bindings/shell/powerline.sh
#fi
