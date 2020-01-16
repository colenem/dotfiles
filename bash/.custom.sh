#    [256 term colors]
# =======================
export TERM=xterm-256color


#    [Colored man pages]
# =========================
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'


#    [Set VIM as default terminal editor]
# ==========================================
export EDITOR='nvim'


#    [ path setup variables ]
# ==============================
home_bin='/home/colene/bin'
#ports_sbin='/opt/local/sbin'
paths=($home_bin)

#    [ add to $PATH ]
# ======================
for i in "${paths[@]}"; do
    if [ -d $i ] && [[ ":$PATH:" != *":$i:"* ]] ; then # if the specified path exists and [is a directory ( -d )]
       export PATH="$i:$PATH"
    fi
done


#    Set up Node Version Manager
# =================================
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"  # Load NVM


#    [regular aliases]
# =======================
alias vim='nvim'
alias bashrc='vim ~/.bashrc'
alias bource='source ~/.custom.sh'
alias clear="clear && printf '\e[3J'"
alias colorize='pygmentize -g'
alias customrc='vim ~/.custom.sh'
alias inet='ifconfig | grep inet'
alias lc='LC_COLLATE="C" ls --color=always --group-directories-first'
alias lh='lc -a'
unset ll
alias ll='LC_COLLATE="C" ls --color=always --group-directories-first -alh'
#alias ll='ls --color=always --group-directories-first -alh'
alias nano='nano -L'
alias prename='perl-rename'
alias sd='sudo '
alias svim='sd vim'
alias snano='sudo nano'
alias treels='~/bin/tree_ls.sh'
#alias update='sudo apt update'

#    [git abbreviations]
# =========================
alias ga='git add'
alias gac='git a . && git commit -am'
alias gbl='git branch -a --color=always | less -R'
alias gbD='git branch -D'
alias gbU='git branch -u'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gcam='git commit -am'
alias gchp='git cherry-pick'
alias gcl='git clone'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcoo='git checkout --ours'
alias gd='git diff'
alias gdsf='git dsf'
alias gdsfc='gdsf --cached'
alias gdt='git difftool --tool='
alias gdT='git diff-tree --no-commit-id --name-only -r'
alias gl='git log --graph --abbrev-commit --decorate --date=relative'
alias glf='git log --graph --abbrev-commit --decorate --date=relative --first-parent'
alias gfp='git fetch -p && git pull'
alias gm='git merge --no-commit --no-ff'
alias gma='git merge --abort'
alias gmt='git mergetool --tool='
alias gp='git push'
alias gpl='git pull'
alias gpo='git push origin'
alias gr='git reset'
alias grh='git reset --hard'
alias gs='git status'
alias gsa='git stash apply "stash@{$argv}"'
alias gsho='git show'
alias gsl='git stash list'
alias gss="git stash save (date '+%b %d, %Y at %I:%M %p')"
alias gtrack='git update-index --no-assume-unchanged'
alias guntrack='git update-index --assume-unchanged'
alias spacemacs='emacs -mm &'
alias tmux='tmux -2'

#    [functions]  
# =================
function adb_send_text () {
    adb shell input text $(echo "'$1'" | sed 's/ /\%s/g')
   # echo $((echo "'$1'" | sed 's/ /\%s/g'))
}

function checkColors () {
    for fgbg in 38 48 ; do # Foreground / Background
        for color in {0..255} ; do # Colors
            # Display the color
            printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
            # Display 6 colors per lines
            if [ $((($color + 1) % 6)) == 4 ] ; then
                echo # New line
            fi
        done
        echo # New line
    done
}

function empty () {
    echo '' > $argv
}

function findit () {
    echo $1
    echo $2
    echo $3
    echo $4
    echo $5
}

#enav() {
#    empty $1
#    lnav $1
#}

function hgrep () {
    history | grep "$1"
    #history | grep "$argv"
}

#sedRange() {
#    sed -ne "$1, $2 p" -e "$3 q" $4 | pygmentize -g
#}

function rless { 
    sed '1!G;h;$!d' $1 | less
}

