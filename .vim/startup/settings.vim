syntax on
filetype plugin indent on

set number
set cursorline
set updatetime=100
"set timeoutlen=100
"set ttimeoutlen=0

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dracula'

call matchadd('ColorColumn', '\%81v', 100)

" Enable Spell Checking for File Formats

au BufRead *.markdown,*.md setlocal spell

set tabstop=4
set shiftwidth=4
set expandtab

"set esckeys
