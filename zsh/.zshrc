# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/home/yms/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# case-insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# support moving backwards and forward words with ctrl-arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Add custom completions
fpath+=~/.zfunc
autoload -Uz compinit && compinit

function search() { grep -lr "$*" *; }
function tunnel() { ssh -f -N -o ServerAliveInterval=30 -L $1:localhost:$1 $2; }
alias ports='lsof -i -P | grep -i "listen"'
alias archive='tar pczf archive.tar.gz'
alias untar='tar --extract --verbose --one-top-level --file'
alias move='mv'
alias rename='mv'
alias delete='rm -rf'

alias hlog='git log --date-order --all --graph --format="%C(green)%h %Creset%C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset %s"'

alias s='git status -sb'
alias go='git checkout'
alias main='git checkout main'
alias master='git checkout master'
alias branches='git branch --list'

function sync()
{
  local branch=$(git rev-parse --abbrev-ref HEAD);
  git fetch origin;
  git rebase origin/$branch;
}
function upsync()
{
  local branch=$(git rev-parse --abbrev-ref HEAD);
  git fetch upstream;
  git rebase upstream/$branch;
}
alias branch='git checkout -b'
function commit() { git add -A :/ && git commit -m "$*"; }
alias amend='git add -A :/ && git commit --amend -C HEAD'
function merge() { git merge $* && git branch -d $*; }
function checkin()
{
  local branch=$(git rev-parse --abbrev-ref HEAD);
  git push origin $branch;
}
function merged()
{
  local branch=$(git rev-parse --abbrev-ref HEAD)
  git checkout main
  git fetch origin
  git rebase origin/main
  git branch -D $branch
}

alias scorch='git clean -xdf'
alias count='git shortlog -sn'
alias rebase='git rebase'
alias stash='git stash -u'
alias pop='git stash pop'
alias push='checkin'

alias up='docker compose up'
alias down='docker compose down'
function dockersh() { docker compose exec -it $1 /bin/sh }

alias k=kubectl

alias up1='pushd ..'
alias up2='pushd ../..'
alias up3='pushd ../../..'
alias up4='pushd ../../../..'
alias up5='pushd ../../../../..'
alias up6='pushd ../../../../../..'
alias up7='pushd ../../../../../../..'
alias up8='pushd ../../../../../../../..'
alias up9='pushd ../../../../../../../../..'

. /usr/share/autojump/autojump.sh
