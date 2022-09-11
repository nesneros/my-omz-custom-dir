#! /usr/bin/env bash

set -e

# Only implemented for MacOS

setupDir=$(dirname -- "${BASH_SOURCE[0]}")/..
ZSH_CUSTOM=$(cd $setupDir ; pwd)
name=omz.Custom.LoginScript

d=$(mktemp -d)
tmp=/tmp/file.plist
loginScript=$ZSH_CUSTOM/dotfiles/login.sh

cat << EOF > $tmp
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>EnvironmentVariables</key>
    <dict>
           <key>ZSH_CUSTOM</key>
           <string>$ZSH_CUSTOM</string>
    </dict>
    <key>Label</key>
    <string>$name</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/sh</string>
        <string>$loginScript</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF

# cat $tmp

launchctl remove $name ||:
#launchctl load -w "$tmp"

cat $tmp > $HOME/Library/LaunchAgents/$name.plist

rm -f "$tmp"
rmdir $d
