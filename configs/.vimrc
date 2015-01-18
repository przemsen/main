syntax on
cnoremap sudow w !sudo tee % >/dev/null
set enc=utf8
set fenc=utf8
set nocompatible "prevent Vim from emulating Vi's bugs
set backspace=indent,eol,start
set tabstop=4 "number of spaces that \t count for
set shiftwidth=4 "number of spaces used at each step of autoindent
set number
set ignorecase
set smartcase
set autoindent "copy indent from current line when starting a new line
set copyindent
set laststatus=1 "window has small status line
set expandtab "number of speces inserted when tab is pressed
set showmatch
set nowrapscan "Zatrzymaj na koncu pliku przy wyszukiwaniu
set hlsearch
set matchtime=3
set incsearch
set nowrap " bez lamania linii
set cmdheight=2
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
