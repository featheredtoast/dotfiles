typeset -U path

# Hack to configure homebrew path's coreutils
which -s brew>/dev/null && path=( $(brew --prefix coreutils)/libexec/gnubin $path)

# Linuxbrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# add ~/bin, ~/ghar/bin to path
path=( ~/bin ~/ghar/bin /usr/local/bin $path)
manpath=( $manpath)

[[ -d ~/.rbenv ]] && path=("$HOME/.rbenv/bin" $path) && eval "$(rbenv init - --no-rehash)"

# ssh agent -- for shared home directory across hosts
SSH_ENV=$HOME/.ssh/.environment.`hostname -s`
function start_agent {
    echo "Starting a new ssh-agent on this host"
    ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    chmod 600 ${SSH_ENV}
    source ${SSH_ENV} > /dev/null
    echo succeeded
}

## ssh-agent
if [ -f "${SSH_ENV}" ]; then
    source ${SSH_ENV} > /dev/null
    echo "Using ${SSH_ENV} with pid ${SSH_AGENT_PID}"
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        echo "${SSH_ENV} agent is no longer running"
        start_agent;
    }
else
    start_agent;
fi
