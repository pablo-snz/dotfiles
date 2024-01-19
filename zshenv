export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export ZDOTDIR=~/.config/zsh

alias vim="nvim"
alias theme="sh $HOME/.config/scripts/change_theme.sh"

alias tt="task scheduled:today"
alias tw="task waiting"
alias tn="task next"
alias tl="task list"
alias ta="task add"
alias tdo="task done"

alias glog="git log --graph --oneline --decorate --all"

alias pd="pomodoro-daemon"
