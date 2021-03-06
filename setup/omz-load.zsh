# Source from .zshrc to init oh-my-zsh
# like: source $ZSH/custom/setup/omz-load.zsh

export PATH=$HOME/bin:$PATH
export MY_TOOLS_DIR=~/.tools
export ZSH_THEME="powerlevel10k/powerlevel10k"

baseNameIfExist() {
  local customPluginDir="$ZSH/custom/plugins"
  local dir="$customPluginDir/$1"
  if [[ -d "$dir" ]]; then
    print $1
  fi
}

# Settings for magic-enter
MAGIC_ENTER_GIT_COMMAND="git status -sb -u ."
MAGIC_ENTER_OTHER_COMMAND="ls ."

plugins=(
  my-init
  # Standard plugins
  # asdf
  # brew
  # direnv
  dirhistory
  docker
  # fd
  fzf
  git
  golang
  gradle
  macos
  # magic-enter
  # ripgrep
  thefuck
  transfer
  web-search
  zoxide
  # Seperate installed plugins
  $(baseNameIfExist autoupdate)
  $(baseNameIfExist clipboard)
  $(baseNameIfExist fzf-tab)
  $(baseNameIfExist zsh-completions)
  # $(baseNameIfExist zsh-syntax-highlighting)
  $(baseNameIfExist fast-syntax-highlighting)
  # gcloud must come after zsh-completions
  gcloud
)

# Remove macos plugin unless on MacOS
[[ "$OSTYPE" == darwin* ]] || plugins=("${(@)plugins:#macos}")

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit
