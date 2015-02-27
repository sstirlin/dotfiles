# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# tell the world that this is a 256-color terminal
export TERM=xterm-256color


# use vim mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode


# ###############
# prompt settings
# ###############

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

## Modify the colors and symbols in these variables as desired.
#GIT_PROMPT_SYMBOL="%{$fg[blue]%}:"
#GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
#GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
#GIT_PROMPT_AHEAD="%{$fg[red]%}push%{$reset_color%}"
#GIT_PROMPT_BEHIND="%{$fg[cyan]%}pull%{$reset_color%}"
#GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}mrg>%{$reset_color%}"
#GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}untrckd%{$reset_color%}"
#GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}mod%{$reset_color%}"
#GIT_PROMPT_STAGED="%{$fg_bold[green]%}stgd%{$reset_color%}"
#
## Show Git branch/tag, or name-rev if on detached head
#parse_git_branch() {
#  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
#}
#
## Show different symbols as appropriate for various Git repository states
#parse_git_state() {
#
#  # Compose this value via multiple conditional appends.
#  local GIT_STATE=""
#
#  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
#  if [ "$NUM_AHEAD" -gt 0 ]; then
#    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
#  fi
#
#  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
#  if [ "$NUM_BEHIND" -gt 0 ]; then
#    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
#  fi
#
#  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
#  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
#    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
#  fi
#
#  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
#    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
#  fi
#
#  if ! git diff --quiet 2> /dev/null; then
#    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
#  fi
#
#  if ! git diff --cached --quiet 2> /dev/null; then
#    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
#  fi
#
#  if [[ -n $GIT_STATE ]]; then
#    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
#  fi
#
#}
#
## If inside a Git repository, print its branch and state
#git_prompt_string() {
#  local git_where="$(parse_git_branch)"
#  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
#}
#
## Set the right-hand prompt
#RPS1='$(git_prompt_string)'


# set the left-hand prompt
PROMPT="%1m$%{$fg[green]%}%1~%{$reset_color%}%# "


# improve vim bindings a little
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char


# force filename completion on Shift-TAB
setopt magic_equal_subst
zstyle :completion::::: completer _complete _files


# disable shared history
setopt no_share_history
