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

## PINGING CLINKLE SERVERS
alias ping-daily='printf "daily says > "; curl http://api-daily.clinkle.com/web/ping/status; printf "\n"'
alias ping-dev='printf "dev says > "; curl https://api-dev.clinkle.com/web/ping/status; printf "\n"'
alias ping-spec='printf "dev says > "; curl http://ios-test.srv.clinkle.com/web/ping/status; printf "\n"'
alias ping-test='printf "test says > "; curl https://api-test.clinkle.com/web/ping/status; printf "\n"'
alias ping-stage='printf "stage says > "; curl https://api-stage.clinkle.com/web/ping/status; printf "\n"'
alias ping-prod='printf "prod says > "; curl https://api.clinkle.com/web/ping/status; printf "\n"'
