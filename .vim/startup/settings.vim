syntax on
filetype plugin indent on

set number
set cursorline
set updatetime=100
"set timeoutlen=100
"set ttimeoutlen=0

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'simple'
let g:Powerline_symbols = 'fancy'

set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

call matchadd('ColorColumn', '\%81v', 100)

" Enable Spell Checking for File Formats

au BufRead *.markdown,*.md setlocal spell

set tabstop=4
set shiftwidth=4
set expandtab

"set esckeys

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif
