# Download Znap, if it's not there yet.
[[ -r ~/git/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/git/znap
source ~/git/znap/znap.zsh  # Start Znap


# theme
znap prompt spaceship-prompt/spaceship-prompt

# plugins
ZSH_AUTOSUGGEST_STRATEGY=( history completion )
znap source marlonrichert/zsh-autocomplete # autocomplete
znap source marlonrichert/zsh-edit
znap source marlonrichert/zsh-hist
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

# vars
export DEV="/Volumes/Dev/"
export UNI="$DEV/Universidad"
export EDITOR="nvim"

# aliases
alias ls="eza"
alias ll="eza -l"
alias li="eza --icons"
alias nv="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias uwu="cd $UNI"
alias home="cd $HOME"
alias muxs="tmuxinator start"
alias muxn="tmuxinator new"
alias muxo="tmuxinator open"
alias restart="exec zsh"
alias cls="clear"

# zeoxide
eval "$(zoxide init --cmd cd zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

