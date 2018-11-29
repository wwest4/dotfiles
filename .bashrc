# Don't do anything in non-interactive shells
case "$-" in
    *i*) echo "loading .bashrc bash_$BASH_VERSION" ;;
    *)   return ;;
esac


alias cubic='flatpak run com.cubicsdr.App'
alias esp='java -jar ~/Downloads/ESPlorer/ESPlorer.jar'
alias python='python3'
alias httpd-rb='ruby -run -ehttpd . -p8000'
alias httpd-py='python -m SimpleHTTPServer'
alias httpd-git='git instaweb'
alias vi='vim'
alias xlock='xscreensaver-command --lock'


export EDITOR=vim
export GOPATH=$HOME/golang
export GOROOT=/usr/lib/go
export HISTSIZE=
export HISTTIMEFORMAT='%Y%m%d %H:%M:%S '


set -o vi


RVM_SCRIPTS="$HOME/.rvm/scripts/rvm" 
GIT_COMPLETION="/usr/share/git/completion/git-completion.bash"
BASH_COMPLETION="/usr/share/bash-completion/bash_completion"
BASH_PROMPT="$HOME/.bash_prompt"

[[ -s "$RVM_SCRIPTS" ]] && source "$RVM_SCRIPTS"
[[ -s "$GIT_COMPLETION" ]] && source "$GIT_COMPLETION"
[[ -s "$BASH_COMPLETION" ]] && source "$BASH_COMPLETION"
[[ -s "$BASH_PROMPT" ]] && source "$BASH_PROMPT"


if type tmux > /dev/null        \
    && [ -n "$PS1" ]            \
    && [[ ! "$TERM" =~ tmux ]]  \
    && [ -z "$TMUX" ]; then
    if [ $(tmux list-sessions | wc -l) -gt 0 ]; then
        exec tmux a
    else
        exec tmux
    fi
fi
