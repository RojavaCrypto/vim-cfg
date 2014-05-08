call pathogen#infect()
call pathogen#helptags()

" GundoToggle
"nnoremap <F5> :GundoToggle<CR>

" size of hard tabs
set ts=4
" size of soft tabs
set sw=4
" use soft tabs
set et
" treat X spaces like a tab
set sts=4
" show commands when you begin to type them
set showcmd
"map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
set cursorline
hi CursorLine   cterm=NONE ctermbg=darkgrey
hi Folded ctermbg=NONE
set hlsearch
"map ; :
nnoremap <Space> :
vnoremap <Space> :
" when moving up or down, don't move cursor left or right
set nostartofline
" search while typing
set incsearch
" s/../../ the /g is always on
set gdefault
nnoremap <tab> %
vnoremap <tab> %
" cursor can go anywhere on screen :)
set virtualedit=all
set ruler
set splitright
set splitbelow
" persistant undo
set undofile
set undodir=/tmp
set relativenumber
set numberwidth=3
" turn on default indent for filetype
filetype indent on
" enable mouse for resizing splits
set mouse=a
set ttymouse=xterm2

map <C-J> <C-w>j
map <C-K> <C-w>k
map <C-H> <C-w>h
map <C-L> <C-w>l

vmap > >gv
vmap < <gv
" quick recording type qq, then Q to do it
nnoremap Q @q

" remove annoying help
map <f1> <nop>
imap <f1> <nop>

" make highlighted searches disappear
nmap <C-N> :noh <CR>

" disable bad habit
inoremap <DOWN> <nop>
inoremap <UP> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" scroll buffer without moving cursor
nnoremap <DOWN> <C-E>
nnoremap <UP> <C-Y>
nnoremap <left> <nop>
nnoremap <right> <nop>

" peek up/down
map <pageup> zb5<c-e>
map <pagedown> zt5<c-y>
map <end> zz

" 80 chars max
set tw=80
set cc=+1
hi ColorColumn ctermbg=black

" get rid of commenting new lines when making a comment
au FileType c,cpp setlocal comments-=:// comments+=f://

" completion to be like bash
set wildmode=list:longest
" ignore when tab completing
set wildignore=*.o,*.lo,*.obj,*~,*.swp

" use arrow keys to switch buffers
map <right> gt
map <left> gT
" speed up esc
set ttimeoutlen=50

" resume from previous line in a file
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" save view on exit too
au BufWinLeave * silent! mkview!
au BufWinEnter * silent! loadview

no 0 ^
no - $

let mapleader="\<bs>"
nmap <leader>/ :nohlsearch<CR>
map <leader>a :LustyJuggler<CR>

" toggling mouse settings
if exists("b:loaded_toggle_mouse_plugin")
    finish
endif
let b:loaded_toggle_mouse_plugin = 1

fun! ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        set relativenumber
        set nopaste
        set tw=80
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse = ""
        set relativenumber!
        set paste
        set tw=0
        echo "Mouse is for terminal"
    endif
endfunction
noremap <leader>m :call ToggleMouse()<CR>
syntax on

