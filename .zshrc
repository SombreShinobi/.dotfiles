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

# git
alias gs="git status"
alias gsw="git switch"
alias gsp="git switch -"
alias gsm="git switch main"
alias gsh="git stash"
alias gshp="git stash pop"
alias gfp="git fetch && git pull"
alias gr="git rebase"
alias gro="git rebase -X ours"
alias gpf="git push --force-with-lease"
alias gfrm="gsm && gfp && gsp && gr main && gpf"

# docker
alias od="open -a docker"
alias ds="docker stop"
alias dsa="docker start -a"

# tmux
alias tk="tmux kill-server"
alias ta="tmux attach"

# apple stuff
alias pl-build='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/build.sh'
alias pl-console='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/console.sh'
alias pl-down='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/down.sh'
alias pl-gradle='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/gradle.sh'
alias pl-logs='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/logs.sh'
alias pl-restart='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/restart.sh'
alias pl-start='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/start.sh'
alias pl-status='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/status.sh'
alias pl-stop='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/stop.sh'
alias pl-up='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/up.sh'
alias pl-aws-login='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/aws-login.sh'
alias pl-pr='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/pr.sh'
alias pl-sidecars-destroy='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/sidecars-destroy.sh'
alias pl-sidecars-stop='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/sidecars-stop.sh'
alias pl-build='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/build.sh'
alias pl-console='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/console.sh'
alias pl-down='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/down.sh'
alias pl-gradle='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/gradle.sh'
alias pl-logs='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/logs.sh'
alias pl-restart='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/restart.sh'
alias pl-start='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/start.sh'
alias pl-status='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/status.sh'
alias pl-stop='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/stop.sh'
alias pl-up='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/up.sh'
alias pl-aws-login='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/aws-login.sh'
alias pl-pr='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/pr.sh'
alias pl-sidecars-destroy='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/sidecars-destroy.sh'
alias pl-sidecars-stop='sh /Users/sibin/Documents/work/platoon-gateway-service/environment/scripts/sidecars-stop.sh'
source /Users/sibin/.platoon_aliases
source /Users/sibin/.platoon_functions
