function! LightlineFileIconAndPath()
    return WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:f')
endfunction

function LightlineGitBranch()
    return winwidth(0) > 70 ? FugitiveHead() : ''
endfunction
