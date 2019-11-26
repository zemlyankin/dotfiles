call plug#begin()

" Color schemes
Plug 'vim-scripts/peaksea'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'altercation/vim-colors-solarized'

" shows directory tree
Plug 'scrooloose/nerdtree'

" good switching between tmux and vim windows
Plug 'christoomey/vim-tmux-navigator'

" configurable status line
Plug 'itchyny/lightline.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" easy commenting with gc{motion}
Plug 'tpope/vim-commentary'

" allows to change/delete/insert surroundings
Plug 'tpope/vim-surround'

" multiple combinations like prev/next
Plug 'tpope/vim-unimpaired'

" provides repeating with "." for several plugins
Plug 'tpope/vim-repeat'

" shows git modifications in gutter
Plug 'airblade/vim-gitgutter'

" git wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" shows whitespaces at the end of line
Plug 'ntpeters/vim-better-whitespace'

" allows to run ack-grep and ag and show results in quickfix
Plug 'mileszs/ack.vim'

" plugs in multiple syntax highlighting schemes
Plug 'sheerun/vim-polyglot'

" indentation for groovy
Plug 'vim-scripts/groovyindent-unix'

" syntax/indent for jenkinsfile
Plug 'martinda/jenkinsfile-vim-syntax'

" syntax highlighting for Gradle build files
Plug 'tfnico/vim-gradle'

" runs async static ananlysis
Plug 'w0rp/ale'

" automatically inserts closing tag
Plug 'alvan/vim-closetag'

" improves finding of matching objects with %
Plug 'andymass/vim-matchup'

call plug#end()

" change leader key to Space
let mapleader = "\\"
map <Space> <leader>

" leader mappings
nnoremap <leader>a :Ack!<Space>

" opens fzf buffers
nmap ; :Buffers<CR>
nmap <leader>o :Files<CR>
nmap <leader>t :Tags<CR>

"NERDtree plugin
map <C-N> :NERDTreeToggle<CR>

" color scheme settings
if ! has("gui_running")
    set t_Co=256
endif
set background=dark
colorscheme palenight

" turn off Vi-compatible mode
set nocompatible

" show all commands in status
set showcmd

" hide buffers instead of closing
set hidden

" highlighted search
set hlsearch
set incsearch

" great commands and undo history
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" intellectual indentation
"set autoindent      "keep indentation from previous line
"set copyindent      "copy the previous indentation on autoindenting
"set smartindent     "automatically inserts indentation in some cases
"set cindent         "like smartindent, but stricter and more customisable
set shiftwidth=4    "number of spaces to use with autoindentation
set shiftround      "use multiple of shiftwidth when indenting with '<' and '>'
set smarttab        "insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set expandtab
set tabstop=4
set softtabstop=4

set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵ "symbols for whitespace characters

"set showmatch     " briefly jumps to matched brace
"set matchtime=3   " time of showmatch

" use intelligent case-sensetive search
set ignorecase      "ignore case when searching
set smartcase       "ignore case if search pattern is all lowercase,
                    "   case-sensitive otherwise

" substitution for whole line
set gdefault

" wrap settings
set wrap
set textwidth=80
set formatoptions=qrn1

set number  " always show line numbers
set relativenumber  " show relative numbers
"set showmatch     " set show matching parenthesis
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title

"never beep
set visualbell
set noerrorbells
set t_vb=

" Always show the status line
set laststatus=2

set wildmenu
set wildmode=list:longest,full

set splitbelow
set splitright

" turn on syntax highlighting
syntax on

" Enable file type detection.
filetype plugin indent on

autocmd BufNewFile,BufRead *.gradle setfiletype groovy
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" Search for tags recursively up to root project dir
set tags=tags;/

" Plugin vim-better-whitespace
let g:show_spaces_that_precede_tabs=1

" Plugin closetag
let g:closetag_filetypes = 'html,xhtml,phtml,xml'

" Plugin NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"

