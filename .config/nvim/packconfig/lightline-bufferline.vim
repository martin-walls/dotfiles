" ┌──────────────────────┐
" │ Lightline Bufferline │
" └──────────────────────┘
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#show_number = 2
" let g:lightline#bufferline#composed_number_map = {
" \ 1:  '⑴ ', 2:  '⑵ ', 3:  '⑶ ', 4:  '⑷ ', 5:  '⑸ ',
" \ 6:  '⑹ ', 7:  '⑺ ', 8:  '⑻ ', 9:  '⑼ ', 10: '⑽ ',
" \ 11: '⑾ ', 12: '⑿ ', 13: '⒀ ', 14: '⒁ ', 15: '⒂ ',
" \ 16: '⒃ ', 17: '⒄ ', 18: '⒅ ', 19: '⒆ ', 20: '⒇ '}
let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed = '[Untitled]'

" switch buffer mappings
nmap <leader>1 <Plug>lightline#bufferline#go(1)
nmap <leader>2 <Plug>lightline#bufferline#go(2)
nmap <leader>3 <Plug>lightline#bufferline#go(3)
nmap <leader>4 <Plug>lightline#bufferline#go(4)
nmap <leader>5 <Plug>lightline#bufferline#go(5)
nmap <leader>6 <Plug>lightline#bufferline#go(6)
nmap <leader>7 <Plug>lightline#bufferline#go(7)
nmap <leader>8 <Plug>lightline#bufferline#go(8)
nmap <leader>9 <Plug>lightline#bufferline#go(9)
nmap <leader>0 <Plug>lightline#bufferline#go(10)

" delete buffer mappings
nmap <leader>d1 <Plug>lightline#bufferline#delete(1)
nmap <leader>d2 <Plug>lightline#bufferline#delete(2)
nmap <leader>d3 <Plug>lightline#bufferline#delete(3)
nmap <leader>d4 <Plug>lightline#bufferline#delete(4)
nmap <leader>d5 <Plug>lightline#bufferline#delete(5)
nmap <leader>d6 <Plug>lightline#bufferline#delete(6)
nmap <leader>d7 <Plug>lightline#bufferline#delete(7)
nmap <leader>d8 <Plug>lightline#bufferline#delete(8)
nmap <leader>d9 <Plug>lightline#bufferline#delete(9)
nmap <leader>d0 <Plug>lightline#bufferline#delete(10)
