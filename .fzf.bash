# Setup fzf
# ---------
if [[ ! "$PATH" == */home/veyzz/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/veyzz/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/veyzz/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/veyzz/.fzf/shell/key-bindings.custom.bash"
