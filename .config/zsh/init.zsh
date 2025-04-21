# ~/.config/zsh/init.zsh — Main Zsh initialization
# ------------------------------------------------------------------------------

# 0) Instant prompt for Powerlevel10k (optional)
if [[ -r "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 1) Bootstrap zinit (auto‑install if missing)
export ZINIT_HOME="${XDG_DATA_HOME}/zinit"
if [[ ! -f "$ZINIT_HOME/bin/zinit.zsh" ]]; then
  mkdir -p "$ZINIT_HOME"
  git clone --depth=1 https://github.com/zdharma-continuum/zinit.git \
    "$ZINIT_HOME/bin" &>/dev/null
fi
source "$ZINIT_HOME/bin/zinit.zsh"

# 2) Global options
bindkey -v  # vi‑mode keybindings
DISABLE_UNTRACKED_FILES_DIRTY="true"

# 3) Helper to source files if they exist
source_if_exists() {
  [[ -f $1 ]] && source "$1"
}

# 4) Load plugins & themes
source_if_exists "$ZDOTDIR/plugins.zsh"

# 5) Load user aliases
source_if_exists "$ZDOTDIR/aliases.zsh"

# 6) Finally, load the personal Powerlevel10k config (if any)
source_if_exists "$ZDOTDIR/.p10k.zsh"
