export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# Aliases
alias zshconf="vi ~/.zshrc"
alias starconf="vi ~/.config/starship.toml"
alias critconf="vi ~/.config/alacritty/alacritty.toml"

eval "$(starship init zsh)"
