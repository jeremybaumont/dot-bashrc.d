# ~/.bash_functions: should be included in .bash_profile 

# Pop up an uzbl browser to read your markdown file
function md2html {
	pandoc -s -f markdown -t html $1| uzblcat |uzbl -c - >/dev/null 2>&1
}

function recterm {
	mkdir -p ~/.recterm &>/dev/null
	find ~/.recterm -type f -mtime +90 -exec rm {} \; &>/dev/null 
	script -c "bash --rcfile ~/.bashrc_script --init-file ~/.bash_profile_script" -qf -t 2> ~/.recterm/term.$$.timing -a ~/.recterm/term.$$.session
}

# pop up a message when it is done with libnotify
function done {
	zenity --info --text \"Jeremy, $1 is done\"
}

# create a bash function to remove certain lines from ssh know_hosts
# file
function sshdel { 
    perl -i -n -e "print unless (\$. == $1)" ~/.ssh/known_hosts; 
}

# highligt pattern
function hl(){ perl -pe "s#($1)#\e[1;42m\$1\e[0m#g" ; }

## Extract any archives 
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid archive or compressed file"
    fi
}


# Autocomplete the name of the host for ssh if present in known_hosts
function autoCompleteHostname() {
	local hosts=($(awk '{print $1}' ~/.ssh/known_hosts | cut -d, -f1));
	local cur=${COMP_WORDS[COMP_CWORD]};
	COMPREPLY=($(compgen -W '${hosts[@]}' -- $cur ))
}

complete -F autoCompleteHostname ssh


# calculator 
c(){ 
	echo "$*" | bc -l; 
}

# hexa to decimal
h2d(){
  HEXA=`echo $@|tr [a-z] [A-Z]`
  echo "ibase=16; $HEXA"|bc
}

# decimal to hexa
d2h(){
  DECI=`echo $@|tr [a-z] [A-Z]`
  echo "0x`echo "obase=16; $DECI"|bc`"
}


# substract date in hours
datediffhours() {     d1=$(date -j -f "%y%m%d %H:%M" "$1"  "+%s");     d2=$(date -j -f "%y%m%d %H:%M" "$2"  "+%s");     echo $(( (d1 - d2) / 3600 )) hours; }

# substract date in days 
datediffdays() {     d1=$(date -j -f "%y%m%d %H:%M" "$1"  "+%s");     d2=$(date -j -f "%y%m%d %H:%M" "$2"  "+%s");     echo $(( (d1 - d2) / 86400 )) days; }

# Rename tmux windows name
nw () {
    local new_window_name=$1

    printf "\033k${new_window_name}\033\\"
}

# Auto completion for ssh
_ssh() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(grep '^Host' ~/.ssh/config | grep -v '[?*]' | cut -d ' ' -f 2-)

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}
complete -F _ssh ssh

dcleanup(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}
