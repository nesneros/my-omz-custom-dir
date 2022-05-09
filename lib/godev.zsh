# https://github.com/maruel/panicparse
# Default panicparse is installed as 'pp'. For installation use: go install github.com/maruel/panicparse/v2@latest

if (( ${+commands[panicparse]} )) ; then
    alias -g PP="|& panicparse"
    
    function gorunpp {
        go run "$@" |& panicparse
    }
fi

export GOTRACEBACK=all

# See https://pkg.go.dev/runtime for values for GODEBUG
export GODEBUG=""
