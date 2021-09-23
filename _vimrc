set hls

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set is
set gfn=fixedsys:h12
set ts=4
set sw=4

set wildmode=full


iabbrev main int main(){<CR>ios::sync_with_stdio(0);<CR>cin.tie(0);<CR><CR><CR>return 0;}
iabbrev usingstd using namespace std;
iabbrev bits #include <bits/stdc++.h>

set nocompatible " be iMproved, required
filetype off " required
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"


autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ -T4pb

set ttimeoutlen=10

"set switchbuf+=useopen

"au VimEnter *  NERDTree
let NERDTreeShowBookmarks=1

"https://github.com/Kirill-Bugaev/vim-termdebug-vertical
let g:termdebug_vertsource = 1
let g:termdebug_leftsource = 1
let g:termdebug_focussource =0
let g:termdebug_disable_toolbar = 1

"nnoremap <Leader>b :b <C-d>
nnoremap <Leader>b :ls<Cr>:b<Space>

"leader v m -> open vimrc file in vertical split
map <leader>vm :vsp $MYVIMRC<CR>

"leader s v -> save and reload vimrc
map <leader>sv :w! <CR> :source $MYVIMRC<CR>

"save my current file with ,w instead of typing :w every time.
map <leader>w :w!<CR>

"format
nnoremap <Leader>f ggVG=

nmap // :BLines<CR>
"
" Buffer Navigation
nnoremap <Leader><left> :b#<CR>      " previous buffer
nnoremap <Leader><right> :bn<CR>      " next buffer
nnoremap <Leader>q :bd!<CR>             " close buffer

"add semicolon add end
inoremap <leader>; <C-o>A;

set linespace=1
set splitbelow
set splitright

" --- command completion ---
"set wildmenu                " Hitting TAB in command mode will
"set wildchar=<TAB>          "   show possible completions.
"set wildmode=list:longest


"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

command! Reload execute "source ~/_vimrc"
command! Config execute ":e $MYVIMRC"

map <Leader>s <Plug>(easymotion-bd-f)

function! ToggleNERDTree()
        NERDTreeToggle
        silent NERDTreeMirror
endfunction


set cmdheight=1
" set tthe runtime path to include Vundle and initialize
set rtp+=~/.vim/plugin/Vundle.vim
call vundle#begin()
"Plugin 'raimondi/delimitmate'
"Plugin 'wincent/terminus'
Plugin 'dimasg/vim-mark'
"Plugin 'neovim/pynvim'
Plugin 'VundleVim/Vundle.vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'scrooloose/nerdtree'
""Plugin 'sirver/ultisnips'
Plugin 'easymotion/vim-easymotion'
"jPlugin 'valloric/youcompleteme'

Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'scrooloose/syntastic'
"Plugin 'kien/ctrlp.vim'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'autohotkey-ahk'
"Plugin 'huleiak47/vim-ahkcomplete'
Plugin 'troydm/easybuffer.vim'
"Plugin 'junegunn/fzf.vim'
"Plugin 'junegunn/fzf'
"Plugin 'doums/cobra'
call vundle#end()            " required
filetype plugin indent on    " required


set tabstop=2 softtabstop=2
"set shiftwidth=4
set expandtab
set smartindent
set backspace=indent,eol,start  " more powerful backspacing
set number
syntax on

inoremap <F4> <ESC> :w! <CR> :!g++ % -g -o %:r && %:r.exe <CR><CR>
nnoremap <F5> :w! <CR> :!g++ % -g -o %:r && %:r.exe <CR> <CR>
"inoremap <F5> <Esc> :w! <CR> :!g++ % -g -o %:r && %:r.exe <CR><CR>i
nnoremap <F6> :w! <CR> :Termdebug %:r.exe <CR><ESC><C-W><S-L>i<CR>b main<CR>

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

"map <F10> :wa \| vertical botright term ++kill=term<CR> cd % <CR>
map <F10> :!start cmd /k cd %:p:h && gdb -exec %:r.exe
"&& gdb %:p:h%:r.exe<CR>
map <F9> :w <CR> :!g++ -Wall -Wextra -std=c++17 -o %<.exe % <CR> 

inoremap <nowait> jj  <Esc>


":let &makeprg = 'g++ -std=c++17 % -o %<.exe && cmd.exe /k %<.exe'
"au BufWrite *.cpp set makeprg=g++\ %\ -o %< && %<.exe <CR>


"move lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <F12> :NERDTreeToggle<CR>

"system clipboard copy
"noremap <Leader>y "*y
"noremap <Leader>p "*p
"noremap <Leader>Y "+y
"noremap <Leader>P "+p
"
"disbale arrow keys
"map <Up> <C-W>k
"map <Down> <C-W>j 
"map <Left> <C-W>h 
"map <Right> <C-W>l

packadd termdebug

let NERDTreeShowHidden=1
