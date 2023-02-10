# Create an alias for a command with some options.
# Either create new alias or add options to existing alias
# Credit: Inspired by Zoppo
alias+() {
    alias "$1"="${aliases[$1]:-$1} $argv[2,-1]"
}

# Set fzf base, used for fzf plugin
if [[ -z "$FZF_BASE" ]] && (( ${+commands[fzf]} )); then
  case $OSTYPE in
    linux*)
       export FZF_BASE=$HOMEBREW_PREFIX/var/homebrew/linked/fzf
        ;;
    #   darwin*)
    #     FZF_BASE=$(
    #       cd $(which fzf)/../..
    #       pwd
    #     )
    #     ;;
  esac
fi
