# https://github.com/maruel/panicparse
# Default panicparse is installed as 'pp'. For installation use: go install github.com/maruel/panicparse/v2@latest
alias -g PP="|& panicparse"

export GOTRACEBACK=all

# See https://pkg.go.dev/runtime for values for GODEBUG
export GODEBUG=""