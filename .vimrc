if !&compatible
  set nocompatible
endif
" dein settings {{{
" セッテイング
set runtimepath+=~/.vim/dein.vim
" プラグイン読み込み&キャッシュ作成
call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neocomplete.vim', { 'on_i': 1 } )
call dein#add('Shougo/neosnippet', { 'on_i': 1 } )
call dein#add('scrooloose/syntastic')
call dein#add('thinca/vim-quickrun')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('jceb/vim-hier')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('terryma/vim-expand-region')
call dein#add('davidhalter/jedi-vim')
call dein#add('wesleyche/srcexpl')
call dein#add('vim-scripts/taglist.vim')
call dein#add('szw/vim-tags')
call dein#add('Townk/vim-autoclose')
call dein#add('rking/ag.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Shougo/vimfiler')
call dein#add('scrooloose/nerdtree')
call dein#add('fatih/vim-go')
call dein#end()
call dein#save_state()

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}

"End dein Scripts-------------------------

filetype on
filetype plugin indent on
filetype indent on

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
scriptencoding utf-8
set fileformats=unix,dos,mac

"setting
set number "line
set showmode "showmode
set ruler
set showcmd
set showmatch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set cursorline
set wildmenu
set title
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set nocp
set whichwrap=b,s,h,l,<,>,[,],~
set ignorecase
set lazyredraw
:au FocusLost * silent! wa

"search
set ignorecase
set smartcase
set wrapscan
set hlsearch
set incsearch

" fold
set foldenable
set foldnestmax=3
nnoremap <space> za
set foldmethod=syntax
set nofoldenable

"display
syntax on
colorscheme koehler
"set autoindent
set smartindent
set smarttab
set expandtab
set cindent
set statusline=2
set laststatus=2

"enable mouse
if has("mouse") " Enable the use of the mouse in all modes
  set mouse=a
endif
"parantheses match
vnoremap { "zdi{z}
vnoremap {" "zdi{"z"}
vnoremap {' "zdi{'z'}
vnoremap [ "zdi[z]
vnoremap [" "zdi["z"]
vnoremap [' "zdi['z']
vnoremap ( "zdi(z)
vnoremap (" "zdi("z")
vnoremap (' "zdi('z')
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
" $BJd40%&%#%s%I%&$N@_Dj(B
set completeopt=menuone
nnoremap j gj
nnoremap k gk
nmap <up> gk
nmap <down> gj
imap <c-j> <esc>

" vim$BN)$A>e$2$?$H$-$K!"<+F0E*$K(Bvim-indent-guides$B$r%*%s$K$9$k(B
let g:indent_guides_enable_on_vim_startup=1
" $B%,%$%I$r%9%?!<%H$9$k%$%s%G%s%H$NNL(B
let g:indent_guides_start_level=1
" $B<+F0%+%i!<$rL58z$K$9$k(B
let g:indent_guides_auto_colors=0
" $B4q?t%$%s%G%s%H$N%+%i!<(B
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626  ctermbg=gray
" " $B6v?t%$%s%G%s%H$N%+%i!<(B
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" " $B%O%$%i%$%H?'$NJQ2=$NI}(B
let g:indent_guides_color_change_percent = 30
" $B%,%$%I$NI}(B
let g:indent_guides_guide_size = 1

"syntastic
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {'mode': 'passive',
                            \'active_filetypes': ['python'],
                            \'passive_filetypes':[]}
augroup AutoSyntastic
  autocmd!
  autocmd InsertLeave * call s:syntastic()
augroup END
function! s:syntastic()
  w
  SyntasticCheck
endfunction

"nerdtree:
let NERDTreeShowHidden = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2

" unite {{{
let g:unite_force_overwrite_statusline = 0
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru bookmark file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('vplit')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q
" }}}

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:airline_left_sep=' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_right_sep=' '
let g:airline_section_z=''
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
      \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
      \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
      \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0

"region expand
call expand_region#custom_text_objects({
      \ "\/\\n\\n\<CR>": 1,
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ 'ii' :0,
      \ 'ai' :0,
      \ })
let g:expand_region_use_select_mode = 1
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"leader
noremap <Leader>      <Nop>
noremap <LocalLeader> <Nop>
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'"
nnoremap <Leader>w :w<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt
autocmd BufNewFile *.py 0r $HOME/.vim/template/py.txt
autocmd BufNewFile Makefile 0r $HOME/.vim/template/Makefile.txt
autocmd BufNewFile *.pl 0r $HOME/.vim/template/pl.txt
autocmd BufNewFile *.rb 0r $HOME/.vim/template/rb.txt
" trim trailing white space on save
autocmd BufWritePre * :%s/\s\+$//ge

"srcexpl
let g:SrcExpl_UpdateTags = 1
let g:SrcExpl_RefreshTime = 1
let g:SrcExpl_UpdateTags = 1
" taglist
set tags=tags
let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1

" ag
nmap <Space><Space> :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag
" quickrun
let g:quickrun_config = {
      \   "_" : {
      \       "outputter/buffer/close_on_empty" : 1
      \   },
      \}

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_enable_camel_case_completion = 0
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:neocomplcache_temporary_dir="$HOME/.vim/tmp/neocomplcache"

set noswapfile
autocmd BufLeave,FocusLost * silent! wall

if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamed,unnamedplus
endif

set secure

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
