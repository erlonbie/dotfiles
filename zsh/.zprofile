export HELIX_RUNTIME=~/src/helix/runtime
export PATH="/$HOME/Library/Application Support/edgedb/bin:$PATH"

export PATH="/$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/$HOME/.local/bin:$PATH"
export PATH="/$HOME/.cargo/bin:$PATH"
export EZA_CONFIG_DIR="$HOME/.config/eza"
export PATH="/usr/local/opt/ffmpeg@5/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ffmpeg@5/lib"
export CPPFLAGS="-I/usr/local/opt/ffmpeg@5/include"
export FFMPEG_INCLUDE_DIR="/usr/local/opt/ffmpeg@5/include"
export FFMPEG_LIB_DIR="/usr/local/opt/ffmpeg@5/lib"
export VCPKG_ROOT=~/repos/vcpkg
export PATH=$HOME/fvm/default/bin:$PATH
export EDITOR="nvim"

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
