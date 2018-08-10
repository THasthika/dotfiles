execute pathogen#infect()

let mapleader=','

source ~/.vim/startup/color.vim
source ~/.vim/startup/commands.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/settings.vim

call matchadd('ColorColumn', '\%81v', 100)

" Enable Spell Checking for File Formats

au BufRead *.markdown,*.md setlocal spell
