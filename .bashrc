# Don't do anything in non-interactive shells
case "$-" in
    *i*) echo "loading .bashrc bash_$BASH_VERSION" ;;
    *)   return ;;
esac


if [ "$(uname)" = "Darwin" ]; then
    alias date='gdate'
    alias docker-net-fix='sudo ifconfig vboxnet0 down && sudo ifconfig vboxnet0 up'
fi

if [ "$(uname)" = "Linux" ]; then
    alias cubic='flatpak run com.cubicsdr.App'
    alias esp='java -jar ~/usr/local/ESPlorer/ESPlorer.jar'
fi

alias christine='grep -v pristine'
alias git-ssh-remote="git remote set-url origin $(git remote get-url origin | sed 's/https:../git@/; s/.com\//.com:/')"
alias httpd-rb='ruby -run -ehttpd . -p8000'
alias httpd-py='python -m SimpleHTTPServer'
alias httpd-git='git instaweb'
alias pytest='pytest -x -vv -f'
alias python='python3'
alias top='htop'
alias vi='vim'


export EDITOR=vim
export SVN_EDITOR="$EDITOR"
export GOPATH=$HOME/golang
export GOROOT=/usr/lib/go
export HISTSIZE=
export HISTTIMEFORMAT='%Y%m%d %H:%M:%S '


set -o vi


SOURCES=(
    "$HOME/.bash_prompt"                             \
    "$HOME/.bashrc_local"                            \
    "$HOME/.rvm/scripts/rvm"                         \
    "/usr/share/git/completion/git-completion.bash"  \
    "/usr/share/bash-completion/bash_completion"     \
)
for source in ${SOURCES[*]}; do
    [[ -s "$source" ]] && source "$source"
done


if type tmux > /dev/null        \
    && [ -n "$PS1" ]            \
    && [[ ! "$TERM" =~ tmux ]]  \
    && [ -z "$SSH_CLIENT" ]     \
    && [ -z "$SSH_TTY" ]        \
    && [ -z "$TMUX" ]; then
    if [ $(tmux list-sessions | wc -l) -gt 0 ]; then
        exec tmux a
    else
        exec tmux
    fi
fi
