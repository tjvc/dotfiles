let mapleader = " "

" Unbind cursor keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" Use jj to exit insert mode
inoremap jj <Esc>

" Disable default command-line window key binding
nnoremap q: <NOP>
vnoremap q: <NOP>

" Clear buffers
nnoremap <Leader>x :silent :bufdo bd<CR>

" Replace current word
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" Remap macro key
nnoremap Q q
nnoremap q <Nop>

" Make it easier to exit terminal insert mode
tmap jj <C-\><C-n>

" Close quickfix window
nnoremap <Leader>c :cclose<CR>
