# Prompt
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function set_prompt_and_node_version() {
  output="$(parse_git_branch_and_add_brackets)"

  if [[ "$output" ]]; then
    PS1="\[\033[0;32m\]\$output\[\033[0m\]\n\u:\W 🍔  "
  else
    PS1="\u:\W 🍔  "
  fi

  # Set Node version
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD

  if [[ -e ".nvmrc" ]]; then
    nvm use
  elif [[ -e "package.json" ]]; then
    local node_version=$(jq -r '.engines.node' package.json)

    if [[ "$node_version" != "null" ]]; then
      nvm use "$node_version"
    fi
  fi
}

PROMPT_COMMAND=set_prompt_and_node_version

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias png2b64='ruby -rbase64 -e '\''puts "data:image/png;base64,#{Base64.strict_encode64(ARGF.read)}"'\'''
alias grep='grep --color=auto'
alias ag='ag --ignore-dir target --pager="less -R"'
alias gtags='gtags --options=$HOME/ctags'
alias trash='rmtrash'
alias del='rmtrash'
alias be='bundle exec'
alias s='spotify'
alias tmux="TERM=screen-256color-bce tmux"
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias r='npm run'

# Vars
export PATH="/usr/local/bin:$HOME/bin:$PATH"
export POW_EXT_DOMAINS=dev,com
export PYTHONSTARTUP=~/.pythonrc
export TERM=xterm-256color
export EDITOR=vim

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
