
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
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprevious<CR>
map <C-Tab> :tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-Tab> <ESC>:tabnext<CR>
imap <C-S-Tab> <ESC>:tabprevious<CR>

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
