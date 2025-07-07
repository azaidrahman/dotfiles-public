# zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
zinit light jeffreytse/zsh-vi-mode
zinit light undg/zsh-nvm-lazy-load

# Add in plugins
# zinit snippet OMZP::sudo
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZP::command-not-found
zinit snippet OMZP::git

# zoxide
# zinit ice wait lucid
# zinit light ajeetdsouza/zoxide
eval "$(zoxide init zsh)"
