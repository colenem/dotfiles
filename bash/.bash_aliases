export HISTFILESIZE=10000
export HISTSIZE=10000

#  [ Set GH api token for use with brew ]
# =======================================
HOMEBREW_GITHUB_API_TOKEN='c4925d9f05df7e5d8a06bd5fcd4281faf8dc5cdc'

# [regular aliases]
alias colorize='pygmentize -g'
alias e.macs='$brew/bin/emacs'
alias elasticsearch='eval $develop/elasticsearch-5.3.2/bin/elasticsearch'
alias fishrc='nvim ~/.config/fish/config.fish'
alias g='git'
alias gconfig='vim ~/.gitconfig'
alias gdsf='g dsf'
alias gignore='vim ~/.gitignore'
alias ignore_sym_link='find * -type l >> ~/.gitignore_global'
alias inet="ifconfig | grep inet"
alias nano='nano -L'
alias lc='ls -G'
alias lh='lc -a'
alias ll='lc -la'
alias lsD='gls --group-directories-first --color=always -lah'
alias lsl='~/lsl.sh' # because sometimes fish doesn't work the way i like, so i use bash
alias nvrc='nvim ~/.config/nvim/init.vim'
alias vim=nvim
alias omz='vim ~/custom.zsh'
alias pgen='password-generator'
#alias php='eval $mamp_bin/php/php{$php_version}/bin/php'
#alias spacemacs='emacs --insecure &;'
alias trc='vim ~/.tmux.conf'
alias vimdiff='vim -d'
alias vimrc='vim ~/.vimrc'

# [git aliases]
alias ga='git add'
alias gac='git a . ;and git commit -am'
alias gb='git branch'
alias gbD='git branch -D'
alias gbl='git branch -a --color=always | less -R'
alias gbU='git branch -u'
alias gc='git commit'
alias gclean='git clean'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gchp='git cherry-pick'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcoo='git checkout --ours'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gdt='git difftool --tool='
alias gdT='git diff-tree --no-commit-id --name-only -r'
alias gl='git log --graph --abbrev-commit --decorate --date=local'
alias gk='gitk --all --first-parent --remotes --reflog --author-date-order'
alias glf='git log --graph --abbrev-commit --decorate --date=local --first-parent'
alias gfp='git fetch -p ;and git pull'
alias gm='git merge --no-commit --no-ff'
alias gma='git merge --abort'
alias gms='git merge --no-commit --squash'
alias gmt='git mergetool --tool='
alias gp='git push'
alias gpl='git pull'
alias gpo='git push origin'
alias gpu='git push upstream'
alias grh='git reset HEAD'
alias grhh='git reset --hard'
alias grhhh='git reset --hard HEAD'
alias gs='git status'
alias gsa='g sa'
alias gsho='git show'
alias gsl='git stash list'
alias gss="git stash save (date '+%b %d, %Y at %I:%M %p')"
alias gtrack='git update-index --no-assume-unchanged'
alias guntrack='git update-index --assume-unchanged'
alias spacemacs='emacs -mm &'
alias gdsfc='gdsf --cached'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias findExec='find $1 -type $2 -name $3 -exec grep -HniF --color=always $4 "{}" \;' 

# [variables]
android_tools=$HOME/android/platform-tools
develop=$HOME/Develop
vagrant=$develop/Vagrant/www/html
archive=$vagrant/archive/wp-content
archive_child=$archive/themes/archive-child
archive_plugin=$archive/plugins/storycorps/includes/StoryCorps
brew=(brew --prefix)
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
pass=(cat ~/pwd.txt)
scme=$develop/sc.me/www/wp-content
scorg=$develop/scorg/www/wp-content
vorg=$vagrant/scorg/wp-content

# [functions]
function colorizen {
    colorize $1 | perl -e 'print ++$i." $_" for -1<>'
}

function empty {
    echo '' > $1
}

function hgrep {
    history 1 | grep $1
}

function rless { 
    sed '1!G;h;$!d' $1 | less
}

#  [wp-cli setup]
# ================
WP_CLI_PHP=$mampp_php
WP_CLI_CONFIG_PATH=~/.wp-cli/config.yaml
