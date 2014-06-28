set nocompatible 
filetype off
filetype plugin indent off

if has('vim_starting')
        set runtimepath+=~/.vim/neobundle/neobundle.vim/
        call neobundle#rc(expand('~/.vim/neobundle/'))
endif

"plugins
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplchache-snippets-complet'
NeoBundle 'Shougo/vimproc'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelakne/vim-indent-guide'

filetype on
filetype plugin indent on
filetype indent on 

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"setting
set number "line
set showmode "showmode
set ruler
set showcmd
set showmatch
set cursorline
set wildmenu
set title
set backspace=indent,eol,start
set tabstop=4

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
"inoremap " ""
"inoremap ' ''
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


" vim$B$rN)$A>e$2$?$H$-$K!"<+F0E*$K(Bvim-indent-guides$B$r%*%s$K$9$k(B
let g:indent_guides_enable_on_vim_startup = 1
