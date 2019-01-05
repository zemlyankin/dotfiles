call plug#begin()

" Color schemes
Plug 'vim-scripts/peaksea'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

" configurable status line
Plug 'itchyny/lightline.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" shows git modifications in gutter
Plug 'airblade/vim-gitgutter'

" git wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" shows whitespaces at the end of line
Plug 'ntpeters/vim-better-whitespace'

" allows to run ack-grep and ag
Plug 'mileszs/ack.vim'
" plugs in multiple syntax highlighting schemes
Plug 'sheerun/vim-polyglot'
" syntax highlighting for Gradle build files
Plug 'tfnico/vim-gradle'
" runs static ananlysis for numerous file types
Plug 'scrooloose/syntastic'

call plug#end()

" change leader key to Space
let mapleader = "\\"
map <Space> <leader>

" leader mappings
nnoremap <leader>a :Ack!<Space>

" use regular regex
nnoremap / /\v
vnoremap / /\v

" opens fzf buffers
nmap ; :Buffers<CR>
nmap <Leader>o :Files<CR>
nmap <Leader>t :Tags<CR>

" turn off Vi-compatible mode
set nocompatible

" turn on syntax highlighting
syntax on

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
set textwidth=79
set formatoptions=qrn1

set number  " always show line numbers
set relativenumber  " show relative numbers
"set showmatch     " set show matching parenthesis
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
"set visualbell           " don't beep
set noerrorbells         " don't beep

if has("autocmd")
    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    " ...
endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

au BufNewFile,BufRead *.gradle setf groovy

" color scheme settings
if ! has("gui_running")
    set t_Co=256
endif
set background=dark
colorscheme palenight

"NERDtree plugin
map <C-N> :NERDTreeToggle<CR>

set wildmenu
set wildmode=list:longest,full

set splitbelow
set splitright

" Plugin vim-better-whitespace
let g:show_spaces_that_precede_tabs=1
