# ~/.bash_aliases: included in .bash_profile to add aliases

# alias image viewere ristretto
alias r='ristretto'

# alias to clear the screen
alias c='clear'

# alias reboot and and package update
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
fi

## Use a long listing format ##
alias ll='ls -la' 

## Colorized ls
alias ls='ls -g'
 
## Show hidden files ##
alias l.='ls -d .*' 
 
## get rid of command not found ##
alias cd..='cd ..' 
 
## a quick way to get out of current directory ##
alias ..='cd ..' 
alias ...='cd ../../../' 
alias ....='cd ../../../../' 
alias .....='cd ../../../../' 
alias .4='cd ../../../../' 
alias .5='cd ../../../../..'

# Generate sha1
alias sha1='openssl sha1' 

# Create parent directories
alias mkdir='mkdir -pv'

# make mount more human readable
alias mount='mount |column -t'

# handy short cuts #
alias h='history'
alias j='jobs -l'

# new commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Control output of ping
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# Show open ports
alias ports='netstat -tulanp'

# iptables
## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# get web server headers #
alias header='curl -I'
 
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# Parenting changing perms on / #
#alias chown='chown --preserve-root'
#alias chmod='chmod --preserve-root'
#alias chgrp='chgrp --preserve-root'

 
## pass options to free ## 
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## get GPU ram on desktop / laptop## 
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router /
# Gateway from *nix.
alias rebootlinksys="curl -u 'admin:my-super-password' 'http://192.168.0.1/setup.cgi?todo=reboot'"
 
# Reboot tomato based Asus NT16 wireless bridge 
alias reboottomato="ssh admin@192.168.0.1 /sbin/reboot"


# alias source
alias b='.  ~/.bash_profile'

# alias for hellanzb
alias he='hellanzb enqueue'

# alias to rename space in filename
alias ren='rename "s/\s+/_/g"'

# alias hack and ship git script
alias ssp="hack && ship"

# alias twidge
alias tw="twidge"
alias twu="twidge update"
alias twls="twidge lsrecent -su"

# lock your screen
alias x=xtrlock

# alias for redshift on Amerfoort location
alias rs="redshift -l 52.2:5.3 -t 5700:3600 -g 0.8 -m vidmode "

# alias for the columns aligned
alias mount="mount | column -t"

# alias of todo dev
alias qtodo="todo all --filter -done -10 -10.1"

# alias for gcc enable warnings
alias gcc="gcc -Wall"

# alias of alpine to open directly toward the inbox
alias alpine="alpine -I i -f INBOX"

# alias of mutt with the good config instead of ~/.muttrc
alias mutt="mutt -F ~/.mutt/muttrc"

# alias for xmms2
alias xpl="xmms2 play"
alias xpa="xmms2 pause"
alias xpt="xmms2 toggle"
alias xp="cd /media/pass/music;xmms2 add *;xmms2 toggle"


# alias rm
alias rm="rm -i"

# alias sqldeveloper
alias sqldeveloper="/usr/local/src/sqldeveloper/sqldeveloper.sh 1>/dev/null 2>&1 "

# alias dict translate words script
alias fren='dict -d fra-eng' 
alias enfr='dict -d eng-fra' 
alias nlfr='dict -d nl-fra' 
alias frnl='dict -d fra-nl' 

# switch to dvorak
alias asdf="loadkeys /etc/kbd/keytables/dvorak.map"
alias aoeu="loaadkeys /etc/kbd/keytables/us.map"

# Easily search running processes
alias 'ps?'='ps ax | grep '

# capture video of linux desktop
alias recs='ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq /tmp/screen.recorded.mpg'

# alias to call the mips simulator Mars
alias mars="java -jar /usr/local/src/mars/Mars.jar"

# tin the gman server
alias ting="tin -g gmane"

# alias chrome to allow extensions/plugins
alias chrome='/usr/bin/google-chrome --enable-plugins --enable-user-scripts --enable-extensions'

# pastebin and share url with somebody
alias pastebin="pastebinit -u jeremybaumont"

# move to your sql scripts
alias sql="cd $HOME/devel/sql"

# call tmux 
alias tmux="tmux -2"
alias tma='tmux attach -d -t'


# aliases middleman
alias mds="middleman server -e development --verbose"
alias mdb="middleman build --clean"

# aliases git
#alias gsu='cat .gitmodules   | grep \'\[submodule\' | awk -F\'"\' \'{print $2}\' | xargs -n 1 git submodule update'        

# go
alias cgp="cd $GOPATH/src"

# ansible to rule my workstation
alias playa="cd ~/Code/workstation-ansible && ansible-playbook -K -i inventory/localhost setup_macos_workstations.yml  --vault-password-file ~/.vault_pass.txt"
