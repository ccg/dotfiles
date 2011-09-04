set gcr=n:blinkon0  " turn off that damn blinking
set guioptions-=T   " disable toolbar in GUI
if has("macunix")
    set guifont=Monaco:h13   "Menlo:h13
else
    set guifont="Bitstream Vera Sans Mono 10"
endif
:colorscheme rdark
