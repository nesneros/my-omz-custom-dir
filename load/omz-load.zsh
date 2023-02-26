# Source from .zshrc to init oh-my-zsh
# like: source $ZSH/custom/setup/omz-load.zsh

export POWERLEVEL9K_INSTANT_PROMPT=quiet

if [ -z "$ZSH_CUSTOM" ]; then
  echo "ZSH_CUSTOM is not set" >&2
  read && exit 1
fi
if [ ! -d "$ZSH_CUSTOM/load" ]; then
  echo "ZSH_CUSTOM not found: $ZSH_CUSTOM" >&2
  read
  exit 1
fi
export ZSH_CUSTOM 

# Add scripts dir to PATH
PATH=$ZSH_CUSTOM/scripts:$PATH

# Setup Brew first. E.g. direnv is needed 
source $ZSH_CUSTOM/load/brew-load.zsh

# Enable instant prompt for p10k
# (( ${+commands[direnv]} )) && emulate zsh -c "$(direnv export zsh)"
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# (( ${+commands[direnv]} )) && emulate zsh -c "$(direnv hook zsh)"


# If ZSH not set try to detect it
if [ -z "$ZSH" ]; then
  if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    ZSH="$HOME/.oh-my-zsh"
  else
    echo "ZSH not found" >&2
    read && exit 1
  fi
fi
export ZSH

export PATH=$HOME/bin:$PATH
export ZSH_THEME="powerlevel10k/powerlevel10k"

baseNameIfExist() {
  local customPluginDir="$ZSH_CUSTOM/plugins"
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
  aws
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

autoload -U compinit
if [ -n "$ZSH_COMPDUMP" ]; then
  compinit -u -d "$ZSH_COMPDUMP"
else
  compinit -u 
fi

