export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

bindkey -s ^f "~/.config/tmux/scripts/tmux-sessionizer\n"

eval "$(starship init zsh)"

# tmux
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export MANPATH=$HOME/local/share/man:$MANPATH

# autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^y' autosuggest-accept

# highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# opam configuration
[[ ! -r /Users/sibin/.opam/opam-init/init.zsh ]] || source /Users/sibin/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# fnm
eval "$(fnm env --use-on-cd)"
export PATH="/Users/sibin/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

[ -f "/Users/sibin/.ghcup/env" ] && source "/Users/sibin/.ghcup/env" # ghcup-env

# bun completions
[ -s "/Users/sibin/.bun/_bun" ] && source "/Users/sibin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(fzf --zsh)"

export TEMPL="$HOME/go/bin"
export PATH="$TEMPL:$PATH"
