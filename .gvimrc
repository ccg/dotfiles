" Disable blinking in Normal mode
set gcr=n:blinkon0

" Disable the toolbar in the GUI
set guioptions-=T

if has("macunix")
    "set guifont=Monaco:h13
    set guifont=Menlo:h12
else
    set guifont="Bitstream Vera Sans Mono 10"
endif

colorscheme rdark
set cursorline cursorcolumn
