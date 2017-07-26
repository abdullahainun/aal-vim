""""""""" General Vim settings """""""""""""""""

syntax enable

set backspace=2
set mouse=a
set fileformats=unix,dos
set ruler
set laststatus=2

" Auto read when a file is changed from the outside.
set autoread

" Tab key produces 4 spaces, and tab characters are converted to spaces.
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

set pastetoggle=<F2>
" When you start searching text with /, search is performed at every
" new character insertion.
set incsearch
set hlsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Turn on filetype detection and load the plugin files for
" specific file types.
filetype plugin on

" Pathogen to install plugins as git submodules.
call pathogen#infect()

" Styles.
set t_Co=256
set background=dark
color jellybeans
let g:airline_theme='jellybeans'

highlight LineNr ctermfg=grey
highlight Folded ctermfg=grey
highlight VertSplit ctermbg=grey ctermfg=grey

" Yellow as selected whatever colour.
highlight Search ctermbg=Yellow ctermfg=Black
highlight Visual ctermbg=Yellow ctermfg=Black
highlight VisualNOS ctermbg=Yellow ctermfg=Black

" Copy & paste from system clipboard (only available if vim was compiled with clipboard support).
if has('clipboard')
  exe 'map <C-c> "+y<CR>'
endif

" Fuzzy search.
" * Adding tags extension
" * Opens the last used mode
set path=$PWD/**
let g:ctrlp_max_height = 20
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_working_path_mode='a'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_extensions = ['tag']
" Apply here IDE defaults.
" ToggleType and PrtCurStart extended to remove the duplicates once re-maped.
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>', '<c-a>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-c>', '<c-RightMouse>'],
    \ 'AcceptSelection("v")': ['<c-f>', '<c-MiddleMouse>'],
    \ 'ToggleType(1)':        ['<c-up>'],
    \ 'PrtCurStart()':        ['<c-i>'],
\ }

" Mustache
let g:mustache_abbreviations = 1

" Airline showing the current tag.
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_section_y = ''
let g:airline#extensions#hunks#enabled = 0

" Show trailing whitespaces and tabs.
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * call clearmatches()
autocmd BufWinLeave * call clearmatches()
autocmd InsertLeave * call clearmatches()
autocmd InsertEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\|\t/

" Loading user settings and overwrites.
if filereadable(expand("~/.vim/custom.vim"))
    source ~/.vim/custom.vim
endif

" pathogen command 
execute pathogen#infect()
" Note: Skip initialization for vim-tiny or vim-small.
" if 0 | endif
"
" if &compatible
"   set nocompatible               " Be iMproved
"   endif
"
"   " Required:
"   set runtimepath+=~/.vim/bundle/neobundle.vim/
"
"   " Required:
"   call neobundle#begin(expand('~/.vim/bundle/'))
"
"   " Let NeoBundle manage NeoBundle
"   " Required:
"   NeoBundleFetch 'Shougo/neobundle.vim'
"
"   " My Bundles here:
"   " Refer to |:NeoBundle-examples|.
"   " Note: You don't set neobundle setting in .gvimrc!
"
"   call neobundle#end()
"
"   " Required:
"   filetype plugin indent on
"
"   " If there are uninstalled bundles found on startup,
"   " this will conveniently prompt you to install them.
"   NeoBundleCheck

set nocompatible    "https://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-noccompatible-completely-useless

" https://github.com/gmarik/Vundle.vim

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"syntastic command
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"javascript plugin

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
set foldmethod=syntax

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1
