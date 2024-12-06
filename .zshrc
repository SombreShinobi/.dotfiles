# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -s ^f "~/.config/tmux/scripts/tmux-sessionizer\n"

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# tmux
export PATH=$HOME/local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/local/lib:$LD_LIBRARY_PATH
export MANPATH=$HOME/local/share/man:$MANPATH

# autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^y' autosuggest-accept

# highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# opam configuration
[[ ! -r /Users/sibin/.opam/opam-init/init.zsh ]] || source /Users/sibin/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

[ -f "/Users/sibin/.ghcup/env" ] && source "/Users/sibin/.ghcup/env" # ghcup-env

# bun completions
[ -s "/Users/sibin/.bun/_bun" ] && source "/Users/sibin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(fzf --zsh)"

export TEMPL="$HOME/go/bin"
export PATH="$TEMPL:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias ll="ls --color=auto -lhaF"

VIM="nvim"
export GIT_EDITOR=$VIM
alias vim="$VIM"

# Git
alias gs="git status"
alias gsw="git switch"
alias gsp="git switch -"
alias gsm="git switch main"
alias gfp="git fetch && git pull"
alias gr="git rebase"
alias gro="git rebase -X ours"
alias gpf="git push --force-with-lease"

# Docker
alias od="open -a docker"
alias ds="docker stop"
alias dsa="docker start -a"
