# ------------------------------------------------------------------------------
#
# Shell sourcing file order :
#	zshenv -> zprofile -> zshrc -> zlogin
#
# ------------------------------------------------------------------------------

# confirmations, etc.) must go above this block; everything else may go below.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
