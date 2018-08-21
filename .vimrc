scriptencoding utf-8
set encoding=utf-8

filetype plugin indent on
syntax on

packadd! matchit

set hidden      " Allow buffer switching without saving
set number      " Show line numbers
set hlsearch    " Highlight search results
set incsearch   " Highlight results as you type
set ignorecase  " Make searches case-insensitive
set smartcase   " Make searches case-sensitive if you mix case
set backspace=indent,eol,start  " Backspace for dummies
set mouse=a     " Enable mouse support
set vb t_vb=    " Stop the beeping!

set guifont=DejaVuSansMono_NF:h11

" Don't use tearoff menus (t)
" Don't show toolbar (T)
set guioptions-=tT

set termguicolors    " Use 24-bit color
set background=dark  " Use dark colorscheme variants
colorscheme graywh

" Highlight problematic whitespace
set listchars=tab:›\ ,trail:•,precedes:«,extends:»,nbsp:·,eol:¬

" Load powerline symbols
let g:airline_powerline_fonts = 1
" Load airline's tabline extension
let g:airline#extensions#tabline#enabled = 1

" Keymaps
nnoremap gb :ls<CR>:buffer<Space>
nnoremap <C-N> :NERDTree<CR>
nnoremap <Left> :bnext<CR>
nnoremap <Right> :bprevious<CR>
" Use %% to expand current path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Commands
" Set current directory to that of the currently opened file.
command! Root cd %:p:h
