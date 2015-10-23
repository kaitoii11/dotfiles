filetype off
filetype plugin indent off

if has('vim_starting')
  if &compatible
     set nocompatible " Be iMproved
   endif
"Required:
  set runtimepath+=/Users/ii/.vim/bundle/neobundle.vim/
endif
"Required:
call neobundle#begin(expand('/Users/ii/.vim/bundle'))
" Let NeoBundle manage NeoBundle
"Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"plugins
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complet'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
  \ }
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', {
      \ 'depends' : 'Shougo/unite.vim'
      \ }
NeoBundle 'jceb/vim-hier'
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'wesleyche/srcexpl'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'rking/ag.vim'
call neobundle#end()

filetype on
filetype plugin indent on
filetype indent on

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,eucjp-ms,euc-jisx0213,euc-jp,sjisutf-8
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
set mouse=a
set ignorecase
set lazyredraw
"set relativenumber
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
set foldmethod=indent

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
 " $B5/F0;~$KM-8z2=(B
let g:neocomplcache_enable_at_startup = 1
" $BBgJ8;z$,F~NO$5$l$k$^$GBgJ8;z>.J8;z$N6hJL$rL5;k$9$k(B
let g:neocomplcache_enable_smart_case = 1
" _($B%"%s%@!<%9%3%"(B)$B6h@Z$j$NJd40$rM-8z2=(B
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1

" $B%]%C%W%"%C%W%a%K%e!<$GI=<($5$l$k8uJd$N?t(B
let g:neocomplcache_max_list = 20
" $B%7%s%?%C%/%9$r%-%c%C%7%e$9$k$H$-$N:G>.J8;zD9(B
let g:neocomplcache_min_syntax_length = 3

" $B%G%#%/%7%g%J%jDj5A(B
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'php' : $HOME . '/.vim/dict/php.dict',
      \ 'ctp' : $HOME . '/.vim/dict/php.dict'
      \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default']= '\h\w*'

"$B%9%K%Z%C%H$rE83+$9$k!#%9%K%Z%C%H$,4X78$7$J$$$H$3$m$G$O9TKv$^$G:o=|(B
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"
" $BA02s9T$o$l$?Jd40$r%-%c%s%;%k$7$^$9(B
inoremap <expr><C-g> neocomplcache#undo_completion()
"
"$BJd408uJd$N$J$+$+$i!"6&DL$9$kItJ,$rJd40$7$^$9(B
inoremap <expr><C-l> neocomplcache#complete_common_string()

" $B2~9T$GJd40%&%#%s%I%&$rJD$8$k(B
inoremap <expr><CR> neocomplcache#smart_close_popup() ."\<CR>"

"tab$B$GJd408uJd$NA*Br$r9T$&(B
inoremap <expr><TAB> pumvisible() ?"\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"
"<C-h>$B$d(B<BS>$B$r2!$7$?$H$-$K3N<B$K%]%C%W%"%C%W$r:o=|$7$^$9(B
inoremap <expr><C-h> neocomplcache#smart_close_popup().$B!I(B\<C-h>$B!I(B
"
" $B8=:_A*Br$7$F$$$k8uJd$r3NDj$7$^$9(B
inoremap <expr><C-y> neocomplcache#close_popup()
"
"$B8=:_A*Br$7$F$$$k8uJd$r%-%c%s%;%k$7!"%]%C%W%"%C%W$rJD$8$^$9(B
inoremap <expr><C-e> neocomplcache#cancel_popup() " "
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"


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
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {'mode': 'passive'}
augroup AutoSyntastic
  autocmd!
  autocmd InsertLeave * call s:syntastic()
augroup END
function! s:syntastic()
  w
  SyntasticCheck
endfunction

"nerdtree:
" $B1#$7%U%!%$%k$r%G%U%)%k%H$GI=<($5$;$k(B
let NERDTreeShowHidden = 1
"
autocmd vimenter * if !argc() | NERDTree | endif
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
" }}
"
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
let mapleader = "\<Space>"
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
