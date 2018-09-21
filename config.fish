#  [ remove welcome message ]
# ============================
set -gx fish_greeting ''

#  [ fish git prompt ]
# =====================
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

#  [ Status Chars ]
# ==================
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

#  [ Colorized man pages ]
# =========================
set -x LESS_TERMCAP_mb \e'[01;31m'
set -x LESS_TERMCAP_md \e'[01;31m'
set -x LESS_TERMCAP_me \e'[0m'
set -x LESS_TERMCAP_se \e'[0m'
set -x LESS_TERMCAP_so \e'[01;44;33m'
set -x LESS_TERMCAP_ue \e'[0m'
set -x LESS_TERMCAP_us \e'[01;32m'

#  [ Set GH api token for use with brew ]
# =======================================
set -g HOMEBREW_GITHUB_API_TOKEN '<token goes here>'

#  [ Override nvm ]
# ==================
set -gx NVM_DIR (brew --prefix nvm)

if not set -q fish_user_abbreviations
    set -g fish_user_abbreviations
end

#  [variables]
# =============
set android_tools  $HOME/android/platform-tools
set develop        $HOME/Develop
set vagrant        $develop/Vagrant/www/html
set archive        $vagrant/archive/wp-content
set archive_2      "$vagrant/archive_2/wp-content"
set archive_child  $archive/themes/archive-child
set archive_plugin $archive/plugins/storycorps/includes/StoryCorps
set brew           (brew --prefix)
set config         $HOME/.config
set fish           $config/fish
set html           'www/wp-content'
set logs           'logs'
set mamp           '/Applications/MAMP'
set mamp_bin       $mamp/bin
set mamp_lib_bin   $mamp/Library/bin
set php_version    7.0.31
set mamp_php       $mamp_bin/php/php{$php_version}/bin/php
set nvim           $config/nvim
set pass           (cat ~/pwd.txt)
#set sql            $mamp/Library/bin/mysql
set scme           $develop/sc.me/www/wp-content
set scorg          $develop/scorg/www/wp-content
set varchive       $vagrant/archive/wp-content
set vorg           $vagrant/scorg/wp-content
set vagrantFile    $develop/Vagrant/Vagrantfile
# set xampp          '/Applications/XAMPP'
# set xampp_bin      $xampp/bin
# set xampp_mysql    $xampp_bin/mysql
# set xampp_php      $xampp_bin/php
set z              ~/.zshrc

# [ add to $PATH ]
#set addtl_paths ~/.composer/vendor/bin $HOME/bin
set addtl_paths ~/.composer/vendor/bin $mamp_lib_bin $mamp_bin/php/php{$php_version}/bin $HOME/bin /usr/local/opt/php@7.0/bin /usr/local/opt/php@7.0/sbin
#### add mamp lib below when using automake ####
#set addtl_paths ~/.composer/vendor/bin $mamp_bin/php/php{$php_version}/bin $HOME/bin
if set -q fish_user_paths
    set -e fish_user_paths
end

for i in $addtl_paths
    if not contains $i $fish_user_paths
        set -U fish_user_paths $fish_user_paths $i
    end
end

# setup for php7.0.32
set -gx LDFLAGS "-L/usr/local/opt/php@7.0/lib"
set -gx CPPFLAGS "-I/usr/local/opt/php@7.0/include"

# [ append mamp_lib_bin to path instead of prepend above do this when automake needed]
#if not contains $mamp_lib_bin $PATH
    #set PATH $PATH $mamp_lib_bin
#end

#  [aliases]
# ===========
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
alias lc='gls --group-directories-first --color=always'
alias lh='lc -a'
alias ll='lc -lah'
#alias lsD='gls --group-directories-first --color=always -lah'
# because sometimes fish doesn't work the way i like, so i use bash
alias lsl='~/lsl.sh'
#alias mysql='eval $mamp_lib_bin/mysql'
alias nvrc='nvim ~/.config/nvim/init.vim'
alias vim=nvim
alias omz='vim ~/custom.zsh'
alias pgen='password-generator'
alias php='eval $mamp_bin/php/php{$php_version}/bin/php'
#alias spacemacs='emacs --insecure &;'
alias trc='vim ~/.tmux.conf'
alias vimdiff='vim -d'
alias vimrc='vim ~/.vimrc'
alias vh='vagrant halt'
alias vsh='vagrant ssh'
alias vr='vagrant reload'
#alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'

#  [git aliases]
# ===============
alias gsa='g sa'
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
#git difftool
#alias gdt='g dt'
#git diff-tree
#alias gdT='g dT'
#alias gl='g l'
#alias glf='g lf'
#alias gfp='g fp'
#alias gm='g m'
#alias gma='g ma'
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

#  [abbreviations]
# =================
if set -q fish_user_abbreviations
    set -g fish_user_abbreviations
    abbr -a ga        'git add'
    abbr -a gac       'git a . ;and git commit -am'
    abbr -a gb        'git branch'
    abbr -a gbD       'git branch -D'
    abbr -a gbl       'git branch -a --color=always | less -R'
    abbr -a gbU       'git branch -u'
    abbr -a gc        'git commit'
    abbr -a gcl       'git clean'
    abbr -a gclo      'git clone'
    abbr -a gcm       'git commit -m'
    abbr -a gcam      'git commit -am'
    abbr -a gchp      'git cherry-pick'
    abbr -a gco       'git checkout'
    abbr -a gcob      'git checkout -b'
    abbr -a gcoo      'git checkout --ours'
    abbr -a gd        'git diff'
    abbr -a gdn       'git diff --name-only'
    abbr -a gdt       'git difftool --tool='
    abbr -a gdT       'git diff-tree --no-commit-id --name-only -r'
    abbr -a gl        'git log --graph --abbrev-commit --decorate --date=local'
    abbr -a gk        'gitk --all --first-parent --remotes --reflog --author-date-order'
    abbr -a glf       'git log --graph --abbrev-commit --decorate --date=local --first-parent'
    abbr -a gfp       'git fetch -p ;and git pull'
    abbr -a gm        'git merge'
    abbr -a gma       'git merge --abort'
    abbr -a gms       'git merge --no-commit --squash'
    abbr -a gmt       'git mergetool --tool='
    abbr -a gmnc      'git merge --no-commit'
    abbr -a gmnf      'git merge --no-ff'
    abbr -a gmncf     'git merge --no-commit --no-ff'
    abbr -a gp        'git push'
    abbr -a gpl       'git pull'
    abbr -a gpo       'git push origin'
    abbr -a gpu       'git push upstream'
    abbr -a grh       'git reset HEAD'
    abbr -a grhh      'git reset --hard'
    abbr -a grhhh     'git reset --hard HEAD'
    abbr -a gs        'git status'
    #abbr -a gsa       'git stash apply "stash@{\$argv}"'
    abbr -a gsho      'git show'
    abbr -a gsl       'git stash list'
    abbr -a gss       "git stash save (date '+%b %d, %Y at %I:%M %p')"
    abbr -a gtrack    'git update-index --no-assume-unchanged'
    abbr -a guntrack  'git update-index --assume-unchanged'
    abbr -a spacemacs 'emacs -mm &'
    abbr -a gdsfc     'gdsf --cached'
    abbr -a showFiles 'defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
    abbr -a hideFiles 'defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
    abbr -a findExec  'find $1 -type $2 -name $3 -exec grep -HniF --color=always $4 "{}" \;' 
end

#  [functions]
# =============
function colorizen
    colorize $argv | perl -e 'print ++$i." $_" for -1<>'
end

function empty
    echo '' > $argv
end

function desktop
    cd ~/Desktop
end

function develop
    if [ $argv ]
        cd ~/Develop/$argv
    else
        cd ~/Develop
    end
end

function emacs_special
    local macs
    if [ $1 =~ 'reg' ]; then
        if [ -n '$2']; then
            e.macs $2 &
        else
            e.macs &
        end
    elif [ $1 =~ 'wide' ]; then
        if [ -n '$2' ]; then
            e.macs $2 -geometry 140x73 &
        else
            e.macs -geometry 140x73 &
        end
    end
end

function enav
    empty $argv
    lnav $argv
end

# [custom keybindings -- add to function as needed]
function fish_user_key_bindings
    bind \e\[1~ beginning-of-line
    bind \e\[4~ end-of-line
    bind \e\[A  'history --merge ; up-or-search'
end

function fry_fish 
    source ~/.config/fish/config.fish
    echo "updated!"
end

function grhh
    g reset --hard $1
end

function gwatch
    cd $argv ;and grunt watch
end

function hgrep
    history | grep $argv
end

function nvm
    bass source ~/.nvm/nvm.sh ';' nvm $argv
end

function rless
    sed '1!G;h;$!d' $argv | less
end

function rmd
    pandoc $argv | lynx -stdin
end

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function vup
    # check if $argv has a value, could also do test -z "$argv" to check if it's empty instead
    if test -n "$argv"
        #echo yay!
        cd $argv
    end
    vagrant up
end

function vush
    vup
    vagrant ssh
end

function _vagrant
    cd $vagrant/$argv
end

#  [wp-cli setup]
# ================
set WP_CLI_PHP $mampp_php
set WP_CLI_CONFIG_PATH ~/.wp-cli/config.yaml
#set WP_CLI_PHP (brew --prefix homebrew/php/php70)
