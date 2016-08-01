" vimrc. Create a link in the home directory called .vimrc and point it to
" this file

" Don't know what this stuff does...
syntax on

" I think this takes care of some NERDTree related things that make it easier
" to use. So I don't want NERDTree when I open a file with vim, but when I
" just open vim, I want NERDTree. This was a bigger deal to me before I mapped
" NERDTree to <Space>.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number

" indentation. Set paste makes all input literal... because I hate when the
" editor thinks its smarter than me
set pastetoggle=<F10>
set noautoindent
set tabstop=3


" useful mappings:
map <S-Return> <Esc>
map <C-j> 10j
map <C-k> 10k
map <Space> :NERDTreeToggle<CR>

" window movement. 
map gj <C-w>j
map gh <C-w>h
map gk <C-w>k
map gl <C-w>l
map gs <C-w>s
map gv <C-w>v

" filetype specific stuff. Maybe this should go in the .vim folder. IDK.
  " make text files 80 characters wide
  au BufRead,BufNewFile *.txt setlocal textwidth=80

" macros
   " indent and unindent. Note that I map to the tab key, which can
   " be expanded into the number of spaces I like best or left as tabs
   let @i = '0i	j'
   let @u = '0xj'

   " comment and strip comment. TODO: this works for c++ style comments, but
   " I should develop some way of doing line by line comments for different
   " filetypes. For now all I do is javascript, though, so when I get back to 
   " python, this will probably need to be addressed.
   let @c = '^i// j'
   let @s = '^xxxj'

" TODO: need to find out how to prettify up the vim plugins. Maybe i want to
" learn how to manage my vim plugins more manually. The packages I download don't seem
" that big after all. They're usually only one file.
