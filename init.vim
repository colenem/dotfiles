set nocompatible              " be iMproved, required filetype off
filetype plugin indent on
set t_Co=256

" use bash as default shell when executing commands in vim
set shell=bash

so ~/.vim_plug.vim
so ~/.vim_plugin_settings.vim

set rtp+=$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim,/usr/local/bin/fzf

let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python'

" ********************************
" **   Default Custom Settings  **
" ********************************

" Basic settings
syntax on "turn on syntax highlighting
set listchars+=eol:¬,tab:\|·,trail:·,precedes:·,extends:·,space:·
set list
set hidden
set nu cursorcolumn cursorline
set mouse=a "enable the mouse
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab autoindent smartindent "setup tab spacing
set smarttab
au FileType * set fo-=c fo-=r fo-=o fo+=2n fo-=t "stop inserting comment chars automatically (when going to a newline)
set backspace=indent,eol,start "make backspace work like in other programs
"set digraph
set listchars+=eol:¬,tab:\|·,trail:·,precedes:·,extends:·,space:·

" xterm not supported in neovim -- disable it as needed
if !has('nvim')
    set ttymouse=xterm
endif

" bold font for functions, language controls
let g:enable_bold_font = 1

"    Keymappings
" =================
so ~/.keymappings.vim

"    Colorscheme setup
" =======================
if has("gui_vimr")
    set background=dark
    colo antares | hi Normal guibg=black | hi Delimiter guifg=#ffaf87
    hi Whitespace guifg=#767676
else
    "colo antares
    "colo default
    "hi Normal ctermbg=16
    "colo onedark
    colo delek
    hi Normal ctermbg=16
endif


"    Syntax highlighting preferences with a dark bg
" ====================================================
hi clear         CursorColumn
hi Comment       ctermbg=none guifg=#929393
hi NonText       ctermbg=none
hi Special       ctermbg=none ctermfg=74 guibg=black
hi LineNr        ctermbg=none guibg=black ctermfg=6 guifg=#10d0ff
hi CursorLineNr  ctermfg=2
hi SpecialKey    ctermfg=123
hi CursorColumn  ctermbg=236 guibg=#4e4e4e
hi clear cursorline
set cursorline
hi CursorLine cterm=underline ctermbg=236 guibg=#4e4e4e
hi Whitespace guifg=#767676
hi Matchparen ctermbg=171 ctermfg=white guibg=#10d0ff guifg=black
hi DiffAdd    ctermfg=83
hi DiffDelete ctermbg=124 ctermfg=214
" set tags+=./.tags;
set tags=wp-content/.tags;
set noshowmode
"hi CursorLine    gui=underline cterm=underline ctermbg=236 guibg=#f00 guifg=#6DC5CD
"hi CursorLine    gui=underline cterm=underline ctermbg=236 guibg=#303030
"hi CursorLine    gui=underline cterm=underline ctermbg=236
" ======== FIND IN PHP.VIM =======
"hi phpRegion     ctermfg=210   guifg=#ff8787
"hi phpMethodsVar ctermfg=11    guifg=#ffff00
"hi Delimiter     ctermfg=216   guifg=#ffaf87
"set tags=./tags

"    File Tree Settings (netrw)
" ================================
let g:netrw_banner = 0        " hide the banner at the top
let g:netrw_liststyle = 3     " get NerdTREE like view
"let g:netrw_browse_split = 3  " open files in a new tab
let g:netrw_altv = 1 "split file to right of browser (only if using 4 on previous line)
let g:netrw_winsize = 14      " use 25% of the page width to show the file tree
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

"    GUI Specific Settings
" ===========================
" dont set the clipboard if using oni gui
if !exists("g:gui_oni")
    set clipboard=unnamed "share buffers between all vim instances -- this allows to copy and paste between different instances
    "echo 'ONI is not active'
    "hi Normal guibg=#000
elseif exists("g:gui_oni")
    " Taken from oni's init config found here: ~/oni/vim/default/bundle/oni-vim-defaults/plugin/init.vim
    colo Tomorrow-Night-Bright
    set noswapfile smartcase splitright splitbelow
    set noruler noshowcmd
    set laststatus=0

    augroup vimrc
        autocmd!
        autocmd ColorScheme * hi Whitespace guifg=#767676
    augroup END

    " Helpers for command mode
    " %% for current buffer file name
    " :: for current buffer file path
    cnoremap %% <C-R>=fnameescape(expand('%'))<CR>
    cnoremap :: <C-R>=fnameescape(expand('%:p:h'))<CR>/

    " Make Control+nav keys functionality in insert mode
    inoremap <expr> <C-a> pumvisible() ? "<Esc>A" : "<C-o>A"
    inoremap <expr> <C-b> pumvisible() ? "<Esc>bi" : "<C-o>b"
    inoremap <expr> <C-l> pumvisible() ? "<Esc>la" : "<C-o>a"

    tnoremap <Esc> <C-\><C-n>
endif

" ************************************
" **   End Default Custom Settings  **
" ************************************
