let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch' : 'LightlineFugitive',
      \ }
   \ }

function! LightlineFugitive()
    if exists("g:loaded_fugitive") && g:loaded_fugitive == 1
        let branch = FugitiveHead()
        "let l:output = systemlist( FugitiveShellCommand(['status', '--porcelain'] ) )

        return (branch !=# '') ?
                \ (" \ue0a0 " . branch ) :
                \ ('')

       " Explanation:
       " 1. check if branch name is empty
       "   a. check for uncommitted changes
       "     i. branch is dirty, show branch name with an X
       "     ii. branch is clean, show branch name with checkmark
       " 2. we're not in a git repo, show nothing
       " return (g:branch !=# '') ?
       "             \ ( len(output) > 0 ) ?
       "             \ (" \ue0a0 " . g:branch . " \u2717" ) :
       "             \ (" \ue0a0 " . g:branch . " \u2713" ) :
       "             \ ('')
    endif
    return ''
endfunction

