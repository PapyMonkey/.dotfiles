# ~/.config/zsh/themes.zsh
# ------------------------------------------------------------------------------
# Chargement de Powerlevel10k
# ------------------------------------------------------------------------------

THEME_DIR="$ZPLG_DIR/powerlevel10k"
if [[ -f "$THEME_DIR/powerlevel10k.zsh-theme" ]]; then
  source "$THEME_DIR/powerlevel10k.zsh-theme"
else
  echo "⚠️  powerlevel10k.zsh-theme introuvable dans $THEME_DIR"
fi
