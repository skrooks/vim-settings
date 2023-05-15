# Requirements

Requires at least Vim v8.0 or NeoVim v0.2.0 because it uses the new packages feature that is now built-in to Vim.

You also need to have git installed.

## Fonts

Two of the included packages ([vim-airline] and [vim-devicons]) require a patched font to display correctly. You can grab one from [Nerd Fonts]. Go to the GitHub page and check the Releases. Nerd Fonts 3.0 generally provides a font in 3 flavors: regular, mono, and propo. The mono option is strictly monospaced, meaning larger gliphs can get scaled down to be tiny. As for the difference between regular and propo, maybe see discussion [#951](https://github.com/ryanoasis/nerd-fonts/discussions/951).

On Ubuntu, just add the font files to `~/.fonts`. Since I use nvim from terminal, I set the terminal's default font to the desired patched Nerd Font.

# Installation

Vim and NeoVim put their configs in different locations, so I prefer to just clone this repo, then symlink the files to their expected locations.

For GVim on Windows

GVim 8.1 uses `%USERPROFILE%\vimfiles`, but it's nothing but empty folders. Clear it, and checkout the project there.

For NeoVim on Ubuntu
```
ln -s ~/repos/vim-settings ~/.config/nvim
ln -s ~/.config/nvim/vimrc ~/.config/nvim/init.vim
```

You'll also need to install [minpac]. From within the vim-settings folder
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

# Plugins

* [vim-repeat] - Adds `.` command support for other plugins like [vim-surround].
* [vim-surround] - Deals with surrounding things.
  * `ys<motion><surround>`, e.g. `ysiw"` - wraps the word with "
  * `cs<from><to>`, e.g. `cs'"` - change surrounding ' to "
  * `ds<surround>`, e.g. `ds"` - delete surrounding "
* [vim-abolish] - Deals with variants of words.
  * `:Abolish` - Adds abbreviations to help correct spelling mistakes
    * `:Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{}`
  * `:Subvert` - Like :substitute, but supports variants
    * `:%Subvert/facilit{y,ies}/building{,s}/g`
  * Coersion mapping `cr<style>` for changing word/separator formatting
    * `crs` for snake\_case
    * `crm` for MixedCase
    * `crc` for camelCase
    * `cru` for UPPER\_CASE
    * `cr-` for dash-case
    * `cr.` for dot.case
    * `cr<space>` for space case
    * `crt` for Title Case
* [vim-fugitive] - Git commands for Vim.
  * [A complement to command line git](http://vimcasts.org/e/31)
  * [Working with the git index](http://vimcasts.org/e/32)
  * [Resolving merge conflicts with vimdiff](http://vimcasts.org/e/33)
  * [Browsing the git object database](http://vimcasts.org/e/34)
  * [Exploring the history of a git repository](http://vimcasts.org/e/35)
* [vim-signify] - Show added, modified, removed lines for git files.
* [vim-easymotion] - Use `<Leader><Leader><motion>` for quick naviation.
* [vim-airline] - An awesome status/tabline.
* [vim-airline-themes] - Themes for [vim-airline]
  * `:AirlineTheme <theme>` to change on the fly
  * `let g:airline_theme='<theme>'` for vim config
* [ctrlp.vim] - A fuzzy file, buffer, mru, tag... finder for Vim.
* [nerdtree] - A tree explorer. Use `<C-N>` or `:NERDTree` to invoke.
* [nerdcommenter] - Does comments. Use `<Leader>c<action>`, e.g. `<Leader>c<space>` to toggle comments.
* [vim-indent-guides] - Visually display indent levels in code.
* [tabular] - Aligns text. See [Aligning Text with Tabular.vim](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/).

[package-management.vim]:package-management.vim
[vim-devicons]:https://github.com/ryanoasis/vim-devicons
[NerdFonts]:https://github.com/ryanoasis/nerd-fonts
[minpac]:https://github.com/k-takata/minpac
[vim-repeat]:https://github.com/tpope/vim-repeat
[vim-surround]:https://github.com/tpope/vim-surround
[vim-abolish]:https://github.com/tpope/vim-abolish
[vim-fugitive]:https://github.com/tpope/vim-fugitive
[vim-signify]:https://github.com/mhinz/vim-signify
[vim-easymotion]:https://github.com/easymotion/vim-easymotion
[vim-airline]:https://github.com/vim-airline/vim-airline
[vim-airline-themes]:https://github.com/vim-airline/vim-airline-themes
[ctrlp.vim]:https://github.com/ctrlpvim/ctrlp.vim
[nerdtree]:https://github.com/scrooloose/nerdtree
[nerdcommenter]:https://github.com/scrooloose/nerdcommenter
[vim-indent-guides]:https://github.com/nathanaelkane/vim-indent-guides
[tabular]:https://github.com/godlygeek/tabular
