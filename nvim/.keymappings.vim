" display file tree
map <C-n> :NERDTreeToggle<CR>
"map <C-n> :Ranger<CR>

" search
nnoremap / /\v
nnoremap <Leader>v /\V
nnoremap <Leader>vf /\V<C-r><C-w>
nnoremap <Leader>f :,$s#<C-r><C-w>##gc<Left><Left>
nnoremap <Leader>fn :%s/<C-r><C-w>//gn <BAR> noh

" list buffers
nnoremap <C-b> :ls<CR>:bd<Space>
nnoremap <Leader>b :ls <CR>:b<Space>

" quick save
nnoremap <Leader>s :w<CR>

" show help
nnoremap <Leader>h :tab help
nnoremap <Leader>' ciw'<C-r>"'

" save and source
nnoremap <Leader>so :w <bar> so ~/.config/nvim/init.vim<CR>

" display syntax attribute (for overriding default vim styles)
nnoremap <C-x> :redir @*<BAR>exec ':echo synIDattr(synID(line("."), col("."),1), "name")'<BAR>redir END <CR>


" Wrap with quotes/parens
"nnoremap <Leader>q' ciw''<Esc>P
vnoremap <Leader>q. c..<Esc>P
vnoremap <Leader>q' c''<Esc>P
vnoremap <Leader>q" c""<Esc>P
vnoremap <Leader>q( c()<Esc>P
vnoremap <Leader>fm :%!python -m json.tool
"vmap <Leader>chm :set ft=html<CR> :execute "normal \<Plug>NERDCommenterMinimal" :set ft=php
"nmap <Leader>hm :<C-U>:set ft=html<CR> <Plug>NERDCommenterMinimal <BAR> :set ft=php<CR>
"vmap <Leader>hm :<C-U>:set ft=html<CR> <leader>cm <BAR> :set ft=php<CR>
"vnoremap <Leader>hm :set ft=html<CR> :call NERDComment(0, 'toggle")<CR> :set ft=php<CR>
"map <Leader>hm :<C-U>:set ft=html<CR> <Plug>NERDCommenterToggle('x', 'Minimal')<Cr>
"nnoremap R gq} " reformat paragraphs and lists
map <Leader>c<space> <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>
