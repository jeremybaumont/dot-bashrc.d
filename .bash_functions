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


