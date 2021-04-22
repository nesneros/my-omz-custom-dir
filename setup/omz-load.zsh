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
  fzf
  git
  gradle
  ripgrep
  thefuck
  # Seperate installed plugins
  $(baseNameIfExist fzf-tab)
  $(baseNameIfExist zsh-completions)
  $(baseNameIfExist zsh-syntax-highlighting)
  # gcloud must come after zsh-completions
  gcloud
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
