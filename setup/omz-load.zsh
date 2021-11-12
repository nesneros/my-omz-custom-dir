# Source from .zshrc to init oh-my-zsh
# like: source $ZSH/custom/setup/omz-load.zsh

export PATH=$HOME/bin/share:/bin:$PATH
export MY_TOOLS_DIR=~/.tools
export ZSH_THEME="powerlevel10k/powerlevel10k"

baseNameIfExist() {
  local customPluginDir="$ZSH/custom/plugins"
  local dir="$customPluginDir/$1"
  if [[ -d "$dir" ]]; then
    print $1
  fi
}

plugins=(
  my-init
  # Standard plugins
  asdf
  brew
  #direnv
  docker
  #fasd
  fd
  fzf
  git
  gradle
  ripgrep
  thefuck
  # Seperate installed plugins
  $(baseNameIfExist autoupdate)
  $(baseNameIfExist fzf-tab)
  $(baseNameIfExist zsh-completions)
  # $(baseNameIfExist zsh-syntax-highlighting)
  $(baseNameIfExist fast-syntax-highlighting)
  # gcloud must come after zsh-completions
  gcloud
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit
