# https://github.com/maruel/panicparse
# Default panicparse is installed as 'pp'. For installation use: go install github.com/maruel/panicparse/v2@latest

# panicparse is install is asdf managed go so it wont work to guard setup with a check if panicparse is defined
#if (( ${+commands[panicparse]} )) ; then
    alias -g PP=" |& panicparse"
    
    function gorunpp {
        go run "$@" |& panicparse
    }

    alias gm="gorunpp main.go"
#fi

export GOTRACEBACK=1

# See https://pkg.go.dev/runtime for values for GODEBUG
export GODEBUG=""
