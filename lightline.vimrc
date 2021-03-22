function! LightlineFileIconAndPath()
    return WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:f')
endfunction

function! LightlineGitBranch()
    return winwidth(0) > 70 ? FugitiveHead() : ''
endfunction

function! LightlineTabActiveFileIconAndName(n)
    let bufList = tabpagebuflist(a:n)
    let winNr = tabpagewinnr(a:n)
    let bufName = expand('#'.bufList[winNr - 1])
    return WebDevIconsGetFileTypeSymbol(bufName) . ' ' . lightline#tab#filename(a:n)
endfunction
