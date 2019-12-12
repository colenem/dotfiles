# [ history settings ]
if [ -z "$HISTFILE" ]; then # create the history file if it doesnt exist
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history extended_history hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify inc_append_history share_history

# [ source files ]
source $HOME/.zplug/init.zsh
source $HOME/custom.zsh

# [ add to $PATH ]
additional_paths=(/usr/local/lib/node_modules $HOME/.composer/vendor/bin $HOME/bin)

for i in "${additional_paths[@]}"; do
    if [[ ":$PATH:" != *":$i:"* ]]; then 
        export PATH=$i:$PATH
    fi
done


# [ set node environment variable ]
if [[ ${NODE_PATH:-word} = word ]]; then
    export NODE_PATH=$(npm root -g)
fi

# [ prompt setup ]
# initialize default zsh prompt themes
#autoload -Uz promptinit
#promptinit

# use adam2 prompt
#prompt adam2

bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[3~' delete-char
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# [ zplug ]
zplug 'kimwz/kimwz-oh-my-zsh-theme', as:theme
#zplug 'plugins/git',                 from:oh-my-zsh
zplug 'plugins/git-remote-branch',   from:oh-my-zsh
zplug 'plugins/node',                from:oh-my-zsh
zplug 'plugins/npm',                 from:oh-my-zsh
zplug 'plugins/nvm',                 from:oh-my-zsh
zplug 'plugins/shrink-path',         from:oh-my-zsh
zplug 'lukechilds/zsh-nvm',          as:plugin
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
#zplug 'plugins/git-prompt',        from:oh-my-zsh
#zplug 'plugins/history-substring-search', from:oh-my-zsh

if [[ $ZSH_EVAL_CONTEXT == 'file' ]]; then
    echo "autosuggestions loaded"
    #zplug 'plugins/history-substring-search'
    zplug 'zsh-users/zsh-syntax-highlighting', defer:2
    zplug 'zsh-users/zsh-history-substring-search'
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi


# Then, source plugins and add commands to $PATH
zplug load
#zplug load --verbose

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-material.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh