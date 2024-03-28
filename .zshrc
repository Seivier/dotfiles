
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
export DEV="/run/media/vgonzalez/Dev"
export UNI="$DEV/Universidad"
export EDITOR="nvim"
export PATH="/home/vgonzalez/bin/:~/.local/bin/:$PATH"
export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"

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
alias open="xdg-open"

# zeoxide
eval "$(zoxide init --cmd cd zsh)"


# lfcd
# USE LF TO SWITCH DIRECTORIES AND BIND IT TO CTRL-O
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
