# Source from .zshrc to init oh-my-zsh

export PATH=$HOME/bin/share:/bin:$PATH
export MY_TOOLS_DIR=~/.tools
export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  my-init
  # Standard plugins
  asdf
  brew
  #direnv
  docker
  #fasd
  fzf
  git
  gradle
  ripgrep
  thefuck
  # Seperate installed plugins
  fzf-tab
  zsh-completions
  zsh-syntax-highlighting
  # gcloud must come after zsh-completions
  gcloud
  )

source $ZSH/oh-my-zsh.sh
