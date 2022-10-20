" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Searching
nnoremap / /\v
vnoremap / /\v

map <Leader><Space> :let @/=''<CR> " Clear search highlight

" Help key
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Buffers
nnoremap <Leader>b :ls<CR>:b<Space>

