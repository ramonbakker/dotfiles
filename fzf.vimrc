" Overwrite part of
" https://github.com/junegunn/fzf.vim/blob/master/plugin/fzf.vim to follow
" symlinks
function! s:p(...)
  let preview_args = get(g:, 'fzf_preview_window', ['right', 'ctrl-/'])
  if empty(preview_args)
    return { 'options': ['--preview-window', 'hidden'] }
  endif

  " For backward-compatiblity
  if type(preview_args) == type('')
    let preview_args = [preview_args]
  endif
  return call('fzf#vim#with_preview', extend(copy(a:000), preview_args))
endfunction

command! -bang -nargs=* Rg call fzf#vim#grep("rg --follow --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, s:p(), <bang>0)
