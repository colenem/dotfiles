set ft=vim
colo peachpuff

" Plugin Directory
call plug#begin('/home/colene/.config/nvim/autoload/plugged')

" use bash as default shell when executing commands in vim
set shell=bash

" [Mode line status]
" ==================
 Plug 'itchyny/lightline.vim', { 'as': 'vim-lightline' } " vim lightline (lighter than other powerline plugins)

" [ File Completion and indentation extras ]
" ==========================================
" Code completion
Plug 'ervandew/supertab', { 'as': 'vim-supertab' }

" Code completion
if !exists("g:gui_oni")
    Plug 'Shougo/deoplete.nvim', { 'as': 'vim-deoplete', 'do': ':UpdateRemotePlugins' }
end

" Debugging
Plug 'joonty/vdebug', { 'as': 'vim-xdebug' }

" Match html tags
Plug 'Valloric/MatchTagAlways', { 'as': 'vim-match-tag-always' }

" Alignment
Plug 'junegunn/vim-easy-align'

" Toggle comments
Plug 'scrooloose/nerdcommenter', { 'as': 'vim-nerd-commenter' }  "<leader> key is \"

" PHP Completions
Plug 'shawncplus/phpcomplete.vim', { 'as': 'vim-php-completions' }

" Autoclose quotes
Plug 'Raimondi/delimitMate', { 'as': 'vim-delimitMate' }

" Wrap quotes/parenthesis around text
Plug 'tpope/vim-surround', { 'as': 'vim-surround' }

" HTML/CSS auto completion (cuz you know, lazy)
Plug 'mattn/emmet-vim', { 'as': 'vim-emmet' }

" Snippet completion    | default snippets
Plug 'SirVer/ultisnips', { 'as': 'vim-ultisnips' } | Plug 'honza/vim-snippets', { 'as': 'vim-ultisnips-extras' }

" Tern JS
Plug 'ternjs/tern_for_vim', { 'as': 'vim-ternjs' }
Plug 'carlitux/deoplete-ternjs', { 'as': 'vim-deoplete-ternjs', 'for': ['javascript', 'javascript.jsx'] }

" Editorconfig
Plug 'editorconfig/editorconfig-vim', { 'as': 'vim-editorconfig' }

" Indent php files
Plug '2072/PHP-Indenting-for-VIm', { 'as': 'vim-php-indenting' }
" Plug 'ciaranm/detectindent' " Smart indent detection (tabs/spaces)
" Plug 'dag/vim-fish'         " Fish shell syntax highlighting in vim

" YouCompleteMe
" Plug 'Valloric/YouCompleteMe'

" [ File Tree ]
" =============
" File tree navigation       | Adds git support to file tree
Plug 'scrooloose/nerdtree', { 'as': 'vim-nerdtree' } | Plug 'Xuyuanp/nerdtree-git-plugin', { 'as': 'vim-nerdtree-git-plugin' }
"Plug 'francoiscabrol/ranger.vim', { 'as': 'vim-ranger' } | Plug 'rbgrouleff/bclose.vim', { 'as': 'vim-bclose' }
"Plug 'tpope/vim-vinegar'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim', { 'as': 'vim-fzf' }

" Vim Fugitive (Git Status Chars)
Plug 'tpope/vim-fugitive' 

" [ Syntax Highlighting ]
" =======================
" Code Linting
Plug 'vim-syntastic/syntastic', { 'as': 'vim-syntastic' }

" Nginx syntax highlighting
Plug 'chr4/nginx.vim', { 'as': 'vim-syntax-nginx' }

" PHP Syntax Highlighting
Plug 'StanAngeloff/php.vim', { 'as': 'vim-syntax-php' }

" PHP Blade
Plug 'jwalton512/vim-blade', { 'as': 'vim-syntax-php-blade' }

"JS Syntax Highlighting
Plug 'jelera/vim-javascript-syntax', { 'as': 'vim-syntax-javascript' } 
Plug 'pangloss/vim-javascript', { 'as': 'vim-syntax-javascript-extras' }

"jQuery extras
Plug 'othree/javascript-libraries-syntax.vim', { 'as': 'vim-syntax-jQuery' }

" Typescript
Plug 'leafgarland/typescript-vim', { 'as': 'vim-typescript' }
Plug 'peitalin/vim-jsx-typescript'

" Preview CSS Colors
"Plug 'chrisbra/Colorizer', { 'as': 'vim-colorizer' }
Plug 'ap/vim-css-color', { 'as': 'vim-css-color' }

" Xterm color chart
Plug 'guns/xterm-color-table.vim', { 'as': 'vim-xterm-color-table' }

" Fish syntax highlighting
Plug 'dag/vim-fish', { 'as': 'vim-fish' }

" Rainbow parentheses
"Plug 'luochen1990/rainbow', { 'as': 'vim-rainbow-parentheses' }
Plug 'kien/rainbow_parentheses.vim', { 'as': 'vim-rainbow-parentheses' }

" Plug 'ap/vim-css-color' " CSS color preview alternative
" Plug 'vim-scripts/nginx.vim' " Nginx highlighting alternative

" [ Colorschemes and color extras ]
" =================================
" Cycle through color schemes with F4
Plug 'vim-scripts/CycleColor', { 'as': 'vim-cycle-color' }

" Code Dark
Plug 'tomasiser/vim-code-dark', { 'as': 'vim-theme-code-dark' }

" Ayu
Plug 'ayu-theme/ayu-vim', { 'as': 'vim-theme-ayu' }

" Distinguished colorscheme
Plug 'Lokaltog/vim-distinguished', { 'as': 'vim-theme-distinguished' }

" Material Vim Theme
Plug 'tyrannicaltoucan/vim-quantum', { 'as': 'vim-theme-quantum' }

"Material Theme (Atom)
Plug 'kristijanhusak/vim-hybrid-material', { 'as': 'vim-theme-hybrid-material' }

" Neodark colorscheme
Plug 'KeitaNakamura/neodark.vim', { 'as': 'vim-theme-neodark' }

" Seabird colorscheme
Plug 'nightsense/seabird', { 'as': 'vim-theme-seabird' }

" Seoul256
Plug 'junegunn/seoul256.vim', { 'as': 'vim-theme-seoul256' }

" Vim One
Plug 'rakr/vim-one', { 'as': 'vim-theme-one' }

" Woju
Plug 'woju/vim-colors-woju', { 'as': 'vim-theme-woju' }

" Wombati
Plug 'dsolstad/vim-wombat256i', { 'as': 'vim-theme-wombat256i' }

" Colorscheme Mega Pack (some themes outdated)
Plug 'flazz/vim-colorschemes', { 'as': 'vim-theme-megapack' }

" Initialize plugin system
call plug#end()
