call plug#begin()

Plug 'vim-scripts/peaksea'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'vim-scripts/taglist.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'

Plug 'sheerun/vim-polyglot'
Plug 'tfnico/vim-gradle'

call plug#end()

set nocompatible              " be iMproved, required
filetype off                  " required

" turn on syntax highlighting
syntax on

" turn off Vi-compatible mode
set nocompatible

" change leader key
let mapleader = ","
nnoremap <leader>a :Ack<Space>

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

"set showmatch     " briefly jumps to matched brace
"set matchtime=3   " time of showmatch

" use regular regex
nnoremap / /\v
vnoremap / /\v

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

" throw out F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set number  " always show line numbers
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

" Format the status line
"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%F%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04B\ %*          "character under cursor

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
au BufNewFile,BufRead *.gradle setf groovy

"set tags+=~/.vim/tags/cpp
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"if has("cscope")
"	set csprg=/usr/bin/cscope
"	set csto=0
"	set cst
"	set nocsverb
"	" add any database in current directory
"	if filereadable("cscope.out")
"	    cs add cscope.out
"	" else add database pointed to by environment
"	elseif $CSCOPE_DB != ""
"	    cs add $CSCOPE_DB
"	endif
"	set csverb
"endif

" color scheme settings
if ! has("gui_running") 
    set t_Co=256 
endif 
set background=dark 
"colors peaksea 
colorscheme palenight

"NERDtree plugin
map <C-N> :NERDTreeToggle<CR>

" --------------------
" TagList plugin
" --------------------
" F4: Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>
" TagListTagName - Used for tag names
"highlight MyTagListTagName gui=bold guifg=Black guibg=Orange
" TagListTagScope - Used for tag scope
"highlight MyTagListTagScope gui=NONE guifg=Blue
" TagListTitle - Used for tag titles
"highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray
" TagListComment - Used for comments
"highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
"highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exit_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compact_Format = 1 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 1 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglist menu, you should set this variable to 1.
":TlistShowPrototype [filename] [linenumber]
let tlist_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;c:class;g:enum;s:struct;u:union;f:function;m:member'

map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3

set wildmenu
set wildmode=list:longest,full

set splitbelow
set splitright
