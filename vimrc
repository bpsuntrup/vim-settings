" vimrc. Create a link in the home directory called .vimrc and point it to
" this file

" Thanks, Tim Pope
execute pathogen#infect()

" Don't know what this stuff does...
syntax on

" I think this takes care of some NERDTree related things that make it easier
" to use. So I don't want NERDTree when I open a file with vim, but when I
" just open vim, I want NERDTree. This was a bigger deal to me before I mapped
" NERDTree to <Space>.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"    \   'ctermfgs': ['red', 'Orange1', 'yellow', 'green', 'blue', 'purple'],

" Rainbow config.
    let g:rainbow_conf = {
    \   'guifgs': ['firebrick','darkorange', 'gold', 'seagreen','royalblue',  'darkorchid1'],
    \   'ctermfgs': [196, 208, 226, 46,117, 92, 177],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid1'],
    \       },
    \       'clj': {
    \           'guifgs': ['firebrick','darkorange', 'gold', 'seagreen','royalblue',  'darkorchid1'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}
map <F9> :RainbowToggle
au VimEnter * RainbowToggle

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
set noautoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
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


" window movement. 
noremap zj gj
noremap zk gk
map gj <C-w>j
map gh <C-w>h
map gk <C-w>k
map gl <C-w>l
map gs <C-w>s
map gv <C-w>v

" filetype specific stuff. Maybe this should go in the .vim folder. IDK.
  " make text files 80 characters wide
au BufRead,BufNewFile *.txt setlocal textwidth=80

" MACROS
" ======

" comment and strip comment. TODO: this works for c++ style comments, but
" I should develop some way of doing line by line comments for different
" filetypes. For now all I do is javascript, though, so when I get back to 
" python, this will probably need to be addressed.
let @c = '^i// j'
let @s = '^xxxj'

" TODO: need to find out how to prettify up the vim plugins. Maybe i want to
" learn how to manage my vim plugins more manually. The packages I download don't seem
" that big after all. They're usually only one file.
