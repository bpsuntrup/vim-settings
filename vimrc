" Make vim obey XDG:
set directory=$XDG_CACHE_HOME/vim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$XDG_CACHE_HOME/vim/viminfo

" I like:
" auto-pairs          -- smart parentheses
" flygrep             -- easy/fast grep in vim (TODO: this package kinda sucks i.e. it greps current folder,
"                                               not the current buffer)
" nerdcommenter       -- auto-comment with ,c (should probably remove)
" nerdtree            -- file explorer
" nerdtree-git-plugin -- git enhancement for file explorer
" vim-noscrollbar     -- cut little scrollbar

" Thanks, Tim Pope
let g:pathogen_disabled = ['vim-perl', 'nerdcommenter']
execute pathogen#infect()

" Don't know what this stuff does...
syntax on
filetype plugin on

" Autopairs customization
" I hate autopairing quotes, for some reason.
let g:AutoPairsCenterLine = 0
let g:AutoPairs = {} "'(':')', '[':']', '{':'}'}

" I think this takes care of some NERDTree related things that make it easier
" to use. So I don't want NERDTree when I open a file with vim, but when I
" just open vim, I want NERDTree. This was a bigger deal to me before I mapped
" NERDTree to <Space>.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Clipboard:
function! Clip()
    call writefile(getreg('"', 1, 1), "/tmp/clip")
    execute "!cat /tmp/clip | xclip -selection clipboard"
    silent execute "!rm /tmp/clip"
endfunction

" gtd things:
nnoremap <leader>c 0r+

" buffer management:
nnoremap <leader>b :ls<cr>:b<space>

" I like line numbers. Should be able to toggle them, though
set number
function! Numbertoggle()
    if &number == "nonumber"
        echom "number set"
        set number
    else
        echom "nonumber set"
        set nonumber
    endif
endfunction
noremap <F12> :call Numbertoggle()<CR>

" indentation. Set paste makes all input literal... because I hate when the
" editor thinks its smarter than me
set pastetoggle=<F10>
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
    " For clojure and javascript, I like two spaces
    au FileType clojure setl ts=2 sw=2 sts=2
    au FileType javascript setl ts=2 sw=2 sts=2
    au FileType jsx setl ts=2 sw=2 sts=2
    au BufRead,BufNewFile  *.csv setlocal ts=13 sw=13 sts=13 noet
set expandtab
function! Ettoggle()
  if &expandtab == "noexpandtab"
    echom "expandtab set"
    set expandtab
  else
    echom "noexpandtab set"
    set noexpandtab
  endif
endfunction
" noremap <F11> :call Ettoggle()<CR>

autocmd FileType *.pl setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType *.pm setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" useful mappings:
noremap <S-Return> <Esc>
noremap <C-j> 10j
noremap <C-k> 10k
noremap <Space> :NERDTreeToggle<CR>
noremap ; :
noremap zj gj
noremap zk gk
map , \
noremap <leader>/ :FlyGrep<CR>

" window movement. 
noremap gj <C-w>j
noremap gh <C-w>h
noremap gk <C-w>k
noremap gl <C-w>l
noremap gs <C-w>s
noremap gv <C-w>v
noremap <Leader>d <C-w>+
noremap <Leader>f <C-w>-
noremap <Leader>g <C-w>>
noremap <Leader>s <C-w><

" RANDOM: make text files 80 characters wide
au BufRead,BufNewFile *.jrnl setlocal textwidth=80

" also spell checking
set spelllang=en
au BufRead,BufNewFile *.jrnl setlocal spell


" I want to be able to insert parentheses around visually selected text.
" Note that this will only work assuming I keep the undesired behavior of
" (<esc> leaving a double parenthesis
vnoremap 0 di(<ESC>pli)<ESC>l%

"I also want to remove a parenthesis and its brother
noremap <leader>x lvi("tdxx"tp

" I also want to be able to insert a single parenthesis
noremap <leader>( i(<esc>

" Here is some crap for making the noscrollbar plugin work:
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{noscrollbar#statusline()}
set laststatus=2

" conceal is annoying in TeX:
let g:tex_conceal = ""

" I like hilight searching, but not incsearch
set hlsearch noincsearch
nnoremap <leader>w :let @/=''<cr>

set et
noremap gr gT
nnoremap gn :tabm -1<cr>
nnoremap gm :tabm +1<cr>
set tabstop=4
set shiftwidth=4
set softtabstop=4
noremap ; :

