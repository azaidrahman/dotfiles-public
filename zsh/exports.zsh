export PATH="/opt/homebrew/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi



## COMMON VARIABLES
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"
export FCEDITOR="nvim"
export TERMINAL="wezterm"
# export BROWSER="app.zen-browser.zen"
#
export FZ_DEFAULT_COMMAND='rg —files —hidden -g !.git/'
