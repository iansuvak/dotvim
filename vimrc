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
 Bundle 'justinmk/vim-sneak'
 Bundle 'gcmt/wildfire.vim'

 " Tim Pope

 Bundle 'tpope/vim-repeat'
 Bundle 'tpope/vim-unimpaired'
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-surround'

" Scrooloose

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'


Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'taglist.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'laurentgoudet/vim-howdoi.git'

" Colors
Bundle 'altercation/vim-colors-solarized'
Bundle 'ciaranm/inkpot'
"Bundle 'godlygeek/csapprox'

" Syntax for other languages
Bundle 'nono/vim-handlebars'

"Debug
Bundle 'joonty/vdebug'


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

 " Smart case while searching (case-sensitive if there are any caps)
 set smartcase

 " Highlight search results
 set hlsearch

 " Set line numbering on
 set number

 " Show current command execution in the bottom line
 set showcmd

 " Use vertical splits by default for diffs and fugitive
 set diffopt=vertical

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " => Fonts and Style
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "Enable syntax highlighting
 syntax enable

 "Set the dark version of solarized
 set background=dark
 "call togglebg#map("")
 set t_Co=256
 let g:solarized_termcolors=256
 colorscheme solarized

 set encoding=utf-8

 "" Set font for gVIM
 if has('gui_running')
   set guifont=Anonymous_Pro:h11:cANSI
 endif

 " Use Unix as default encoding, makes it pass the Wayfair PEAR standards
 set ffs=unix,mac

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
 "let g:lightline = {
 "\ 'colorscheme': 'solarized_dark',
 "\ 'active': {
 "\   'left': [ [ 'mode', 'paste' ],
 "\             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
 "\ },
 "\ 'component': {
 "\   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
 "\   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'}
 "\ }

 let g:lightline = {
       \ 'colorscheme': 'wombat',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
       \ },
       \ 'component': {
       \   'readonly': '%{&readonly?"":""}',
       \   'modified': '%{&modified?"+":"-"}'
       \ },
       \ 'component_function': {
       \   'fugitive': 'MyFugitive'
       \ },
       \ 'separator': { 'left': '', 'right': '' },
       \ 'subseparator': { 'left': '', 'right': '' }
       \ }


 function! MyFugitive()
   if exists("*fugitive#head")
     let _ = fugitive#head()
     return strlen(_) ? ''._ : ''
   endif
   return ''
 endfunction

 let g:syntastic_javascript_checkers = ['jshint']
 let g:syntastic_php_checkers =['php', 'phpcs']
 let g:syntastic_phpcs_conf = '--standard=CSNStores'

"ctags

"set tags=~/tags

"VDebug

"let g:vdebug_options = {
  "\ 'port' : 9001,
  "\ 'path_maps' : {"/usr/local/www/data": "/wayfair/home/isuvak/data-local"}
  "\}
let g:vdebug_options = {
  \ 'port' : 9001,
  \ 'break_on_open' : 0,
  \ 'watch_window_style' : 'compact'
  \}
"let g:vdebug_features = {
  "\ 'max_depth' : 4086,
  "\ 'max_data' : 16000,
  "\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Toggle NERDTree with \n
map <leader>n :NERDTreeToggle %:p:h<CR>

"Toggle Gundo wiht \u
nmap <leader>u :GundoToggle<CR>

"Ctrl-p Fuzzy-File finder maps to CTRL + p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP d:\code\'
let g:ctrlp_max_files=0

" Map \v to open vimrc
map <leader>v :sp ~/.vimrc<CR><C-W>_

nmap <F8> :TagbarToggle<CR>


nnoremap <space> :set hlsearch!<return>:set expandtab<return>:retab<return>:FixWhitespace<return>
