set prompt
PROMPT="%% "
# RPROMPT="[%~]"

setopt print_eight_bit
setopt nobeep

export EDITOR=vi
# export SCREENDIR=/tmp/screens

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks

zstyle ':completion:*default' list-colors ''  menu select=1

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_to_home
setopt pushd_silent

setopt auto_remove_slash
setopt auto_menu

setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
setopt extended_glob

setopt rm_star_silent

bindkey "^B" run-help
[ -n "`alias run-help`" ] && unalias run-help
autoload run-help
autoload -U compinit
compinit

# from http://d.hatena.ne.jp/yuta84q/20090301/1235896452
alias sudo="sudo "

alias dc="cd"

if ls --color >& /dev/null; then
  alias ls="ls --color"
else
  alias ls="ls -G"
fi
alias beep='echo "\a"'

if which ypsilon >/dev/null; then
  function ypsilon() {
    rlwrap -q "\"'" ypsilon $@
  }
fi
case $OSTYPE in
  darwin*)
    # from http://d.hatena.ne.jp/hitode909/20080314
    function ql() {
      qlmanage -p $@ >& /dev/null
    }
    function app() {
      open -a $1 --args $@[2,-1]
  }
    ;;
esac

# from http://d.hatena.ne.jp/Ubuntu/20080416/1208357134
# case "${TERM}" in
#   *xterm*|rxvt|(dt|k|E)term)
#     exec screen -U -RR # -D
#     ;;
# esac

function mkcd() {
  mkdir "$1" && cd "$1"
}

if which wget >/dev/null; then
  alias header="wget -S --spider"
else
  alias header="curl --head"
fi

