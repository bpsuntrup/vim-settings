" vimrc. Create a link in the home directory called .vimrc and point it to
" this file
"
" I like:
" auto-pairs          -- smart parentheses
" flygrep             -- easy/fast grep in vim (TODO: this package kinda sucks i.e. it greps current folder,
"                                               not the current buffer)
" nerdcommenter       -- auto-comment with ,c
" nerdtree            -- file explorer
" nerdtree-git-plugin -- git enhancement for file explorer
" rainbow             -- enhanced parentheses highlighting
" syntastic           -- syntax-checking ( This actually sucks, so it's
"                        actually removed.)

" Thanks, Tim Pope
execute pathogen#infect()

" Don't know what this stuff does...
syntax on
filetype plugin on

" I think this takes care of some NERDTree related things that make it easier
" to use. So I don't want NERDTree when I open a file with vim, but when I
" just open vim, I want NERDTree. This was a bigger deal to me before I mapped
" NERDTree to <Space>.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Rainbow config. I haven't got a clue how this works
" TODO: read README for this, any docs I can find, figure out how to sanely
" color < and > as delimiters for complicated Rust generics
" TODO: get a less bloated version of Rainbow
"\   'guifgs': [196, 208, 226, 46,117, 92, 177],
let g:rainbow_conf = {
\   'ctermfgs': [196, 208, 226, 46,117, 92, 177],
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'seperately': {
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'javascript.jsx': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\   }
\}
map <F9> :RainbowToggle<CR>
au VimEnter * RainbowToggle

" Syntastic stuff:
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*

    "let g:syntastic_always_populate_loc_list = 0
    "let g:syntastic_auto_loc_list = 0
    "let g:syntastic_check_on_open = 0
    "let g:syntastic_check_on_wq = 0
    "noremap <leader>m :lnext<CR>
    "noremap <leader>n :lprevious<CR>
    "noremap <leader>? :SyntasticReset<CR> :SyntasticCheck<CR>
    "noremap <leader>r :SyntasticReset<CR>
	"let ErrorToggle = 0
    "function ToggleError()
		"if g:ErrorToggle == 0
            "execute "SyntasticReset"
            "execute "SyntasticCheck"
			"execute "Error"
			"let g:ErrorToggle = 1
		"else
			"execute "lclose"
			"let g:ErrorToggle = 0
		"endif
	"endfunction
	"noremap <leader>e :call ToggleError()<CR>

" I like line numbers. Should be able to toggle them, though
set number
function Numbertoggle()
    if &number == "nonumber"
        echom "number set"
        set number
    else
        echom "nonumber set"
        set nonumber
    endif
endfunction
map <F12> :call Numbertoggle()<CR>

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
set expandtab
function Ettoggle()
  if &expandtab == "noexpandtab"
    echom "expandtab set"
    set expandtab
  else
    echom "noexpandtab set"
    set noexpandtab
  endif
endfunction
map <F11> :call Ettoggle()<CR>

" useful mappings:
map <S-Return> <Esc>
map <C-j> 10j
map <C-k> 10k
map <Space> :NERDTreeToggle<CR>
map ; :
noremap zj gj
noremap zk gk
map , \
noremap <leader>/ :FlyGrep<CR>

" window movement. 
map gj <C-w>j
map gh <C-w>h
map gk <C-w>k
map gl <C-w>l
map gs <C-w>s
map gv <C-w>v
noremap <Leader>d <C-w>+
noremap <Leader>f <C-w>-
noremap <Leader>g <C-w>>
noremap <Leader>s <C-w><

" RANDOM: make text files 100 characters wide
au BufRead,BufNewFile *.txt setlocal textwidth=100

