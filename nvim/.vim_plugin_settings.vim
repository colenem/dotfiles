" +++++++++++++++++++++++++++++++++++
" ++     Custom Plugin Settings    ++
" +++++++++++++++++++++++++++++++++++

"    Neodark
" =============
"let g:neodark#background='#191919' "black, gray or brown
"let g:neodark#use_256color = 1 "default: 0
"let g:neodark#terminal_transparent = 1 "default: 0
"let g:neodark#use_custom_terminal_theme = 1 "default: 0

"    Colorscheme setup
" =======================
"set background=dark
"colo peachpuff

"    Powerline setup
" =====================
 "set t_Co=256

"if has("gui_running")
  "if has("gui_gtk2")
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
  "elseif has("gui_macvim")
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
  "elseif has("gui_win32")
    "set guifont=Droid\ Sans\ Mono\ for\ Powerline:h13
  "endif
"elseif !has("gui_running")
  "if &term == 'xterm' || &term == 'xterm-256color'
    "" set <HOME>=\001 <End>=\EOF
  "endif
"endif

"let g:Powerline_symbols = 'fancy'

"set laststatus=2
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"    lightline setup
" =====================
" setup is configured in ~/.config/nvim/after/plugin/vim-lightline.vim
" needs vim fugitive to load first to use one of its functions, won't
" execute properly in this current settings file

"    Match html tags
" =====================
"let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \}

"    YouCompleteMe Options
" ===========================
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_key_list_select_completion                = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion              = ['<C-p>', '<Up>']
" let g:SuperTabContextDefaultCompletionType          = "<c-n>"
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion  = 1
" let g:ycm_min_num_of_chars_for_completion = 4

":YouCompleteMe: set python path
" let g:ycm_python_binary_path = 'python'

"    SuperTab Options
" ======================
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabDefaultCompletionType = '<C-n>'
"autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" close the preview window when you're not using it
"let g:SuperTabClosePreviewOnPopupClose = 1
"use tab always for JS
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"    Syntastic setup
" ====================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_php_checkers = ['php', 'phpcs']

let g:syntastic_error_symbol = '???'
let g:syntastic_style_error_symbol = '???'
let g:syntastic_warning_symbol = '??????'
let g:syntastic_mode_map = {
        \ 'mode': 'passive',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['js', 'php'] }

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"    Emmet defaults
" ====================
"let g:user_emmet_leader_key='~'
let g:user_emmet_leader_key='<Leader>'

"    NERDTree defaults
" =======================
" autocmd vimenter * NERDTree
let NERDTreeShowBookmarks=1
let NERDTreeMouseMode=2


"    Ranger Settings
" =====================
let g:ranger_map_keys = 0

"    UltiSnips Setup
" =====================
"let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<Leader>y"
let g:UltiSnipsListSnippets="<Leader>l"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"    Detect Indent Setup
" =========================
let g:detectindent_preferred_expandtab  = 1
let g:detectindent_preferred_indent     = 4
let g:detectindent_preferred_when_mixed = 1

"    Vim Easy Align Setup
" ==========================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Don't ignore comments or strings
let g:easy_align_ignore_groups = []

"    MatchTagAlways
" ====================
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1
    \}

"    Editorconfig
" ==================
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exec_path = '/usr/local/bin/editorconfig'

"    Tern-for-vim
" ==================
"""enable keyboard shortcuts
let g:tern_map_keys=1
"""show argument hints
let g:tern_show_argument_hints='on_hold'

" Deoplete
let g:deoplete#enable_at_startup = 1 "enable deopletion
call deoplete#custom#var( 'omni', 'functions', {
            \ 'javascript': [ 'tern#Complete', 'jspc#omni' ]
            \ })
set completeopt=longest,menuone,preview
call deoplete#custom#option( 'sources', {
            \ 'js': ['file', 'ultisnips', 'ternjs'],
            \})
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Rainbow Parentheses
let g:rainbow_active = 1

" Fish syntax
set nofoldenable
"setlocal foldmethod=manual

" Vdebug
"let g:vdebug_options = {}
"let g:vdebug_options["server"]             = '192.168.1.34'
"let g:vdebug_options["break_on_open"]      = 1
"let g:vdebug_options["path_maps"]          = { '/Users/colenemcfarlane/Develop/archive/www': '/Users/colenemcfarlane/Develop/archive/www' }
"let g:vdebug_options["debug_file"]         = '/Users/colenemcfarlane/Develop/vdebug.log'
"let g:vdebug_options["watch_window_style"] = 'compact'

"    NERDCommenter
" ===================
"source ~/.nerdcommenter.vim

" ++++++++++++++++++++++++++++++++++++++++
" ++     End Custom Plugin Settings     ++
" ++++++++++++++++++++++++++++++++++++++++
