# Prompt
function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

EMOJI_PROMPT=true

function enable-emoji-prompt {
  EMOJI_PROMPT=true
  echo 'Emoji prompts ON'
}

function disable-emoji-prompt {
  EMOJI_PROMPT=false
  echo 'Emoji prompts OFF'
}

function set_prompt_and_node_version() {
  local last_exit_code=$?

  if [[ $EMOJI_PROMPT != true ]]; then
    # Use for tmate
    local prompt_icon='$'
  elif [[ $last_exit_code -eq 0 ]]; then
    local prompt_icon='🥑 '
  else
    local prompt_icon='😱 '
  fi

  output="$(parse_git_branch_and_add_brackets)"

  if [[ "$output" ]]; then
    PS1="\[\033[0;32m\]\$output\[\033[0m\]\n\u:\W $prompt_icon "
  else
    PS1="\u:\W $prompt_icon "
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
# alias tmux="TERM=screen-256color-bce tmux"
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias r='npm run'
# alias tmux='tmux -2'
alias git=hub
alias tc='tmux a -t'

# Vars
export PATH="/usr/local/bin:$HOME/bin:$PATH"
export POW_EXT_DOMAINS=dev,com
export PYTHONSTARTUP=~/.pythonrc
export TERM=xterm-256color
# export TERM=screen-256color
export EDITOR=vim
export ERL_AFLAGS="-kernel shell_history enabled"

# TMATE Functions
# ===============

TMATE_PAIR_NAME="$(whoami)-pair"
TMATE_SOCKET_LOCATION="/tmp/tmate-pair.sock"
TMATE_TMUX_SESSION="/tmp/tmate-tmux-session"

# Get current tmate connection url
tmate-url() {
  url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
  echo "$url" | tr -d '\n' | pbcopy
  echo "Copied tmate url for $TMATE_PAIR_NAME:"
  echo "$url"
}

# Start a new tmate pair session if one doesn't already exist
# If creating a new session, the first argument can be an existing TMUX session to connect to automatically
tmate-pair() {
  if [ ! -e "$TMATE_SOCKET_LOCATION" ]; then
    tmate -S "$TMATE_SOCKET_LOCATION" -f "$HOME/.tmate.conf" new-session -d -s "$TMATE_PAIR_NAME"

    while [ -z "$url" ]; do
      url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
    done
    tmate-url
    sleep 1

    if [ -n "$1" ]; then
      echo $1 > $TMATE_TMUX_SESSION
      tmate -S "$TMATE_SOCKET_LOCATION" send -t "$TMATE_PAIR_NAME" "TMUX='' tmux attach-session -t $1" ENTER
    fi
  fi
  tmate -S "$TMATE_SOCKET_LOCATION" attach-session -t "$TMATE_PAIR_NAME"
}

# Close the pair because security
tmate-unpair() {
  if [ -e "$TMATE_SOCKET_LOCATION" ]; then
    if [ -e "$TMATE_SOCKET_LOCATION" ]; then
      tmux detach -s $(cat $TMATE_TMUX_SESSION)
      rm -f $TMATE_TMUX_SESSION
    fi

    tmate -S "$TMATE_SOCKET_LOCATION" kill-session -t "$TMATE_PAIR_NAME"
    echo "Killed session $TMATE_PAIR_NAME"
  else
    echo "Session already killed"
  fi
}


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# rbenv
if [[ -f `which rbenv` ]]; then
  eval "$(rbenv init -)"
fi
