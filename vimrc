" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'cakebaker/scss-syntax.vim'

" Pathogen
execute pathogen#infect()

" Config
syntax on
set t_Co=256
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set backspace=2
set expandtab
set number
set hlsearch
set exrc
" Handle CSS with background data pngs
set synmaxcol=200

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Ensure start in buffer
" autocmd VimEnter * NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Filetype syntax associations
au BufRead,BufNewFile *.ru,*.cap,*.rabl,*.arb,Guardfile,*.jbuilder set filetype=ruby
au BufRead,BufNewFile *.scss     set filetype=sass
au BufRead,BufNewFile *.jison    set filetype=yacc
au BufRead,BufNewFile *.es6,*.jisonlex set filetype=javascript
au BufRead,BufNewFile *.fun      set filetype=sml

" Create directories if they don't exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Display line at col 80
if exists('+colorcolumn')
  let &colorcolumn = "80"
  hi ColorColumn ctermbg=darkgray guibg=#063541
endif

let g:indentLine_color_term='darkgray'
let g:indentLine_char='·'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*

" Syntastic
" =========
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_always_populate_loc_list = 1

" Mappings
" ========

" Toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" Find current buffer in nerdtree
map <leader>r :NERDTreeFind<CR>

" Insert newline with Ctrl+C in insert mode
imap <C-c> <CR><Esc>O

" Colors
" ======

" Dark
set background=dark
"set background=light
colorscheme solarized
"colorscheme Tomorrow-Night-Eighties
"colorscheme hybrid
"colorscheme Monokai
"colorscheme wombat256
"colorscheme babymate256
"colorscheme grb256

" Light
"colorscheme beauty256
