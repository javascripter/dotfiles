set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on
set autoindent
set smartindent
set smarttab
set shiftround
set softtabstop=0
set backspace=indent,eol,start
set formatoptions+=m
set wildmenu

set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch

set nobackup
set autoread
set noswapfile
set hidden

set showmatch
set showcmd
set number
set ruler
set wrap
set scrolloff=5
set list
set listchars=tab:\ \ ,trail:-

set termencoding=utf-8
set fileformats=unix,dos,mac

set modeline
set modelines=10
autocmd FileType ruby,javascript,perl,scheme,python,html,css,haskell set tabstop=2 shiftwidth=2 expandtab
autocmd FileType c,cpp set tabstop=4 shiftwidth=4 noexpandtab


set background=light
set term=xterm-color
