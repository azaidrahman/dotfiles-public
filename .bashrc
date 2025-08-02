export PATH="/opt/homebrew/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH

# when system is accessed via SSH, hostname with light grey background
#   if [[ $(pstree -s $$) = *sshd* ]]; then sshbg="\[\033[48;5;7m\]"; fi
if [[ $(who -m) != *\(:?\) ]]; then sshbg="\[\033[48;5;7m\]"; fi

# when used as root, change username to orange and '#' to red for prompt
if [ $(id -u) -eq 0 ]; then usercol="\[\033[38;5;3m\]"; hashcol="\[\033[38;5;1m\]"; else usercol="\[\033[38;5;2m\]"; fi

# Load bash-git-prompt if it exists
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  # Customize bash-git-prompt settings before loading
  # Uncomment and modify any of these if you want to customize the appearance
  # GIT_PROMPT_ONLY_IN_REPO=1        # Use the default prompt when not in a git repo
  # GIT_PROMPT_THEME=Default         # Use Default theme
  # GIT_PROMPT_THEME=Solarized       # Use Solarized theme
  # GIT_PROMPT_THEME_FILE=~/.git-prompt-custom.sh
  
  # Load bash-git-prompt
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
else
  # Fall back to your original prompt if bash-git-prompt is not installed
  PS1="${usercol}\u\[\033[m\]@\[\033[m\]\[\033[38;5;4m\]${sshbg}\h\[\033[m\]:\[\033[m\]\[\033[38;5;6m\]\w\[\033[m\]${hashcol}\\$ \[\033[m\]"
fi

unset sshbg rootcol hashcol

# alias py3='python3'

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init bash)"
