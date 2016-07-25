" vimrc. Create a link in the home directory called .vimrc and point it to
" this file
execute pathogen#infect()
syntax on
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <Space> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set number

" indentation. Set paste makes all input literal... because I hate when the
" editor thinks its smarter than me
set pastetoggle=<F10>
set autoindent
set tabstop=3

map <S-Return> <Esc>

" Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" TODO: need to find out how to prettify up the vim plugins. Maybe i want to
" learn how to manage my vim plugins more manually. The packages I download don't seem
" that big after all. They're usually only one file.
