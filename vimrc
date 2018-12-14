set nocompatible                " choose no compatibility with legacy vi


"" Setting up Vundle - the vim plugin bundler
"" Stolen ;) from http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif


filetype off                    " vundle required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'

" Cierre automático de paréntesis, llaves...
Plugin 'Townk/vim-autoclose'

" Autogeneración de docstrings
Plugin 'heavenshell/vim-pydocstring'

Plugin 'ervandew/supertab'

Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

Plugin 'jakedouglas/exuberant-ctags'
Plugin 'vim-syntastic/syntastic'

Plugin 'ryanoasis/vim-devicons'

" Vombato color scheme
Bundle 'molok/vim-vombato-colorscheme'
" Wombat256 color scheme
Bundle 'vim-scripts/wombat256.vim'
" TextMate Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Insert use statements automatically
Bundle 'arnaud-lb/vim-php-namespace'
" Symfony stuff
Bundle 'docteurklein/vim-symfony'
" PHPUnit support
" Bundle 'docteurklein/vim-phpunit'
" PHP5.4 support
Bundle 'shawncplus/php.vim'
" NERDTree
Bundle 'scrooloose/nerdtree'
" Twig support
Bundle 'evidens/vim-twig'
" HTML snippets
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Surround with parentheses, brackets, quotes, tags...
Bundle 'tpope/vim-surround'
" Groovy support
Bundle 'vim-scripts/groovy.vim'
" Sintax checking
" Bundle 'scrooloose/syntastic'
" Full path finder
Bundle 'kien/ctrlp.vim'
" Better statusline
"Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/powerline'
" Git support
Bundle 'tpope/vim-fugitive'
" Git diff changes
Bundle 'airblade/vim-gitgutter'
" Better Markdown support
Bundle 'tpope/vim-markdown'
" Tagbar
Bundle 'majutsushi/tagbar'
" Php tagbar enhance
Bundle 'techlivezheng/vim-plugin-tagbar-phpctags'
" Folding plugin for python
Bundle 'tmhedberg/SimpylFold'

" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'

" Jinja vim
Bundle 'Jinja'

" Jedi vim
Bundle 'davidhalter/jedi-vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" 
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
"" Setting up Vundle - the vim plugin bundler end


set number                      " Show line numbers
syntax enable
set encoding=UTF-8
set showcmd                     " display incomplete commands
set hidden                      " no need save to change buffer
filetype plugin indent on       " load file type plugins + indentation


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode


"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Folding
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview=1

"" Colors
set background=dark
set t_Co=256
if has("gui_running")
    colorscheme vombato
else
    colorscheme wombat256mod
endif

"Python syntax related thingies
Plugin 'nvie/vim-flake8'
"Plugin  'gryf/pylint-vim'
syntax on

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif    " Open NERDTree on vim starts up if no files were specified
map <F2> :NERDTreeToggle<CR>                       " Crtl+n to open NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif  " Close vim if only NERDTree

" Powerline
set laststatus=2   " Always show the statusline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

" Docstring
set softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
nmap <F3> :Pydocstring<CR>

" TagBar
nmap <F8> :TagbarToggle<CR>

" Vim-plugin-tagbar-phpctags
let g:tagbar_phpctags_memory_limit = '512M'

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


call vundle#end()            " required
filetype plugin indent on    " required
:set colorcolumn=120

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif

nmap <silent> <C-_> <Plug>(pydocstring)

map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

hi Normal ctermbg=232
