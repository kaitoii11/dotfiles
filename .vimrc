set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"setting
set number "line
set showmode "showmode
set ruler
set showcmd
set showmatch
set cursorline

"search
set ignorecase
set smartcase
set wrapscan

"display
syntax on
set autoindent
set smartindent
set smarttab
set expandtab


"enable mouse
if has("mouse") " Enable the use of the mouse in all modes
  set mouse=a
  endif
"parantheses match
inoremap " ""
inoremap ' ''
vnoremap { "zdi{z}
vnoremap {" "zdi{"z"}
vnoremap {' "zdi{'z'}
vnoremap [ "zdi[z]
vnoremap [" "zdi["z"]
vnoremap [' "zdi['z']
vnoremap ( "zdi(z)
vnoremap (" "zdi("z")
vnoremap (' "zdi('z')
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Vundle自身もVundleで管理
Bundle 'gmarik/vundle'
Bundle 'The-NERD-tree'

filetype plugin indent on

