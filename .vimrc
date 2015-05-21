set nocompatible 
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
NeoBundle 'Shougo/vimproc'
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
call neobundle#end()

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

" vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
"$B<+F0@^$j$?$?$_L58z(B
let g:TeX_AutoFolding = 0 
let g:Tex_Folding = 0 
let g:Imap_UsePlaceHolders = 1 
let g:Imap_DeleteEmptyPlaceHolders = 1 
let g:Imap_StickyPlaceHolders = 0 
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_FormatDependency_ps = 'dvi,ps'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi' 
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'mendex -U $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1 
let g:Tex_ViewRule_pdf = 'open -a Preview.app'
let g:Tex_ViewRule_ps = 'open'
let g:Tex_ViewRule_dvi = 'open'

"Auto-date
let b:autodate_format = '%Y/%m/%d'
