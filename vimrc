"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ian Suvak's .vimrc
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 filetype off

let vundle_autoinstall = 0
let vundle_readme = expand('~/.vim/bundle/vundle/README.md')

" Auto-installing Vundle

if !filereadable(vundle_readme)
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let vundle_autoinstall = 1
endif


 set rtp+=~/.vim/bundle/vundle
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 "My Bundles here:
 "
 "
 
 Bundle 'corntrace/bufexplorer'
 Bundle 'itchyny/lightline.vim'
 Bundle 'Raimondi/delimitMate'
 Bundle 'sjl/gundo.vim'
 Bundle 'godlygeek/tabular'

 " Tim Pope

 Bundle 'tpope/vim-repeat'
 Bundle 'tpope/vim-unimpaired'

" Scrooloose

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'


Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'taglist.vim'

" Colors

Bundle 'altercation/vim-colors-solarized'
Bundle 'ciaranm/inkpot'

" Syntax for other languages
Bundle 'nono/vim-handlebars'

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => General
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Sets number of lines of history remembered
 set history=700

 " Enable filetype plugins
 filetype plugin indent on

" no .ext~ files"
 set nobackup 
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => VIM User Interface
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " Turn on WiLd menu
 set wildmenu

 " Modern search
 set incsearch 

 " Ignore case while searching
 set ignorecase 

 " Highlight search results
 set hlsearch

 " Set line numbering on
 set number

 " Show current command execution in the bottom line
 set showcmd

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Fonts and Style
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "Enable syntax highlighting
 syntax enable

 "Set the dark version of solarized
 set background=dark
 call togglebg#map("")
 colorscheme solarized

 set encoding=utf-8

 "" Set font for gVIM
 if has('gui_running')
   set guifont=Anonymous_Pro:h11:cANSI
 endif

 " Use Unix as default encoding, makes it pass the Wayfair PEAR standards
 set ffs=unix,dos,mac


 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "=>White space
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 " Don't wrap lines
 set nowrap

 " 1 tab = 4 spaces
 set tabstop=2
 set softtabstop=2
 set shiftwidth=2

 " Use spaces instead of tab characters
 set expandtab

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "=> Plugins
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 ""Enables HTML snippets in PHP files for SnipMate
 au BufRead,BufNewFile *.php set ft=php.html

"Lightline
"
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ }
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_php_phpcs_args = '--standard=CSNStores'
let g:syntastic_php_checkers =['php', 'phpcs']

"ctags

"set tags=~/tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Toggle NERDTree with \n
map <leader>n :NERDTreeToggle %:p:h<CR>

"Ctrl-p Fuzzy-File finder maps to CTRL + p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP d:\code\'
let g:ctrlp_max_files=0

" Map \v to open vimrc
map <leader>v :sp d:\Program\ Files\Vim\_vimrc<CR><C-W>_

nmap <F8> :TagbarToggle<CR>

nnoremap <space> :set hlsearch!<return>:set expandtab<return>:retab<return>

