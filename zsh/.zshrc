export HISTFILE="$ZDOTDIR/zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000

# autocompletion
autoload -Uz compinit promptinit
compinit
zstyle ':completion:*' menu select

# prompt
promptinit

# keybinds
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"

[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


#history
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

alias ls='ls --color=auto'
alias cpp='g++ main.cpp -lglut -lGLU -lGL && ./a.out'
alias crc='gcc main.c -lncurses && ./a.out'
alias rezource='source $ZDOTDIR/.zshrc'
alias spv='source bin/activate; tmux neww; vi'

# Java moment
alias gcb='gradle clean b'
alias gcbt='gradle clean b jacocoTestReport'
