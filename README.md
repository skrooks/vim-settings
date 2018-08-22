# Requirements

Requires at least Vim v8.0 or NeoVim v0.2.0 because it uses the new packages feature that is now built-in to Vim.

You also need to have git installed.

## Fonts

Two of the included packages ([vim-airline] and [vim-devicons]) require a patched font to display correctly. You can grab one from [Nerd Fonts]. Avoid the v2.0.0 fonts since they're not correctly recognized as monospace fonts. Install the desired font on your system. Go to the GitHub page and go to the Releases. Grab the desired font from the v1.2.0 release until v2.1.0 is ready.

On Ubuntu, just add the font files to `~/.fonts`. Since I use nvim from terminal, I set the terminal's default font to the desired patched Nerd Font.

# Installation

Vim and NeoVim put their configs in different locations, so I prefer to just clone this repo, then symlink the files to their expected locations.

For GVim on Windows
```
mklink /j %USERPROFILE%\.vim C:\repos\vim-settings
mklink %USERPROFILE%\_vimrc C:\repos\vim-settings\.vimrc
```

For NeoVim on Ubuntu
```
ln -s ~/repos/vim-settings ~/.config/nvim
ln -s ~/.config/nvim/.vimrc ~/.config/nvim/init.vim
```

You'll also need to install [minpac]. Navigate to the vim-settings folder
```
git clone https://github.com/k-takata/minpac.git pack/minpac/opt/minpac
```

To install the rest of the plugins, open [package-management.vim] in vim or nvim, then
```
:source %
:PackUpdate
```

# Package Management

Packages are managed via [minpac], which uses Vim's new packages feature. The minpac configuration is a bit different from what is recommended in their install instructions, mainly because I don't feel the need to update packages all that often.

Packages are specified in [package-management.vim]. After making any changes, source the file via `:source %`, then `:PackUpdate` or `:PackClean` as needed.

# Special Key Mappings

* `<C-N>` opens NERDTree
* `<Left>` and `<Right>` cycle between open buffers, shown at the top
* `gb` (mnemonic Goto Buffer) will list the available buffers, asking which one to switch to
* In command mode, `%%` will expand to the current path

[package-management.vim]:package-management.vim
[vim-airline]:https://github.com/vim-airline/vim-airline
[vim-devicons]:https://github.com/ryanoasis/vim-devicons
[NerdFonts]:https://nerdfonts.com
[minpac]:https://github.com/k-takata/minpac
