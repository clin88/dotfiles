if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set runtimepath+=~/.vim/bundle/neobundle.vim/

"""""""""""""""""""""""""""""""""""
" PLUGINS

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" {{{ STANDARD PLUGINS

Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/vimproc', {                               
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
Plugin 'tomtom/tcomment_vim'                    " Automatically add comments
Plugin 'tpope/vim-repeat'                       " Allows '.' command to cover more stuff.
Plugin 'tpope/vim-surround'                     " Auto surrounding
if !has("nvim")
    Plugin 'tpope/vim-sensible'                     " Sensible defaults
endif
Plugin 'altercation/vim-colors-solarized'       " Solarized color scheme
Plugin 'Townk/vim-autoclose'                    " Automatically close {} [] etc.
Plugin 'ciaranm/detectindent'                   " Automatically set indent settings for every file.
Plugin 'kien/ctrlp.vim'                         " Ctrl-p and extensions
Plugin 'airblade/vim-gitgutter'                 " Indicate VCS changes in gutter
" Plugin 'xolox/vim-session'                      " Session management
Plugin 'xolox/vim-misc'                         " Required for vim-session

Plugin 'vim-airline/vim-airline'                " better statusline
let g:airline_powerline_fonts = 1               " turn on powerline fonts

"""""""""""""""""""""""""""""""""""
  
Plugin 'ervandew/supertab'                      " Reassigns autocomplete to tab.
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" Defaults to omnicomplete and use <c-p> as a fallback
autocmd FileType *
\ if &omnifunc != '' |
\   call SuperTabChain(&omnifunc, "<c-p>") |
\   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
\ endif
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

"""""""""""""""""""""""""""""""""""
Plugin 'justinmk/vim-sneak'

"""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/syntastic'                   " Syntax checking
" Syntastic options
let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }


"""""""""""""""""""""""""""""""""""
" Automatically jump to tags (i.e. browse file structure)
Plugin 'majutsushi/tagbar'

" My hotkey
nmap <F12> :TagbarOpenAutoClose<CR>

" Show relative line numbers
let g:tagbar_show_linenumbers = 2

"""""""""""""""""""""""""""""""""""
" Alignment on characters
Plugin 'junegunn/vim-easy-align'                

" Start interactive EasyAlign in visual mode
vmap <CR> <Plug>(EasyAlign)
" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""
Plugin 'terryma/vim-multiple-cursors'                " Multiple cursors like in Sublime

"}}}

"{{{ HASKELL

"""""""""""""""""""""""""""""""""""
" Tagbar support for Haskell
" if executable('lushtags')
"     let g:tagbar_type_haskell = {
"         \ 'ctagsbin' : 'lushtags',
"         \ 'ctagsargs' : '--ignore-parse-error --',
"         \ 'kinds' : [
"             \ 'm:module:0',
"             \ 'e:exports:1',
"             \ 'i:imports:1',
"             \ 't:declarations:0',
"             \ 'd:declarations:1',
"             \ 'n:declarations:1',
"             \ 'f:functions:0',
"             \ 'c:constructors:0'
"         \ ],
"         \ 'sro' : '.',
"         \ 'kind2scope' : {
"             \ 'd' : 'data',
"             \ 'n' : 'newtype',
"             \ 'c' : 'constructor',
"             \ 't' : 'type'
"         \ },
"         \ 'scope2kind' : {
"             \ 'data' : 'd',
"             \ 'newtype' : 'n',
"             \ 'constructor' : 'c',
"             \ 'type' : 't'
"         \ }
"     \ }
" endif

"""""""""""""""""""""""""""""""""""
" Vim2hs
" Plugin 'dag/vim2hs'                             " Haskell extensions
let g:haskell_autotags     = 0
let g:haskell_conceal      = 0
let g:haskell_conceal_wide = 0

" }}}

"{{{ PYTHON 

"""""""""""""""""""""""""""""""""""
" Python mode
Plugin 'klen/python-mode'
let g:pymode_lint_cwindow = 0
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_lookup_project = 0

"}}}

"""""""""""""""""""""""""""""""""""
" TODO: AutoCmd for DetectIndent
" TODO: Some kind of autocomplete, especially for Haskell.
" TODO: GHCMod vim
" TODO: Vimseek
" TODO: Cursorcolumn


call vundle#end()
filetype plugin indent on

" {{{ EDITOR CONFIG

syntax on
set background=light
colorscheme solarized
set number
set relativenumber
set hls
set is
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set ruler
set laststatus=2
set ignorecase
set smartcase
set scrolloff=15
set foldenable
set nosmarttab
" set shiftround                                            " Round spaces to nearest shiftwidth multiple
set go-=L               " Remove left scrollbar in GUI vim
set guioptions-=r
set fillchars+=vert:\   " Removes pipe characters in split seperators.
set nowrap
" filetype plugin on 
set textwidth=79
set foldmethod=marker
" set ttm=100               " Removes delay after switching back to normal mode
" set tm=100
set completeopt-=preview                    " Disables preview window during autocomplete
set completeopt+=menuone
set completeopt+=longest
set autoread
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set noesckeys
set indentkeys=

" }}}

" {{{ MAPPINGS AND ETC.

" Highlight cursor line to indicate insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Mappings for managing split windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l
map <C-H> <C-W>h


" This unsets the last search pattern register by hitting return
nnoremap <Space> :noh<CR><Space>

" }}}
