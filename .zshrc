# support connection via emacs http://www.emacswiki.org/emacs/TrampMode#toc3
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# not all systems have `vim`, but i like it when they do
[[ -x $(whence -p vim) ]] && export EDITOR=$(whence -p vim)
# old (and/or crappy) versions of `grep` choke on this - make it safe
grep -q --color '.' . 2> /dev/null && export GREP_OPTIONS='--color'

# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle ':completion:*' completions set
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob unset
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' '' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' menu select=5
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/jwong/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
# you can't kill it dead - no duplicate completion on rm/kill/diff
zstyle ':completion:*:(rm|kill|diff):*' ignore-line yes

# location of history
HISTFILE=~/.zhistory
# number of lines kept in history
HISTSIZE=1000
# number of lines saved in the history after logout
SAVEHIST=1000
# append command to history file once executed
setopt inc_append_history
setopt appendhistory beep nomatch notify
unsetopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

# fucking macs - fixes fn-delete
bindkey -e '\e[3~' delete-char

WORDCHARS=''

# this prompt has too much shit.
[ -f ~/.zsh_prompt ] && source ~/.zsh_prompt
# store aliases elsewhere
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases
#store path
[ -f ~/.zsh_path ] && source ~/.zsh_path
#store ssh
[ -f ~/.zsh_agents ] && source ~/.zsh_agents
#ghar completion
autoload -Uz bashcompinit
bashcompinit
[ -f ~/ghar/ghar-bash-completion.sh ] && source ~/ghar/ghar-bash-completion.sh

# This makes cd=pushd
setopt AUTO_PUSHD

# display for xterm
[ -z $DISPLAY ] && export DISPLAY=localhost:0.0

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
[[ -d ~/.rbenv ]] && eval "$(rbenv init - --no-rehash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/jwong/.sdkman"
[[ -s ~/.sdkman/bin/sdkman-init.sh ]] && source "/home/jwong/.sdkman/bin/sdkman-init.sh"
