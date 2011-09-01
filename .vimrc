call pathogen#infect()  " this line before ``filetype plugin indent on``
set nocompatible
set bs=2
set laststatus=2
" Redefining a tab to be anything other than 8 spaces is like redefining the
" value of pi; sure, you can be internally consistent, but as soon as you try
" to work with somebody else, none of your stuff lines up.
set ts=8 sts=4 sw=4 expandtab smarttab
set autoindent smartindent
set nowrap
" incremental searching. ignore case unless you type a capital letter,
" which makes the search case-sensitive
set ignorecase smartcase incsearch
" temporarily disable search highlighting when it gets annoying
nmap <silent> <leader>h :silent :nohlsearch<CR>
set noequalalways

" Change the titlebar to show the current file when running under a terminal.
set title

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
autocmd BufRead *.c set cindent
autocmd BufRead *.cpp set cindent
autocmd BufRead *.cxx set cindent
autocmd BufRead place.c set sw=2 sts=2
autocmd BufRead *.txt set tw=76 wrap formatoptions+=n
autocmd BufRead /tmp/cvs* set tw=76 wrap
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
autocmd BufNewFile,BufRead *.html set ft=htmldjango

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
" try error-highlighting text that goes past column 80
" match ErrorMsg '\%>80v.\+'
" alternative:
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.*/

" smartindent seems to have formatting leakage from cindent, because
" it forces lines beginning with '#' to column 0.
autocmd BufRead *.py set nocindent nosmartindent autoindent

let fortran_free_source=1   " Default on new files is fixed-format Fortran
" Tab-complete the way Bash does it.
set wildmode=longest,list

set nu
set nostartofline   " Leave cursor in same column after page up/down.
set ruler
syntax on

" Abbreviation for inserting a Python debugger breakpoint
iab pdbs import pdb; pdb.set_trace()
