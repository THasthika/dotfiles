
" Unmap Arrow Keys

no <down> ddp
no <up> ddkP
no <left> <Nop>
no <right> <Nop>

ino <down> <Nop>
ino <up> <Nop>
ino <left> <Nop>
ino <right> <Nop>

vno <down> <Nop>
vno <up> <Nop>
vno <left> <Nop>
vno <right> <Nop>

" Tab Mapping

execute "set <M-j>=\ej"
execute "set <M-k>=\ek"

nnoremap <M-j> :tabprevious<CR>
nnoremap <M-k> :tabnext<CR>

inoremap <M-h> <Esc>:tabprevious<CR>
inoremap <M-l> <Esc>:tabnext<CR>

nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>


" NERDTree Mapping
map <C-n> :NERDTreeToggle<CR>

" Quick Pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i



" Insert Abbriviations
imap <leader>email tharindubathigama@gmail.com
