" Pathogen must be activated before calling ``filetype plugin indent on``
call pathogen#infect()

" Do not force vi compatibility.
set nocompatible

" Allowing backspacing over anything while in insert mode.
set bs=2

" Always show the statusline below every window.
set laststatus=2

" Treat a hard-tab (ASCII byte #9) character in a file as a mod-8 indentation,
" but when autoindenting, indentation shifting, or pressing <Tab>, use mod-4
" indentation, and insert spaces instead of hard-tab characters.
set ts=8 sts=4 sw=4 expandtab smarttab

" Convenient indentation.
set autoindent smartindent

" Do not wrap lines of text.
set nowrap

" incremental searching. ignore case unless you type a capital letter,
" which makes the search case-sensitive
set ignorecase smartcase incsearch
" temporarily disable search highlighting when it gets annoying
nmap <silent> <leader>h :silent :nohlsearch<CR>

" Don't automatically resize windows when opening or closing them.
set noequalalways

" Change the titlebar to show the current file when running under a terminal.
set title

" Remap the 'Leader' key for things like opening NERDTree with ',n'
let mapleader = ','

" ==== NERDTree Config ====
" Keyboard shortcut to open NERDTree
map <Leader>n :NERDTreeToggle<CR>
" Reduce UI clutter (use the 'u' key to move up a dir)
let NERDTreeMinimalUI = 1
" Use arrows instead of + and ~ characters for directories
let NERDTreeDirArrows = 1

" If we're running under GNU Screen, pretend that it's an xterm so that
" the mouse will work correctly.
if &term =~ "^screen"
    set ttymouse=xterm2
endif

" Let Vim take over when running in a terminal so that it's possible to move
" the cursor by clicking, resize split windows by dragging the divider, etc.
set mouse=a

" Make it obvious where hard-tab characters (ASCII char #9) appear.
" Also show trailing whitespace.
set list
set listchars=tab:\│⋯,trail:·
"\|┈
"set listchars=tab:>-,trail:·  "▶ × ✖ • ● ▄ ■ ▐ ░ ▒ ▓ ▞ ┅ ━ ◀ ▶ ⋀ ⊥ ⎵ ⎶  ➜ ╳


" require for pyflakes.vim:
" is this conflicting with python.vim?
"filetype plugin indent on

" do i really want to do this?
" automatically strip trailing whitespace when saving a file:
" autocmd BufWrite * %s/\s\+$//
" TODO: keyboard shortcut to strip trailing whitespaces on demand
autocmd BufRead *.c set cindent
autocmd BufRead *.cpp set cindent
autocmd BufRead *.cxx set cindent
autocmd BufRead *.txt set tw=76 wrap formatoptions+=n
autocmd BufNewFile,BufRead *.html set ft=htmldjango
autocmd BufNewFile,BufRead *.json set ft=typescript sw=2
autocmd BufNewFile,BufRead *.ts set ft=typescript sw=2

" Normally, I use four-space indentation, but the Ruby standard
" appears to be two spaces.
autocmd FileType ruby set sw=2 sts=2

" Enable omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" If we're running under Vim version >= 7.3, highlight column 80 as the right
" margin.
if version >= 703
    set colorcolumn=80
endif

" smartindent seems to have formatting leakage from cindent, because
" it forces lines beginning with '#' to column 0.
autocmd BufRead *.py set nocindent nosmartindent autoindent

" Tab-complete the way Bash does it.
set wildmode=longest,list

" Show line numbers in the buffer.
set nu

" Leave cursor in same column after page up/down.
set nostartofline

" Always show the line,column numbers in the statusline.
set ruler

" Show the beginning of multi-key commands below the status line:
set showcmd

" Always use syntax highlighting.
" If Vim is not highlighting the way you expect, you can try telling it
" explicitly what filetype to use. For example, to highlight a .json file,
" use :set filetype=javascript (or :set ft=javascript)
syntax on

" Abbreviation for inserting a Python debugger breakpoint
iab pdbs import pdb; pdb.set_trace()

" Keep all those pesky .swp files in one place.
set directory=~/.vim/tmp,~/tmp,/var/tmp,/tmp

" Only use one space between sentences when joining lines or
" reformatting paragraphs.
set nojoinspaces

" Don't fold the whole file by default.
" It's annoying to open a source-code file and not see anything.
set foldlevel=20
