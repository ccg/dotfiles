# The following zsh notes came from here:
# https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
# * Apparently, on macos, the evaulation order is:
#   .zprofile -> /etc/zprofile -> .zshrc -> .zlogin
# * `.zprofile` and `.zlogin` are for login shells.
# * `.zshrc` is for interactive shells.
# * If something takes a while to run and doesn't change often, it could go in
#   `~/.zprofile`.
# * If something in .zprofile changes, you can update it locally with
#   `exec zsh --login`.

# Aliases
alias mv='mv -iv'
alias cp='cp -iv'
## macos-specific `ls`:
alias ls='ls -AFGq'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='rgrep --color=auto'
alias diff='colordiff'

# Set up Homebrew.
# If this starts to slow things down, move to `~/.zprofile`.
# This command set several shells vars, including `$HOMEBREW_PREFIX`.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Go (golang)
export PATH="$HOME/go/bin:$PATH"

# Java/Clojure
# TODO: where does this live after Homebrew's move to /opt/homebrew?
#export PATH="/usr/local/opt/openjdk/bin:$PATH"

# zsh-autosuggestions when installed via Homebrew
source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-completions when installed via Homebrew
## See also https://thevaluable.dev/zsh-install-configure-mouseless/

## Include dotfiles:
_comp_options+=(globdots)

## zsh-completions
FPATH="${HOMEBREW_PREFIX}/share/zsh-completions:$FPATH"
## Turn on completions
autoload -Uz compinit
## Thanks to https://stackoverflow.com/questions/65484115/how-to-solve-zsh-compinit-insecure-directories-issue-on-macos-other-solutions
## The -u option disables that useless, annoying 'insecure directories'
## warning at startup.
compinit -u

# zsh-syntax-highlighting when installed via Homebrew
source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Turn on LiquidPrompt (installed via Homebrew)
#if [ -f /opt/homebrew/share/liquidprompt ]; then
#    #echo "skipping liquidprompt"
#    . /opt/homebrew/share/liquidprompt
#fi

# zsh prompt: https://github.com/sindresorhus/pure
#fpath+=("$(brew --prefix)/share/zsh/site-functions")
fpath+=("${HOMEBREW_PREFIX}/share/zsh/site-functions")
autoload -U promptinit; promptinit

# optionally define some options
PURE_CMD_MAX_EXEC_TIME=10

# change the path color
zstyle :prompt:pure:path color white

# change the color for both `prompt:success` and `prompt:error`
zstyle ':prompt:pure:prompt:*' color cyan

# turn on git stash status
zstyle :prompt:pure:git:stash show yes

prompt pure

# nvm after `brew install nvm` and `mkdir ~/.nvm`
export NVM_DIR="$HOME/.nvm"
NVM_INIT="${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"
[ -s "${NVM_INIT}" ] && . "${NVM_INIT}"
