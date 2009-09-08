colorscheme default
set guioptions-=T
set cmdheight=1

" for errormarker.vim
au BufReadPost,BufWritePost * silent make %

if has('mac') || has('gui_macvim')
  set guifont=Menlo:h11
  set guifontwide=Menlo:h11
endif
