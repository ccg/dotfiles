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

# Go (golang)
export PATH="$HOME/go/bin:$PATH"

# Java/Clojure
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# zsh-autosuggestions when installed via Homebrew
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-completions when installed via Homebrew
## See also https://thevaluable.dev/zsh-install-configure-mouseless/
## Include dotfiles:
_comp_options+=(globdots)
## zsh-completions
FPATH=/usr/local/share/zsh-completions:$FPATH
## Turn on completions
autoload -Uz compinit
compinit

# zsh-syntax-highlighting when installed via Homebrew
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Turn on LiquidPrompt (installed via Homebrew)
#if [ -f /usr/local/share/liquidprompt ]; then
#    #echo "skipping liquidprompt"
#    . /usr/local/share/liquidprompt
#fi

# zsh prompt: https://github.com/sindresorhus/pure
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
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
