call pathogen#infect()  " this line before ``filetype plugin indent on``
set nocompatible
set bs=2
set laststatus=2
set ts=8 sts=4 sw=4 expandtab smarttab
set autoindent smartindent
set nowrap
" incremental searching. ignore case unless you type a capital letter,
" which makes the search case-sensitive
set ignorecase smartcase incsearch
" temporarily disable search highlighting when it gets annoying
nmap <silent> <leader>h :silent :nohlsearch<CR>
set noequalalways
set title

let mapleader = ','

" ==== NERDTree Config ====
" Keyboard shortcut to open NERDTree
map <Leader>n :NERDTreeToggle<CR>
" Reduce UI clutter (use the 'u' key to move up a dir)
let NERDTreeMinimalUI = 1
" Use arrows instead of + and ~ characters for directories
let NERDTreeDirArrows = 1

if &term =~ "^screen"
    set ttymouse=xterm2
endif
set mouse=a

" Show tab chars and trailing whitespace.
" Useful for cleaning up the slop left by Emacs users.
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


" Vim 7.3: awesome
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
set wildmode=longest,list
set nu
set nostartofline   " Leave cursor in same column after page up/down.
set ruler
syntax on
iab pdbs import pdb; pdb.set_trace()
