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
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'angelozerr/tern-jasmine'
Plugin 'mxw/vim-jsx.git'
Plugin 'kien/ctrlp.vim.git'
Plugin 'mattn/emmet-vim.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'groenewege/vim-less.git'
Plugin 'tpope/vim-rails.git'
Plugin 'mustache/vim-mustache-handlebars.git'
Plugin 'Yggdroot/indentLine.git'
Plugin 'pangloss/vim-javascript.git'
Plugin 'vim-scripts/matchit.zip.git'
Plugin 'tpope/vim-surround.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'gabrielelana/vim-markdown.git'
Plugin 'Raimondi/delimitMate.git'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-abolish'
Plugin 'trotzig/import-js'
Plugin 'mlr-msft/vim-loves-dafny'
Plugin 'claco/jasmine.vim'
Plugin 'lfilho/cosco.vim'
Plugin 'elzr/vim-json'

" Colorscheme plugins
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'yosiat/oceanic-next-vim'
Plugin 'fabi1cazenave/kalahari.vim'
Plugin 'queyenth/oxeded.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'AlessandroYorba/Alduin'

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
set omnifunc=syntaxcomplete#Complete
" Handle CSS with background data pngs
set synmaxcol=200
set laststatus=2
set statusline+=%F

" Recursively look for tags file
set tags=./tags,tags;$HOME

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Mouse scrolling
set mouse=nicr

" Show dotfiles
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.git$']

" LaTeX
let g:livepreview_previewer = 'Preview.app'

" Show list chars
"set list
"set listchars=tab:>-,trail:~,extends:>,precedes:<

" Ensure start in buffer
" autocmd VimEnter * NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * lcd %:p:h

" Use octodown as default build command for Markdown files
autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'

" Tabbing for specific file types
autocmd FileType java setlocal tabstop=4 shiftwidth=4

" Filetype syntax associations
au BufRead,BufNewFile *.ru,*.cap,*.rabl,*.arb,Guardfile,*.jbuilder set filetype=ruby
au BufRead,BufNewFile *.jison set filetype=yacc
au BufRead,BufNewFile *.jisonlex set filetype=javascript
au BufRead,BufNewFile .eslintrc,.jshintrc,.babelrc set filetype=json

" Auto wrap markdown
au BufRead,BufNewFile *.md setlocal textwidth=80 wrap

" Make executable
"au BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent !chmod +x % | endif

" Close scratch preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

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

" Ctrl+P
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" YouCompleteMe and UltiSnips
" (https://medium.com/brigade-engineering/sharpen-your-vim-with-snippets-767b693886db)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:UltiSnipsSnippetsDir             = '~/.vim/UltiSnips'
"let g:UltiSnipsSnippetDirectories      = ['UltiSnips']
"let g:UltiSnipsDontReverseSearchPath   = '1'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"let g:loaded_youcompleteme = 1

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
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_checkers = ['clang', 'gcc']
let g:syntastic_dafny_checkers = ['dafny']
let g:syntastic_dafny_dafny_args = '-allowGlobals'
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_classpath = ".\n./korat/*"

" Mappings
" ========

" Toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

" Find current buffer in nerdtree
map <leader>r :NERDTreeFind<CR>

" Find current file in nerdtree
nmap ,n :NERDTreeFind<CR>

" Insert newline with Ctrl+C in insert mode
imap <C-c> <CR><Esc>O

" Semicolons
autocmd FileType javascript,jasmine.javascript nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,jasmine.javascript inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemicolon()<CR>

" Colors
" ======

" Dark
set background=dark
"set background=light
colorscheme solarized
"colorscheme alduin
"colorscheme lucius
"let g:lucius_style = 'dark'
"let g:lucius_contrast = 'high'
"let g:lucius_contrast_bg = 'high'

"colorscheme OceanicNext
"colorscheme kalahari
"colorscheme oxeded

"colorscheme Tomorrow-Night-Eighties
"colorscheme hybrid
"colorscheme Monokai
"colorscheme wombat256
"colorscheme babymate256
"colorscheme grb256

" Light
"colorscheme beauty256
