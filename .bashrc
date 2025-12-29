# ~/.bashrc: executed by bash(1) for non-login shells.
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

# History settings (optimized for fzf)
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=100000
HISTFILESIZE=200000
shopt -s histappend cmdhist lithist

# Update window size after each command
shopt -s checkwinsize

# Enable extended globbing and other useful shell options
shopt -s extglob globstar

# Color support detection
if command -v tput >/dev/null 2>&1 && tput setaf 1 >/dev/null 2>&1; then
  color_prompt=yes
else
  color_prompt=
fi

# Prompt configuration
if [[ "$color_prompt" == "yes" ]]; then
  PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='\u@\h:\w\$ '
fi
unset color_prompt

# Set xterm title
case "$TERM" in
xterm*|rxvt*|screen*|tmux*)
  PS1="\[\e]0;\u@\h: \w\a\]$PS1"
  ;;
esac

# Color support for common utilities
if command -v dircolors >/dev/null 2>&1; then
  if [[ -r ~/.dircolors ]]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi

  # Color aliases
  alias ls='ls --color=auto --group-directories-first'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
  alias diff='diff --color=auto'
  alias ip='ip --color=auto'
fi

# Useful aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -pv'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Load custom aliases if exist
if [[ -f ~/.bash_aliases ]]; then
  source ~/.bash_aliases
fi

# Load custom env variables if exist
if [[ -f ~/.bash_env_vars ]]; then
  source ~/.bash_env_vars
fi

# Enable programmable completion
if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    source /etc/bash_completion
  fi
fi

# Safety aliases
rm() { command rm -i "${@}"; }
cp() { command cp -i "${@}"; }
mv() { command mv -i "${@}"; }

# Enhanced fzf configuration for history search
if command -v fzf >/dev/null 2>&1; then
  [[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
fi

# Function to make a directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Load local customizations if they exist
if [[ -f ~/.bashrc.local ]]; then
  source ~/.bashrc.local
fi

# Start tmux session if available and not already in tmux
# Modified to work better with fzf and existing setup
if command -v tmux &> /dev/null && \
    [[ -z "$TMUX" ]] && \
    [[ "$TERM" != linux ]] && \
    [[ "$TERM" != dumb ]] && \
    [[ -n "$PS1" ]]; then
  # Try to attach to existing session, create new one if none exists
  tmux attach > /dev/null 2>&1 || exec tmux new-session -s "[0] main"
fi
