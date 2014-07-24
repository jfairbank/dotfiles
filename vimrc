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
au BufRead,BufNewFile *.ru,*.cap,*.rabl,*.arb,Guardfile set filetype=ruby
au BufRead,BufNewFile *.jison                           set filetype=yacc
au BufRead,BufNewFile *.jisonlex                        set filetype=javascript
au BufRead,BufNewFile *.fun                             set filetype=sml

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

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

" Dark
colorscheme Tomorrow-Night-Eighties
"colorscheme Monokai
"colorscheme wombat256
"colorscheme babymate256
"colorscheme grb256

" Light
"colorscheme beauty256
