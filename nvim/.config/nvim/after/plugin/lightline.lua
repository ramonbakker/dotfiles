vim.api.nvim_exec([[
    function! LightlineFileIconAndPath()
        return v:lua.require('nvim-web-devicons').get_icon(expand('%:t'), expand('%:e')) . ' ' . expand('%:f')
    endfunction

    function! LightlineGitBranch()
        return winwidth(0) > 70 ? FugitiveHead() : ''
    endfunction

    function! LightlineTabActiveFileIconAndName(n)
        let bufList = tabpagebuflist(a:n)
        let winNr = tabpagewinnr(a:n)
        let bufName = expand('#'.bufList[winNr - 1])
        let bufFiletype = expand('#'.bufList[winNr - 1].':e')
        return v:lua.require('nvim-web-devicons').get_icon(bufName, bufFiletype) . ' ' . lightline#tab#filename(a:n)
    endfunction
]], false)
