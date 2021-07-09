" Taking a slightly different approach for package management.
" Since you have to open this file to add packages anyway, just source this
" file to load minpac and get the PackUpdate/PackClean commands.
" :source %
" :PackUpdate

packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-fugitive')
call minpac#add('mhinz/vim-signify')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('scrooloose/nerdcommenter')
call minpac#add('nathanaelkane/vim-indent-guides')
call minpac#add('godlygeek/tabular')
call minpac#add('ap/vim-css-color')
call minpac#add('vim-scripts/Improved-AnsiEsc')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('OmniSharp/omnisharp-vim')
call minpac#add('nickspoons/vim-sharpenup')

" VimDevIcons needs to be called last-ish
call minpac#add('ryanoasis/vim-devicons')

" Color schemes
call minpac#add('Heorhiy/VisualStudioDark.vim', {'type': 'opt'})
call minpac#add('NLKNguyen/papercolor-theme', {'type': 'opt'})
call minpac#add('danilo-augusto/vim-afterglow', {'type': 'opt'})
call minpac#add('nanotech/jellybeans.vim', {'type': 'opt'})
call minpac#add('nightsense/carbonized', {'type': 'opt'})

" Define user commands for updating/cleaning the plugins.
command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()
