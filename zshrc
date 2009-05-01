set prompt
PROMPT="%% "
RPROMPT="[%~]"

setopt print_eight_bit

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
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks

zstyle ':completion:*default' list-colors ''  menu select=1

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep

bindkey "^B" run-help
[ -n "`alias run-help`" ] && unalias run-help
autoload run-help
autoload -U compinit
compinit

alias ls="ls -G"
alias beep='echo "\a"'

function ypsilon() {
  rlwrap -q "\"'" ypsilon $@
}
case $OSTYPE in
  darwin*)
    alias gvim="open -a MacVim"
    ;;
esac

# from http://d.hatena.ne.jp/Ubuntu/20080416/1208357134
case "${TERM}" in
  *xterm*|rxvt|(dt|k|E)term)
    exec screen -U -D -RR
    ;;
esac

source ~/bin/del.zsh
