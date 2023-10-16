typeset -U path

# Hack to configure homebrew path's coreutils
which -s brew>/dev/null && path=( $(brew --prefix coreutils)/libexec/gnubin $path) && path=($(brew --prefix gnu-tar)/libexec/gnubin $path)

# Homebrew arm mac
[ -f /opt/homebrew/bin/brew ] && export PATH="/opt/homebrew/bin:$PATH"
[ -f /opt/homebrew/bin/brew ] && export PATH="/opt/homebrew/sbin:$PATH"
[ -f /opt/homebrew/bin/brew ] && source /opt/homebrew/opt/asdf/libexec/asdf.sh

# Linuxbrew
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# add ~/bin, ~/ghar/bin path to path
path=( ~/bin ~/ghar/bin /usr/local/bin ~/.local/bin $path)
manpath=( $manpath)

# Old rbenv
# [[ -d ~/.rbenv ]] && path=("$HOME/.rbenv/bin" $path) && eval "$(rbenv init - --no-rehash)"

# npm binaries
[[ -d ~/.asdf/installs/nodejs/15.4.0/.npm/bin ]] && path=("$HOME/.asdf/installs/nodejs/15.4.0/.npm/bin" $path)

# chruby
#[ -f /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh && source /usr/local/share/chruby/auto.sh
#RUBIES+=(~/.rbenv/versions/*)

# go bin path
export GOBIN=$HOME/bin

[ -d /usr/local/Homebrew ] && export ASDF_DIR=$(brew --prefix asdf)
[ -d /usr/local/Homebrew ] && source $ASDF_DIR/asdf.sh

[[ -f ~/.asdf/asdf.sh ]] && source ~/.asdf/asdf.sh

# ssh agent -- for shared home directory across hosts
SSH_ENV=$HOME/.ssh/.environment.$(hostname -s)
function start_agent {
    ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    chmod 600 ${SSH_ENV}
    source ${SSH_ENV} > /dev/null
}

## ssh-agent
if [ -f "${SSH_ENV}" ]; then
    source ${SSH_ENV} > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

export GPG_TTY=$(tty)
