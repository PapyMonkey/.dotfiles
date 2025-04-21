# ~/.config/zsh/aliases.zsh — My custom aliases
# ------------------------------------------------------------------------------

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'

# Use eza instead of ls if available
if command -v eza >/dev/null; then
  alias ls='eza --color=always --group-directories-first'
  alias ll='eza -l  --color=always --group-directories-first'
  alias la='eza -al  --color=always --group-directories-first'
else
  alias ls='ls --color=auto'
  alias la='ls -A'
  alias ll='ls -l'
fi

# grep and cat enhancements
alias grep='grep --color=auto'
if command -v bat >/dev/null; then
  alias cat='bat -p'
fi

# Git & dotfiles management
alias g='git'
alias lg='lazygit'
if command -v git >/dev/null; then
  alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  alias dotlg='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
fi

# Editors & utilities
if command -v nvim >/dev/null; then
  alias vi='nvim'
  alias vim='nvim'
fi
alias cp='cp -i'   # interactive copy
alias mv='mv -i'   # interactive move
alias rm='rm -i'   # interactive remove
alias df='df -h'   # human‑readable disk usage

