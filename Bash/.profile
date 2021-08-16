source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

yellow=$(tput setaf 3)$(tput bold)
blue=$(tput setaf 4)
reset=$(tput sgr0)
PS1="\[$yellow\]\w\[$reset\]\$(__git_ps1 \" \[$blue\](%s)\[$reset\]\") \[$yellow\]$\[$reset\] "

cd /repos

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
__git_complete go _git_checkout

function search() { grep -lr "$*" *; }
function tunnel() { ssh -f -N -o ServerAliveInterval=30 -L $1:localhost:$1 $2; }
alias ports='lsof -i -P | grep -i "listen"'
alias archive='tar -pczf archive.tar.gz'
alias untar='tar -xvf'
alias move='mv'
alias rename='mv'
alias delete='rm -rf'

alias hlog='git log --date-order --all --graph --format="%C(green)%h %Creset%C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset %s"'

alias s='git status -sb'
alias go='git checkout'
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

alias scorch='git clean -xdf'
alias count='git shortlog -sn'
alias rebase='git rebase'

alias up='pushd ..'
alias up1='pushd ..'
alias up2='pushd ../..'
alias up3='pushd ../../..'
alias up4='pushd ../../../..'
alias up5='pushd ../../../../..'
alias up6='pushd ../../../../../..'
alias up7='pushd ../../../../../../..'
alias up8='pushd ../../../../../../../..'
alias up9='pushd ../../../../../../../../..'

