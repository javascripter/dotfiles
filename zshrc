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

# peco + history
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

if type peco &>/dev/null; then
  zle -N peco-select-history
  bindkey '^r' peco-select-history
fi

# peco + ghq
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  #zle clear-screen
}

if type peco &>/dev/null; then
  zle -N peco-src
  bindkey '^g' peco-src
fi


# cd to selected ghq repository
alias g='cd $(ghq root)/$(ghq list | peco)'

# asdf autocompletion
. /opt/homebrew/opt/asdf/libexec/asdf.sh


# For ruby-build (used in asdf-ruby as well)
# use Homebrew OpenSSL (note: will not work for ruby < 2.4)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"


# go
export GOPATH=$HOME/go
export GOROOT="/opt/homebrew/Cellar/go/1.17.2/libexec"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

# Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home/

