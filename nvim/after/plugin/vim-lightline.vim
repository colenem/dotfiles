let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified'
      \ }
   \ }

function! LightlineFugitive()
    if exists("g:loaded_fugitive") && g:loaded_fugitive == 1
        let l:branch = FugitiveHead()
        let l:status = execute(':silent !git status -s | rg -o "^(\?+|\sM|M\s)"') "check for unstaged (<whitespace>M), staged (M<whitespace>), and untracked files (??)

        " Explanation: 
        " 1. check if branch name is empty
        "   a. check for uncommitted changes
        "     i. branch is dirty, show branch name with an X
        "     ii. branch is clean, show branch name with checkmark
        " 2. we're not in a git repo, show nothing 
        return (l:branch !=# '') ?
                    \ ( len(l:status) > 0 ) ?
                    \ (" \ue0a0 " . l:branch . " \u2717" ) :
                    \ (" \ue0a0 " . l:branch . " \u2713" ) :
                    \ ('')
    endif
    return ''
endfunction
