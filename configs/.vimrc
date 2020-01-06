" http://vimhelp.appspot.com/options.txt.html
set visualbell

syntax enable
filetype plugin on
set path+=**
set wildmenu

syntax on
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
set expandtab 
set showmatch
set nowrapscan 
set hlsearch
set incsearch
set nowrap " bez lamania linii
set cmdheight=2
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

map ,hc :s/^/<!--/g<CR>:s/$/-->/g<CR>:let @/ = ""<CR>
map ,huc :s/<!--//g<CR>:s/-->//g<CR>:let @/ = ""<CR>

" Backslash d is d without copy
nnoremap <leader>d "_d

" Set block cursor
" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"

" Assuming typescript syntax file is present in the install dir
" https://raw.githubusercontent.com/leafgarland/typescript-vim/master/syntax/typescript.vim
" autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

highlight Comment ctermbg=DarkGray ctermfg=LightGreen
