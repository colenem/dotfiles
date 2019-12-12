# [variables]
android_tools=$HOME/android/platform-tools
develop=$HOME/Develop
vagrant=$develop/Vagrant/www/html
archive=$vagrant/archive/wp-content
archive_child=$archive/themes/archive-child
archive_plugin=$archive/plugins/storycorps/includes/StoryCorps
brew=$(brew --prefix)
config=$HOME/.config
fish=$config/fish
html='www/wp-content'
logs='logs'
mamp='/Applications/MAMP'
mamp_bin=$mamp/bin
mamp_lib_bin=$mamp/Library/bin
php_version=7.0.22
mamp_php=$mamp_bin/php/php{$php_version}/bin/php
nvim=$config/nvim
scme=$develop/sc.me/www/wp-content
scorg=$develop/scorg/www/wp-content
v_archive=$vagrant/archive/www/wp-content
z=~/.zshrc
pass=$(cat ~/pwd.txt)


# [aliases]
alias colorize='pygmentize -g'
#alias ctags='$brew/bin/ctags'
alias e.macs='$brew/bin/emacs'
alias elasticsearch='eval $develop/Vagrant/www/html/elasticsearch-5.3.2/bin/elasticsearch'
alias g='git'
alias gconfig='vim ~/.gitconfig'
alias gignore='vim ~/.gitignore_global'
alias ignore_sym_link='find * -type l >> ~/.gitignore_global'
alias inet="ifconfig | grep inet"
alias nano='nano -L'
alias lc='ls -G'
alias lh='lc -a'
alias ll='lc -la'
alias lsD='gls --group-directories-first --color=always -lah'
alias nvrc='export nvim; nvim ~/.config/nvim/init.vim'
alias vim='neo'
alias omz='vim ~/custom.zsh'
alias pgen='password-generator'
alias spacemacs='emacs -mm --insecure &;'
alias trc='vim ~/.tmux.conf'
alias vimdiff='vim -d'
alias vimrc='vim ~/.vimrc'
alias zource='source ~/custom.zsh'
alias zshrc='vim ~/.zshrc'
#alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'

# [git aliases]
source ~/abbreviations.zsh
#alias ga='g a'
#alias gac='g ac'
#alias gb='g branch'
#alias gbD='g bD'
#alias gbl='g bA --color=always | less -R'
#alias gbU='g bU'
#alias gcam='g cam'
#alias gchp='g chp'
#alias gco='g co'
#alias gcm='g cm'
#alias gcob='g cob'
#alias gcoo='g coo'
#alias gd='g d'
#alias gdn='gd --name-only'
#alias gdsf='g dsf'
#alias gdsfc='gdsf --cached'
#alias gdT='g diff-tree --no-commit-id --name-only -r'
#alias gl='g l'
#alias glf='g lf'
#alias gfp='g fp'
#alias gm='g m'
#alias gma='g ma'
#alias gms='git merge --no-commit --squash'
#alias gmt='g mt'
#alias gp='g push'
#alias gpo='g po'
#alias grm='g rm'
#alias grh='g reset HEAD'
#alias gs='g s'
#alias gsa='g sa'
#alias gsho='g sho'
#alias gsl='g sl'
#alias gss='g ss'
#alias gtrack='g track'
#alias guntrack='g untrack'


#  [functions]
# =============
function colorizen () {
    colorize $1 | nl
}

function empty () { 
    echo '' > $1
}

function emacs_special() {
    local macs
    if [ $1 =~ 'reg' ]; then
        if [ -n '$2']; then
            e.macs $2 &
        else
            e.macs &
        fi
    elif [ $1 =~ 'wide' ]; then
        if [ -n '$2' ]; then
            e.macs $2 -geometry 140x73 &
        else
            e.macs -geometry 140x73 &
        fi
    fi
}

function gdt() {
    g difftool --tool=$1
}

function grhh() {
    g reset --hard $1
}

function gwatch() {
    cd $1 && grunt watch
}

function hgrep() {
    history 1 | grep "$1"
}

function merge () {
    if [ $argv =~ 'abort' ]; then
        git merge --abort
    elif [ $argv =~ 'squash' ]; then
        git merge $argv --squash
    else
        git merge $argv --no-commit --no-ff
    fi
}

function neo() {
    # if the environment variable is set then the value is used otherwise set it to the value of word
    if [[ ${NVIM:-word} != word ]]; then
        nvim $argv
    else
        export NVIM=$nvim
        nvim $argv
    fi
}

function rless() {
    sed '1!G;h;$!d' $1 | less
}

function start() {
    cd $1
    vagrant up
    vagrant ssh
}


# [wp-cli setup]
WP_CLI_CONFIG_PATH=~/.wp-cli/config.yaml
WP_CLI_PHP=(brew --prefix homebrew/php/php70)


# [autosuggestions: change color]
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=11'

# [ zsh git prompt ]
#ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
#ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{ ●%G%}"
#ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{ ✖%G%}"
#ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{ ✚%G%}"
#ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔ %G%}"


# [good things to take note of]
# gd --name-only 0394fc84 69fb5e77 ## show changed files between the two commits