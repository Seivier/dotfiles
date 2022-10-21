# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# # If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export HOMEBREW_NO_ENV_HINTS=TRUE
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# >>> node version manage >>>
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# <<< nvm end <<<

# >>> homebrew initialize >>>
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# rm -f ~/.zcompdump; compinit
# chmod -R go-w '/opt/homebrew/share/zsh'
# <<< homebrew initialize <<<

# >>> antigen initialize >>>
source /opt/homebrew/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles 

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle brew
antigen bundle colorize
antigen bundle emoji
antigen bundle git
antigen bundle git-flow
antigen bundle git-auto-fetch
antigen bundle git-extras
antigen bundle iterm2
antigen bundle jsontools
antigen bundle macos
antigen bundle pip
antigen bundle python
antigen bundle sublime
antigen bundle sudo
antigen bundle themes
antigen bundle vscode
antigen bundle web-search
antigen bundle tmux
antigen bundle vi-mode
antigen bundle conda-incubator/conda-zsh-completion
antigen bundle spaceship-prompt/spaceship-vi-mode@main

# Load the theme.
# antigen theme romkatv/powerlevel10k
# antigen theme nebirhos
# antigen theme half-life
# antigen theme snakypy/zshpower
antigen theme spaceship-prompt/spaceship-prompt

# Tell Antigen that you're done.
antigen apply
# <<< antigen initialize <<<


VI_MODE_SET_CURSOR=true
# spaceship add --before char vi_mode
# spaceship add --after line_sep vi_mode

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> personal aliases >>>
alias l="exa --icons --group-directories-first -a"
alias v="nvim"
alias c="code"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias gcc="gcc-12"
alias g++="g++-12"
# alias tmux="tmux -CC"
# <<< personal aliases <<<

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bindkey -v

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# source /opt/homebrew/opt/spaceship/spaceship.zsh
