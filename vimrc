scriptencoding utf-8
set encoding=utf-8

let mapleader=","

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

set lines=45 columns=120
set guifont=DejaVuSansMono_NF:h11

set shiftwidth=4
set tabstop=4

" Don't use tearoff menus (t)
" Don't show toolbar (T)
set guioptions-=tT

set termguicolors    " Use 24-bit color
set background=dark  " Use dark colorscheme variants
colorscheme graywh

" Let mouse wheel scroll file contents in console
" When using ConEmu, remember to chcp 65001 for fonts
if !has("gui_running")
    " Enable ANSI colors in Vim.
    set term=xterm
    set t_Co=256
    " Fix terminal foreground/background
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    " Fix backspace issues in ConEmu
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif

" Highlight problematic whitespace
set listchars=tab:›\ ,trail:•,precedes:«,extends:»,nbsp:·,eol:¬

" Load powerline symbols
let g:airline_powerline_fonts = 1
" Load airline's tabline extension
let g:airline#extensions#tabline#enabled = 1

" Keymaps
nnoremap gb :ls<CR>:buffer<Space>
nnoremap <C-N> :NERDTree<CR>
" Might replace this with tpope/vim-unimpaired
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
" Use %% to expand current path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Toggle spelling
nmap <silent> <C-s>s :set spell!<CR>

" File Type Json
nmap <silent> <Leader>ftj :set filetype=json<CR>
" File Format Json
nmap <silent> <Leader>ffj :%!py -m json.tool<CR>
nmap <silent> <Leader>ffx :%!py -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml(newl=''))"<CR>
" Yank Current Directory to clipboard
nmap ycd :let @* = expand("%")<CR>
" Yank Current File to clipboard
nmap ycf :let @* = expand("%:p")<CR>

" Commands
" Set current directory to that of the currently opened file.
command! Root cd %:p:h
