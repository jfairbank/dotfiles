" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'cakebaker/scss-syntax.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --tern-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }

" Plug 'angelozerr/tern-jasmine'

Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'gavocanov/vim-js-indent'
Plug 'flowtype/vim-flow'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-rails'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Yggdroot/indentLine'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'gabrielelana/vim-markdown'
" Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
" Plug 'suan/vim-instant-markdown'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'
Plug 'trotzig/import-js'
Plug 'mlr-msft/vim-loves-dafny'
Plug 'claco/jasmine.vim'
Plug 'elzr/vim-json'
Plug 'wizicer/vim-jison'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'felixschl/vim-gh-preview'
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-pug'
Plug 'ElmCast/elm-vim'
" Plug 'lambdatoast/elm.vim'
Plug 'tpope/vim-dispatch'
Plug 'craigdallimore/vim-jest-cli'
Plug 'wesQ3/vim-windowswap'
Plug 'jpalardy/vim-slime'
Plug 'elixir-lang/vim-elixir'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'beloglazov/vim-online-thesaurus'

" Colorscheme plugins
Plug 'altercation/vim-colors-solarized'
Plug 'yosiat/oceanic-next-vim'
Plug 'fabi1cazenave/kalahari.vim'
Plug 'queyenth/oxeded.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'AlessandroYorba/Alduin'
Plug 'trevordmiller/nova-vim'

call plug#end()

" Pathogen
execute pathogen#infect()

" General Config
syntax on
set t_Co=256
filetype plugin indent on
set encoding=utf-8
scriptencoding utf-8
set tabstop=2
set shiftwidth=2
set backspace=2
set expandtab
set number
set hlsearch
set exrc

" Omnifunc
set omnifunc=syntaxcomplete#Complete

" Handle CSS with background data pngs
set synmaxcol=200

" terryma/vim-multiple-cursors
let g:multi_cursor_start_key='<C-m>'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" itchyny/lightline.vim
set laststatus=2
set statusline+=%F

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ''._ : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Recursively look for tags file
set tags=./tags,tags;$HOME

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Mouse scrolling
set mouse=nicr

" Splits (https://robots.thoughtbot.com/vim-splits-move-faster-and-more-naturally)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Show dotfiles
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.git$']

let NERDSpaceDelims=1

" LaTeX
let g:livepreview_previewer = 'Preview.app'

" Elm
" ElmCast/elm-vim
let g:elm_format_autosave = 1
let g:elm_detailed_complete = 1

" Show list chars
"set list
"set listchars=tab:>-,trail:~,extends:>,precedes:<

" Ensure start in buffer
" autocmd VimEnter * NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufEnter * lcd %:p:h

" Tabbing for specific file types
autocmd FileType java setlocal tabstop=4 shiftwidth=4

" Filetype syntax associations
au BufRead,BufNewFile *.ru,*.cap,*.rabl,*.arb,Guardfile,*.jbuilder set filetype=ruby
au BufRead,BufNewFile *.jison set filetype=yacc
au BufRead,BufNewFile *.jisonlex set filetype=javascript
au BufRead,BufNewFile .eslintrc,.jshintrc,.babelrc set filetype=json
au BufRead,BufNewFile,BufWritePost *Spec.js set filetype=jasmine.javascript.jsx

" Helper functions
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

" JavaScript
let g:flow#autoclose = 1
let g:flow#errjmp = 0
let g:flow#flowpath = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
let g:jsx_ext_required = 0 " Enable jsx for .js files
let g:javascript_plugin_flow = 1
command Jest Dispatch jest

" Markdown
" Auto wrap markdown
au BufRead,BufNewFile *.md setlocal textwidth=80 wrap
" Use octodown as default build command for Markdown files
" autocmd FileType markdown let b:dispatch = 'octodown --live-reload %'
" let g:vim_markdown_fenced_languages = ['js=javascript']
let g:markdown_fenced_languages = ['js=javascript']

" Make executable
"au BufWritePost * if getline(1) =~ "^#!.*/bin/" | silent !chmod +x % | endif

" Slime
let g:slime_target = 'tmux'

" Close scratch preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Create directories if they don't exist
" function s:MkNonExDir(file, buf)
"     if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
"         let dir=fnamemodify(a:file, ':h')
"         if !isdirectory(dir)
"             call mkdir(dir, 'p')
"         endif
"     endif
" endfunction
" augroup BWCCreateDir
"     autocmd!
"     autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
" augroup END

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
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

" " Display line at col 80
" if exists('+colorcolumn')
"   let &colorcolumn = "80"
"   hi ColorColumn ctermbg=darkgray guibg=#063541
" endif

" let g:indentLine_color_term='darkgray'
" let g:indentLine_char='·'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*

" Syntastic
" =========
" http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/

let g:syntastic_javascript_checkers = ['eslint']
"let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))
" let b:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_args='--ignore=E201'
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_auto_jump = 2
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_checkers = ['clang', 'gcc']
let g:syntastic_dafny_checkers = ['dafny']
let g:syntastic_dafny_dafny_args = '-allowGlobals'
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_classpath = ".\n./korat/*"
let g:elm_syntastic_show_warnings = 1
let g:syntastic_ruby_checkers = ['rubocop']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

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

" Do SyntasticCheck
nmap <leader>sc :SyntasticCheck<CR>

" Colors
" ======

" Dark
set background=dark
" set background=light
" colorscheme solarized
colorscheme nova
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
