# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files sourced from it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v5/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
# You can manually run `z4h update` to update everything.
zstyle ':z4h:' auto-update      'no'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:' auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey' keyboard  'mac'

# Don't start tmux.
zstyle ':z4h:' start-tmux       no

# Mark up shell's output with semantic information.
zstyle ':z4h:' term-shell-integration 'yes'

# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char 'accept'

# zstyle ':z4h:*' fzf-bindings ctrl-k:up
zstyle ':z4h:*' fzf-bindings ctrl-k:up

# Recursively traverse directories when TAB-completing files.
zstyle ':z4h:fzf-complete' recurse-dirs 'no'

# Enable direnv to automatically source .envrc files.
zstyle ':z4h:direnv'         enable 'no'
# Show "loading" and "unloading" notifications from direnv.
zstyle ':z4h:direnv:success' notify 'yes'

# Enable ('yes') or disable ('no') automatic teleportation of z4h over
# SSH when connecting to these hosts.
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
# The default value if none of the overrides above match the hostname.
zstyle ':z4h:ssh:*'                   enable 'no'

# Send these files over to the remote host when connecting over SSH to the
# enabled hosts.
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Extend PATH.
path=(~/bin $path)

# Export environment variables.
export GPG_TTY=$TTY

# Source additional local files if they exist.
z4h source ~/.env.zsh

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh  # source an individual file
z4h load   ohmyzsh/ohmyzsh/plugins/emoji-clock  # load a plugin

# Define key bindings.
z4h bindkey undo Ctrl+/   Shift+Tab  # undo the last command line change
z4h bindkey redo Option+/            # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Add flags to existing aliases.
alias tmb="tmux bind-key -r -T prefix C-l next-window"
alias ls="eza --group-directories-first --icons"
alias nvim="$HOME/.local/share/bob/v0.11.4/bin/nvim"
alias nv="/usr/local/bin/nvim"
alias lvim="NVIM_APPNAME=lazyvim nvim"
alias oraclevm="kitten ssh -i ~/.ssh/ssh-key-2025-04-09.key erlonbie@137.131.155.107"
alias termuxssh="kitten ssh -i ~/.ssh/mactermux 192.168.100.16 -p 8022"
alias hx="helix"
alias python=python3
alias gg="gpt"
alias '?'="gpt"
gpt() {
     # chatgpt "$*"
     tgpt "$*"
}
alias tl='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias tree='tree -a -I .git'
alias sl='sl -e'
alias :wq='exit'
alias :Wq='exit'
alias :WQ='exit'
alias :q='exit'
alias :Q='exit'

alias k='kubectl'

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# found it here:  https://github.com/romkatv/zsh4humans/issues/110
[[ ! -v functions[command_not_found_handler] ]] || unfunction command_not_found_handler

#. "$HOME/.atuin/bin/env"
# eval "$(atuin init zsh)"
# eval "$(atuin init zsh --disable-ctrl-r)"
eval "$(atuin init zsh --disable-up-arrow)"

# fnm
FNM_PATH="/home/erlonbie/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/erlonbie/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/erlonbie/.dart-cli-completion/zsh-config.zsh ]] && . /home/erlonbie/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

