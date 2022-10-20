let g:comfortable_motion_no_default_key_mappings = 1

" Then you can map the keys yourself:
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(10)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-10)<CR>

" Set to j and k to scroll down and up
" let g:comfortable_motion_scroll_down_key = 'j'
" let g:comfortable_motion_scroll_up_key = 'k'
