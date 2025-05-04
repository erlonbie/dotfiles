export HELIX_RUNTIME=~/src/helix/runtime
export PATH="/$HOME/Library/Application Support/edgedb/bin:$PATH"

export PATH="/$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/$HOME/.local/bin:$PATH"
export PATH="/$HOME/.cargo/bin:$PATH"

# export NVM_DIR="$HOME/.nvm"
# export XDG_CONFIG_HOME="$HOME/.config"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/$HOME/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/$HOME/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
# eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(/usr/local/bin/fnm env)"

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
