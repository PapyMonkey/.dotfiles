# ~/.config/zsh/plugins.zsh — Plugin & theme declarations
# ------------------------------------------------------------------------------

# Powerlevel10k (prompt theme)
zinit light romkatv/powerlevel10k

# zsh-autosuggestions (inline suggestions)
zinit light zsh-users/zsh-autosuggestions

# zsh-syntax-highlighting (syntax colors)
zinit light zsh-users/zsh-syntax-highlighting

# zsh-history-substring-search (history search)
zinit light zsh-users/zsh-history-substring-search

# fzf — fuzzy finder (bindings + completion only if fzf is installed)
source <(fzf --zsh)

# nvm (node version manader)
export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"
zinit wait lucid light-mode for lukechilds/zsh-nvm

# zoxide - smarter cd command
eval "$(zoxide init zsh)"
