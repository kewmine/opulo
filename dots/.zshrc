# ----------------------------------
# Powerlevel10k
# ----------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----------------------------------
# Binds 
# ----------------------------------

# delete
bindkey  "^[[3~"  delete-char

# ctrl + right
bindkey '^[[1;5C' forward-word

# ctrl + left
bindkey '^[[1;5D' backward-word

# ctrl + backspace
bindkey '^H' backward-kill-word

#ctrl + del
bindkey '^[[3;5~' kill-word

# ----------------------------------
# History 
# ----------------------------------

export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000000000
export SAVEHIST=1000000000

setopt INC_APPEND_HISTORY       # append instantly 
setopt HIST_EXPIRE_DUPS_FIRST   # remove existing duplicates
setopt HIST_IGNORE_ALL_DUPS     # don't append duplicate entries
setopt HIST_IGNORE_SPACE        # don't append whitespaces


# ----------------------------------
# Misc 
# ----------------------------------

# zsh autocomplete
autoload -U compinit promptinit
compinit; promptinit; prompt gentoo

# java applets fix for bspwm
export _JAVA_AWT_WM_NONREPARENTING=1





