# Prompt
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function set_prompt() {
  output="$(parse_git_branch_and_add_brackets)"

  if [[ "$output" ]]; then
    PS1="\[\033[0;32m\]\$output\[\033[0m\]\n\u:\W 🍔  "
  else
    PS1="\u:\W 🍔  "
  fi
}

PROMPT_COMMAND=set_prompt

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias png2b64='ruby -rbase64 -e '\''puts "data:image/png;base64,#{Base64.strict_encode64(ARGF.read)}"'\'''
alias serve='python -m SimpleHTTPServer'
alias grep='grep --color=auto'
alias ag='ag --ignore-dir target --pager="less -R"'
alias gtags='gtags --options=$HOME/ctags'
alias trash='rmtrash'
alias del='rmtrash'
alias be='bundle exec'

# Vars
export PATH="/usr/local/bin:$HOME/bin:$PATH"
export BROWSER=chrome
export POW_EXT_DOMAINS=dev,com

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# rbenv
if [[ -f `which rbenv` ]]; then
  eval "$(rbenv init -)"
fi

# Gulp autocompletion
if [[ -f `which gulp` ]]; then
  eval "$(gulp --completion=bash)"
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
