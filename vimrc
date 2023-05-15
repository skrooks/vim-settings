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
if (has("gui_macvim"))
    set guifont=DejaVuSansM\ Nerd\ Font:h12
else
    set guifont=DejaVuSansM\ Nerd\ Font:h12
endif

set shiftwidth=4
set tabstop=4
set expandtab

" Don't use tearoff menus (t)
" Don't show toolbar (T)
set guioptions-=tT

set termguicolors    " Use 24-bit color
set background=light
colorscheme PaperColor

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

let g:ctrlp_custom_ignore = 'node_modules\|.git\|packages\|compiled\|dist\|bin\|obj'

let g:highlightedyank_highlight_duration = 200

let g:OmniSharp_selector_ui = 'ctrlp'
let g:OmniSharp_popup_options = {
\ 'padding': [0, 1, 0, 1],
\ 'border': [1]
\}

" Keymaps
nnoremap gb :ls<CR>:buffer<Space>
nnoremap <C-N> :NERDTree<CR>
" Might replace this with tpope/vim-unimpaired
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
" Use %% to expand current path in command mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" vim-sharpenup
set updatetime=500
nmap <silent> <buffer> <a-cr> <Plug>(omnisharp_code_actions)
xmap <silent> <buffer> <a-cr> <Plug>(omnisharp_code_actions)

" Toggle spelling
nmap <silent> <C-s>s :set spell!<CR>

" File Type C# Stacktrace
nnoremap <silent> <Leader>fts :set filetype=stacktrace<CR>
" File Type Java Logs
nnoremap <silent> <Leader>ftl :set filetype=javalog<CR>

" File Type JSON
nnoremap <silent> <Leader>ftj :set filetype=json<CR>

" File Format JSON
nnoremap <silent> <Leader>ffj :%!python3 -m json.tool<CR>

" File Format Multi-JSON, useful for formatting multiple json documents in one buffer
" Remove blank lines so we can add commas correctly.
" Prep for putting docs into an array by appending comma to all but last JSON object
" Use normal mode to add '{"entries": [' to start wrapping in object with array content
" Use normal mode to close array and entries object
" Run through python formatting tool
" Use normal mode to strip entries wrapper and unindent
" Remove appended commas
" Turn off highlighting from substitution
nnoremap <silent> <Leader>ffm :%g/^$/d \| :1,$-1s/}$/},/ \| :execute 'normal ggO{"entries": [' \| :execute 'normal Go]}' \| %!py -m json.tool<CR>:silent execute 'normal gg2ddGk2ddggVG2<<' \| %s/^},$/}/ \| :noh<CR>

" File Format XML
nnoremap <silent> <Leader>ffx :%!py -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml(newl=''))"<CR>

" File Line-breaks (change \r\n and \n to line breaks)
nnoremap <silent> <Leader>fl :%s/\\\\/\\/ge \| %s/\(\\r\)\?\\n/<C-V><C-M>/Ige \| noh<CR>

" Yank Current Directory to clipboard
nmap ycd :let @* = expand("%")<CR>
" Yank Current File to clipboard
nmap ycf :let @* = expand("%:p")<CR>

" Commands
" Set current directory to that of the currently opened file.
command! Root cd %:p:h
