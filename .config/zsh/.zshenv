# ~/.zshenv — Environment variables & PATH setup
# ------------------------------------------------------------------------------

# 1) Base PATH (user binaries first)
export PATH="$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH"

# 2) Editors & terminal, only if installed
if command -v nvim >/dev/null; then
  export EDITOR="nvim"
fi
if command -v alacritty >/dev/null; then
  export TERMINAL="alacritty"
fi
if command -v brave >/dev/null; then
  export BROWSER="brave"
fi

# 3) MANPAGER: bat if available, then nvim, else less
if command -v bat >/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
elif command -v nvim >/dev/null; then
  export MANPAGER="nvim -c 'set ft=man' -"
else
  export MANPAGER="less"
fi

# 4) XDG Base Directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# 5) Tell Zsh where to find its config
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# 6) rbenv on macOS/Linux if present
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
fi

# 7) MacPorts on macOS if present
if [ -d "/opt/local/bin" ]; then
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

# 8) Cargo (Rust) environment
if [ -f "$HOME/.cargo/env" ]; then
  source "$HOME/.cargo/env"
fi

