# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Vars
# ----
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:~/.ghcup/bin:~/.cabal/bin:~/.local/bin$PATH
export TERM=xterm-256color
export EDITOR=vim
export GPG_TTY=$(tty)
export ERL_AFLAGS="-kernel shell_history enabled"
unset -v GEM_HOME

# rbenv
# -----
eval "$(rbenv init -)"

# nodenv
# ------
eval "$(nodenv init -)"

# ==============================================================================

# zplug
# -----

if [ -d /usr/local/opt/zplug ]; then
  # Source zplug
  export ZPLUG_HOME=/opt/homebrew/opt/zplug
  source $ZPLUG_HOME/init.zsh

  # Plugins
  zplug 'wfxr/forgit'

  # Customize wfxr/forgit aliases
  forgit_log=fglo
  forgit_diff=fgd
  forgit_add=fga
  forgit_reset_head=fgrh
  forgit_ignore=fgi
  forgit_checkout_file=fgcf
  forgit_checkout_branch=fgcb
  forgit_checkout_commit=fgco
  forgit_clean=fgclean
  forgit_stash_show=fgss
  forgit_cherry_pick=fgcp
  forgit_rebase=fgrb
  forgit_fixup=fgfu

  # Load plugins
  zplug load --verbose
fi

# ==============================================================================

# oh-my-zsh
# ---------

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git zsh-vi-mode)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='vim +":FocusDispatch :Neoformat" +":ALEDisable"'
alias ag='ag --pager="less -R"'
alias be='bundle exec'
alias s='spotify'
alias sp='spotli'
alias tp='tmux list-sessions | sed -E '\''s/:.*$//'\'' | fzf --reverse | xargs -I {} zsh -c "exec </dev/tty; exec <&1; tmux attach-session -t {}"'
alias tx=tmuxinator
alias txs='tmuxinator ls | grep -v "tmuxinator projects" | tr " " "\n" | grep -ve "^$" | fzf --reverse | xargs -I {} zsh -c "exec </dev/tty; exec <&1; tmuxinator start {}"'

# ==============================================================================

# Custom functions
# ----------------

# Use fd and fzf to get the args to a command.
# Works only with zsh
# Examples:
# f mv # To move files. You can write the destination after selecting the files.
# f 'echo Selected:'
# f 'echo Selected music:' --extention mp3
# fm rm # To rm files in current directory
f() {
    sels=( "${(@f)$(fd "${fd_default[@]}" "${@:2}"| fzf)}" )
    test -n "$sels" && print -z -- "$1 ${sels[@]:q:q}"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# fuzzy grep open via ag with line number
vg() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     vim $file +$line
  fi
}

# yarn/npm run find commands
r() {
  jq --raw-output '.scripts | to_entries[] | [.key, .value] | @tsv' package.json \
    | fzf --header 'npm run' --reverse --preview 'echo {2..}' --preview-window wrap --with-nth 1 \
    | awk '{print $1}' \
    | xargs npm run
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

fuzzybranch() {
  local result=$(git branch | sed 's/^..//' | fzf --reverse --height='40%' --prompt='Select branch: ')

  if [[ -n "$result" ]]; then
    LBUFFER+=" $result"
  fi

  zle redisplay
}
zle -N fuzzybranch
bindkey '^g' fuzzybranch

# ==============================================================================

# Tmate
# =====

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

# ==============================================================================

# After first fzf install
# $(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ensure fzf keybindings work with zsh-vi-mode plugin
# zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# BEGIN ASDF
[ -f /usr/local/opt/asdf/libexec/asdf.sh ] && source /usr/local/opt/asdf/libexec/asdf.sh
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && source /opt/homebrew/opt/asdf/libexec/asdf.sh
# END ASDF

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# autoload -Uz compinit && compinit

# bun completions
[ -s "/Users/jeremy/.bun/_bun" ] && source "/Users/jeremy/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
