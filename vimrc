set nocompatible " Use Vim settings, rather then Vi settings (much better!).

call pathogen#infect() 

"""""""""""""" General """""""""""""""""
" Change the mapleader from \ to ,
let mapleader=","
let g:mapleader=","

set history=1000 
set undolevels=1000

" protects against exploits
set modelines=0

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set encoding=utf-8
" Minimum number of lines above/below the cursor
set scrolloff=3

" Intendation
set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

syntax enable
set background=dark
colorscheme solarized

set number
set relativenumber

set ruler " Show line and column number in status bar
set ls=2 " Always show status bar
set cursorline " Highlight the current line
set showcmd " Show incomplete cmds down the bottom
set showmode " Show current mode down the bottom
set hidden " http://items.sjbach.com/319/configuring-vim-right

" search
set ignorecase
set smartcase " Make searches case-sensitive only if there's a capital letter in the search expression
set hlsearch " Highlight search terms...
set incsearch " ...dynamically as they are typed
set gdefault

set visualbell

" Command completion
set wildmenu
set wildmode=list:longest
" Ignore compiled files
set wildignore=*.o,*~,*.pyc

set ttyfast

" Make backspace delete eveythign
set backspace=indent,eol,start

" Always display status line
set laststatus=2

"set undofile

" Very magic regexps
nnoremap / /\v
vnoremap / /\v

" This removes higlighted matches
nnoremap <leader><space> :noh<cr>
 
nnoremap <tab> %
vnoremap <tab> %

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" TODO
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
"set list
"set listchars=tab:▸ "\ ,eol:¬

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

"nnoremap <C-d> 20<C-e>
"nnoremap <C-u> 20<C-y>
"vnoremap <C-d> 20<C-e>
"vnoremap <C-u> 20<C-y>


" Makes j and k work the way you expect
nnoremap j gj
nnoremap k gk

" remaps ; to : and disables :
nnoremap ; :
nnoremap : <Nop>

" jj switches to normal mode and disables escape
inoremap jj <ESC>
imap <ESC> <Nop>

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Use arrow keys for buffer management
nnoremap <left> :bprev<cr>
nnoremap <right> :bnext<cr>
nnoremap <down> :buffer #<cr>
nnoremap <up> :buffers<cr>:buffer<space>

" Folds
set foldlevel=20 " Default to have all folds open
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap s <Plug>(easymotion-s)
nmap z <Plug>(easymotion-w)
nmap Z <Plug>(easymotion-b)

runtime macros/matchit.vim

" Powerline
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set guifont=Menlo\ Regular\ for\ Powerline

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_jshint_conf="~/.jshintrc"


"function! VisualSelection(direction) range
    "let l:saved_reg = @"
    "execute "normal! vgvy"

    "let l:pattern = escape(@", '\\/.*$^~[]')
    "let l:pattern = substitute(l:pattern, "\n$", "", "")

    "if a:direction == 'b'
        "execute "normal ?" . l:pattern . "^M"
    "elseif a:direction == 'gv'
        "call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    "elseif a:direction == 'replace'
        "call CmdLine("%s" . '/'. l:pattern . '/')
    "elseif a:direction == 'f'
        "execute "normal /" . l:pattern . "^M"
    "endif

    "let @/ = l:pattern
    "let @" = l:saved_reg
"endfunction

" Open nerdvim automatically when no file was specified
autocmd vimenter * if !argc() | NERDTree | endif


nmap <silent> <F2> :NERDTreeToggle<CR>
