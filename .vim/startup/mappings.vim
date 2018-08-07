
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
nnoremap <leader><S-tab> :tabprevious<CR>
nnoremap <leader><tab>   :tabnext<CR>
nnoremap <leader>t     :tabnew<CR>
inoremap <leader><S-tab> <Esc>:tabprevious<CR>
inoremap <leader><tab>   <Esc>:tabnext<CR>
inoremap <leader>t     <Esc>:tabnew<CR>

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
