# lens-initscript v3
tempkubeconfig="$KUBECONFIG"
export ZDOTDIR="$OLD_ZDOTDIR"
test -f "$OLD_ZDOTDIR/.zshenv" && . "$OLD_ZDOTDIR/.zshenv"
test -f "$OLD_ZDOTDIR/.zprofile" && . "$OLD_ZDOTDIR/.zprofile"
test -f "$OLD_ZDOTDIR/.zlogin" && . "$OLD_ZDOTDIR/.zlogin"
test -f "$OLD_ZDOTDIR/.zshrc" && . "$OLD_ZDOTDIR/.zshrc"
kubectlpath="/opt/Lens/resources/x64"
binariesDir="/opt/Lens/resources/x64"
p=":$kubectlpath:"
d=":$PATH:"
d=${d//$p/:}
d=${d/#:/}
export PATH="$kubectlpath:$binariesDir:${d/%:/}"
export KUBECONFIG="$tempkubeconfig"
NO_PROXY=",${NO_PROXY:-localhost},"
NO_PROXY="${NO_PROXY//,localhost,/,}"
NO_PROXY="${NO_PROXY//,127.0.0.1,/,}"
NO_PROXY="localhost,127.0.0.1${NO_PROXY%,}"
export NO_PROXY
unset tempkubeconfig
unset OLD_ZDOTDIR