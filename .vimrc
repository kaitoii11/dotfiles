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
set hlsearch
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
"set relativenumber
:au FocusLost * silent! wa

"search
set ignorecase
set smartcase
set wrapscan

"display
syntax on
colorscheme koehler
"set autoindent
set smartindent
set smarttab
set expandtab
set cindent

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
" 補完ウィンドウの設定
 set completeopt=menuone
 " 起動時に有効化
let g:neocomplcache_enable_at_startup = 1          
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1 
let g:neocomplcache_enable_camel_case_completion  =  1
 
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
        
" ディクショナリ定義
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'php' : $HOME . '/.vim/dict/php.dict',
      \ 'ctp' : $HOME . '/.vim/dict/php.dict'
      \ }
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default']= '\h\w*'

"スニペットを展開する。スニペットが関係しないところでは行末まで削除
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"                                   
" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()
"                                    
"補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()

" 改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() ."\<CR>"

"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ?"\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"                                       
"<C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
"                                        
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
"
"現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup() " "


" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=1
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626  ctermbg=gray
" " 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray
" " ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
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
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
"
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeMouseMode=2


" unite {{{
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

let g:airline_theme='badwolf'
let g:airline_left_sep=' '
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
