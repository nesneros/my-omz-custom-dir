hash osascript &>/dev/null || return

cdf () {
  # cd into whatever is the forefront Finder window.
  local p=$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')
  echo "$p"
  cd "$p"
}