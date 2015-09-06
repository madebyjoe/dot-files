## Adding to Path
export PATH=${PATH}:/Applications/android-sdk-macosx/platform-tools
export PATH=${PATH}:/Applications/android-sdk-macosx/tools
export PATH=${PATH}:/Applications/android-sdk-macosx/gradle-2.2.1/bin
export PATH=${PATH}:/Applications/android-sdk-macosx/build-tools/22.0.1
export PATH=${PATH}:/Users/joe-work/Library/arcanist/bin/
export ANT_HOME=/usr/local/apache-ant-1.9.2
export PATH=${PATH}:${ANT_HOME}/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM 

## System shortcuts
alias cd_method='cd ~/Dropbox/Method\ Medical'
alias cd_nmc='cd ~/Dropbox/code/nMotion/MethodController'
alias cd_nmc_apk='cd ~/Dropbox/code/nMotion/MethodController/MethodController/build/outputs/apk'
alias cd_nmbt='cd ~/Dropbox/Atmel\ Studio/MethodControlCenter/nMotion/nMotion_Main'
alias cd_code='cd ~/Dropbox/code'
alias cd_design='cd ~/Dropbox/design'

alias auto_dl='~/Dropbox/AutoDownload/'

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

# nice git log
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

## Tool Functions
#Random git commit message
function rgc() {
    git commit -m"`curl -s http://whatthecommit.com/index.txt`"
}
#Top ten largest files in dir
alias ducks='du -cks *|sort -rn|head -11'
#show hidden files only
alias l.='ls -d .* --color=auto'
#which commands used the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
# extract most file types
function extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

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