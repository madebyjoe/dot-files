## Adding to Path
export PATH=${PATH}:/Applications/android-sdk-macosx/platform-tools
export PATH=${PATH}:/Applications/android-sdk-macosx/tools
export PATH=${PATH}:/Applications/android-sdk-macosx/gradle-2.2.1/bin
export PATH=${PATH}:/Users/joe-work/Library/arcanist/bin/
export ANT_HOME=/usr/local/apache-ant-1.9.2
export PATH=${PATH}:${ANT_HOME}/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM 

## System shortcuts
alias cd_droid='cd ~/clinkle-android'
alias cd_ios='cd ~/clinkle-iphone'
alias cd_cli='cd ~/clinkle-cli'
alias cd_method='cd ~/Dropbox\ \(Personal\)/Method\ Medical'
alias cd_nmc='cd ~/Dropbox\ \(Personal\)/Method\ Medical/MethodController'
alias cd_nmbt='cd ~/Dropbox\ \(Personal\)/Method\ Medical/Method_Medical_Bluetooth'

## Subl
alias subl_nmbt='cd_nmbt; subl .'

## Git
alias gc='git commit'

alias gco='git checkout'
alias gcod='gco develop'

alias gb='git branch'
alias gcp='git cherry-pick'
alias gr='git revert'

alias gst='git stash'
alias gstp='gst pop'

alias gf='git fetch'

alias gm='git merge'
alias gmd='gm develop'

alias gpl='git pull'
alias gp='git push'

alias gplo='gpl origin'
alias gpo='gp origin'

alias gplod='gplo develop'
alias gpod='gpo develop'

alias gbdr='git push origin --delete' # branch delete remote
alias gbdl='git branch -d' # branch delete local

#clinkle
alias signup_test='cd_cli; rake signup[wallet,2069491408,asldkfj@sdlkfj.flk,1111,"Joe Hunterson",test];'
alias signup_dev='cd_cli; rake signup[wallet,2069491408,asldkfj@sdlkfj.flk,1111,"Joe Hunterson",dev];'
alias signup_daily='cd_cli; rake signup[wallet,2069491408,asldkfj@sdlkfj.flk,1111,"Joe Hunterson",daily];'
alias rpci='cd_ios; rake pod:clean_install'

## Tool Functions
function cd() { builtin cd "$@" && ls; }

## COLORS AND PROMPT
export CLICOLOR=1
PS1='\[\033[1;33m\]\W$(__git_ps1 " (%s)") \$ \[\033[0m\]'

## GIT COMPLETION AND PROMPT
if [ -f ~/.git-completion.sh ]; then
  source ~/.git-completion.sh
fi
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

## BOOKMARKS
export MARKPATH=$HOME/.marks
function jump { 
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark { 
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark { 
  rm -i "$MARKPATH/$1"
}
function marks {
  \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
function j {
  jump $1
}
function m {
  mark $1
}

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

## PINGING CLINKLE SERVERS
alias ping-daily='printf "daily says > "; curl http://api-daily.clinkle.com/web/ping/status; printf "\n"'
alias ping-dev='printf "dev says > "; curl https://api-dev.clinkle.com/web/ping/status; printf "\n"'
alias ping-spec='printf "dev says > "; curl http://ios-test.srv.clinkle.com/web/ping/status; printf "\n"'
alias ping-test='printf "test says > "; curl https://api-test.clinkle.com/web/ping/status; printf "\n"'
alias ping-stage='printf "stage says > "; curl https://api-stage.clinkle.com/web/ping/status; printf "\n"'
alias ping-prod='printf "prod says > "; curl https://api.clinkle.com/web/ping/status; printf "\n"'
