alias useHistory="grep -v \"^ls$\|^ll$\|^l$\|^dir$\|^cd \|^h$\|^gh$\|^gh \|^bg$\|^fg$\|^qsm$\|^quser$\|^qstat \|^note \|^mutt\|^std \" | wc -l"

function myLocalHistory()
{
    if [[ `ls -ld "$PWD" | awk '{print $3}'` == "$USER" ]] ; then
        HISTORYLINE=`history | tail -1 | sed 's:^ *[0-9]* *::g'`
        if [[ "$(echo $HISTORYLINE | useHistory | tr -d '[:space:]')" == "1" ]] ; then
            ((((date +%F.%H-%M-%S.;uname -n) | tr -d '\n' ; echo " $HISTORYLINE") >>.history) 2>/dev/null &)
        fi
    fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd myLocalHistory

function h()
{
     tail .history 2>/dev/null
}

function gh()
{
     cat .history | tr -d '\0' | cut -d ' ' -f2- | grep -a "$1"  2>/dev/null
}

