# Remove welcome message
set fish_greeting

alias :q="exit"
set EDITOR nvim

# Dotfile management
alias dots="/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME"

# Direnv
eval (direnv hook fish)
# Starship
starship init fish | source

# Source /bin folders with upak
upak | source

# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/sindrip/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/sindrip/.ghcup/bin $PATH
