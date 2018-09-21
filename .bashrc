#  [ variables ]
# ===============
nvim=$HOME/.config/nvim
ports_bin='/opt/local/bin'
ports_sbin='/opt/local/sbin'
paths=($ports_bin $ports_sbin)

#  [ add to $PATH ]
# ======================
for i in "${paths[@]}"; do
    if [ -d $i ] && [[ ":$PATH:" != *":$i:"* ]] ; then # if the specified path exists and [is a directory ( -d )]
       export PATH="$i:$PATH"
    fi
done

#  [ set prompt and colors ]
# ===========================
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

#  [ nvm goodies ]
# =================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#  [ Colorized man pages ]
# =========================
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

#  [regular aliases]
# ===================
alias aliasrc='vim ~/.bash_aliases'
alias bashrc='vim ~/.bashrc'
alias bource='source ~/.bash_aliases'
alias empty="echo '' > $argv"
alias install='sudo apt install -y $argv'
alias lh='gls -a --group-directories-first'
alias ll='gls -alh --group-directories-first'
alias sql='sd service mysql $argv'
alias nx='sd service nginx $argv'
alias sd='sudo '
alias svim='sudo vim'
alias trc='vim ~/.tmux.conf'
alias update='sudo apt update'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
