# ~/.zshrc
CONFIG_DIR="$HOME/.config/zaid.dotfiles/zsh"  # or ~/dotfiles/zsh if you prefer

# Base
source "$CONFIG_DIR/launch.zsh"
source "$CONFIG_DIR/exports.zsh"
source "$CONFIG_DIR/aliases.zsh"
source "$CONFIG_DIR/functions.zsh"

# Zinit plugins
source "$CONFIG_DIR/plugins.zsh"

# Custom functions/plugins/themes
for file in "$CONFIG_DIR/custom/"*.zsh; do
  source "$file"
done

# Prompt/theme
source "$CONFIG_DIR/theme.zsh"
