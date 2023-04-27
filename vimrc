" Load any local/private info, tokens, etc. not meant for storage in version
" control
if !empty(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" ------------------------------------------------------------------------------

" Plugins
" =======

call plug#begin('~/.vim/plugged')

" Helper functions

" function! BuildYCM(info)
"   if a:info.status == 'installed' || a:info.force
"     !./install.py --clang-completer --tern-completer
"   endif
" endfunction

function! BuildTern(info)
  if a:info.status == 'installed' || a:info.force
    !npm install
  endif
endfunction

Plug 'cakebaker/scss-syntax.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'marijnh/tern_for_vim', { 'do': function('BuildTern') }
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/html5.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-rails'
Plug 'mustache/vim-mustache-handlebars'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jaxbot/github-issues.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-abolish'
Plug 'claco/jasmine.vim'
Plug 'elzr/vim-json'
Plug 'wizicer/vim-jison'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'junegunn/goyo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'digitaltoad/vim-pug'
Plug 'ElmCast/elm-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'tpope/vim-dispatch'
Plug 'craigdallimore/vim-jest-cli'
Plug 'wesQ3/vim-windowswap'
Plug 'jpalardy/vim-slime', { 'branch': 'main' }
Plug 'elixir-editors/vim-elixir'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Ron89/thesaurus_query.vim'
Plug 'gcorne/vim-sass-lint'
Plug 'jparise/vim-graphql'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-obsession'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-ruby/vim-ruby'
Plug 'KabbAmine/vCoolor.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-test/vim-test'
Plug 'jgdavey/tslime.vim', { 'branch': 'main' }
Plug 'preservim/vimux'
Plug 'amadeus/vim-convert-color-to'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-eunuch'
Plug 'rhysd/reply.vim'
Plug 'gpanders/vim-medieval'
Plug 'rizzatti/dash.vim'
" Plug 'ervandew/supertab'
" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Plug 'mxw/vim-jsx'
" Plug 'gabrielelana/vim-markdown'
" Plug 'prettier/vim-prettier'
" Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'
" Plug 'Yggdroot/indentLine'
" Plug 'antew/vim-elm-language-server'
" Plug 'plasticboy/vim-markdown'
" Plug 'rking/ag.vim'
" Plug 'suan/vim-instant-markdown'
" Plug 'vim-scripts/vim-svngutter'
" Plug 'beloglazov/vim-online-thesaurus'
" Plug 'jaxbot/browserlink.vim'
" Plug 'slashmili/alchemist.vim'
" Plug 'mhinz/vim-mix-format'
" Plug 'brooth/far.vim'

" Colorscheme plugins
Plug 'altercation/vim-colors-solarized'
Plug 'yosiat/oceanic-next-vim'
Plug 'fabi1cazenave/kalahari.vim'
Plug 'queyenth/oxeded.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'AlessandroYorba/Alduin'
Plug 'trevordmiller/nova-vim'
Plug 'morhetz/gruvbox'

call plug#end()

" ------------------------------------------------------------------------------

" Pathogen
execute pathogen#infect()

" General Config
syntax on
set t_Co=256
filetype plugin indent on
" Configured in coc section
" set encoding=utf-8
scriptencoding utf-8
set tabstop=2
set shiftwidth=2
set backspace=2
set expandtab
set number
set hlsearch
set exrc
" Configured in coc section
" set signcolumn=yes
set incsearch
set wildmode=longest,list,full
set wildmenu
set switchbuf=useopen,usetab
set redrawtime=5000

" Prevent delay when hitting Esc or Ctrl-[
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" ------------------------------------------------------------------------------

" vimux
" =====

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>

" Clear the terminal screen of the runner pane.
map <Leader>v<C-l> :VimuxClearTerminalScreen<CR>

" ------------------------------------------------------------------------------

" coc
" ===

" Modified config from https://github.com/neoclide/coc.nvim README

highlight FgCocErrorFloatBgCocFloating ctermfg=9 guifg=#ff0000

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :call CocAction('jumpDefinition', 'tab drop')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ------------------------------------------------------------------------------

" Omnifunc
" set omnifunc=syntaxcomplete#Complete

" matchit for vim-textobj-rubyblock
runtime macros/matchit.vim

" Handle CSS with background data pngs
set synmaxcol=1000

" terryma/vim-multiple-cursors
let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" vCoolor
let g:vcoolor_disable_mappings = 1

map <leader>cr :VCoolor<CR>

" itchyny/lightline.vim
set laststatus=2
set statusline+=%F

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

let g:lightline = {
      \ 'colorscheme': 'nova',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'cocstatus', 'gitbranch', 'filename' ] ],
      \   'right': [ [ 'ale', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ 'component_expand': {
      \   'ale': 'LinterStatus',
      \ },
      \ 'component_type': {
      \   'ale': 'error',
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

" function! LightLineFileformat()
"   return winwidth(0) > 70 ? &fileformat : ''
" endfunction
function! LightLineFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
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
let NERDTreeWinSize=60

let NERDSpaceDelims=1

" LaTeX
let g:livepreview_previewer = 'Preview.app'

" Elm
" ElmCast/elm-vim
let g:elm_format_autosave = 1
let g:elm_detailed_complete = 1

" Elixir
" let g:mix_format_on_save = 1
augroup fmt
  autocmd!
  autocmd BufWritePre *.ex,*.exs undojoin | Neoformat
augroup END

" Far
let g:far#source = 'ag'

" Dispatch
let g:dispatch_tmux_height = 20

" Goyo
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Show list chars
" set list
" set listchars=tab:>-,trail:~,extends:>,precedes:<

" Ensure start in buffer
" autocmd VimEnter * NERDTree
" autocmd VimEnter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd BufEnter * lcd %:p:h

" Tabbing for specific file types
autocmd FileType java setlocal tabstop=4 shiftwidth=4
autocmd FileType elm setlocal tabstop=4 shiftwidth=4 expandtab

" Filetype syntax associations
au BufRead,BufNewFile *.ru,*.cap,*.rabl,*.arb,Guardfile,*.jbuilder,Brewfile set filetype=ruby
au BufRead,BufNewFile *.jison set filetype=yacc
au BufRead,BufNewFile *.jisonlex set filetype=javascript
au BufRead,BufNewFile .eslintrc,.jshintrc,.babelrc set filetype=json
au BufRead,BufNewFile *.cson set filetype=coffee
au BufRead,BufNewFile *.pml call SetPmlOptions()
au BufRead,BufNewFile *.adoc call SetAdocOptions()
au BufRead,BufNewFile,BufWritePost *Spec.js set filetype=jasmine.javascript.jsx

" Helper functions
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

function! SetPmlOptions()
  set filetype=xml
  set spell
  syntax spell toplevel
endfunction

function! SetAdocOptions()
  set spell
  syntax spell toplevel
endfunction

" Additional tab functionality

function! TabCloseRight(bang)
  let cur=tabpagenr()
  while cur < tabpagenr('$')
    exe 'tabclose' . a:bang . ' ' . (cur + 1)
  endwhile
endfunction

function! TabCloseLeft(bang)
  while tabpagenr() > 1
    exe 'tabclose' . a:bang . ' 1'
  endwhile
endfunction

command! -bang Tabcloseright call TabCloseRight('<bang>')
command! -bang Tabcloseleft call TabCloseLeft('<bang>')

" Copy syntax highlighting for JS code

command! -range SyntaxJs <line1>,<line2>w !highlight -s seashell -O rtf -S javascript -K 60 -k Hack | tr -d '\n' | pbcopy
command! -range SyntaxSql <line1>,<line2>w !highlight -s seashell -O rtf -S sql -K 60 -k Hack | tr -d '\n' | pbcopy
command! -range SyntaxJson <line1>,<line2>w !highlight -s seashell -O rtf -S json -K 60 -k Hack | tr -d '\n' | pbcopy
command! -range SyntaxJsx <line1>,<line2>w !highlight -s seashell -O rtf -S jsx -K 60 -k Hack | tr -d '\n' | pbcopy

" JavaScript
let g:jsx_ext_required = 0 " Enable jsx for .js files
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
command! Jest Dispatch jest
" autocmd FileType javascript,javascript.jsx set formatprg=prettier\ --stdin\ --parser\ flow\ --single-quote\ --trailing-comma\ all
" autocmd BufWritePre *.js :normal gggqG
" autocmd BufWritePre *.js Neoformat
" let g:neoformat_javascript_customprettier = {
"             \ 'exe': 'prettier',
"             \ 'args': ['--stdin', '--parser flow', '--single-quote', '--trailing-comma all'],
"             \ 'stdin': 1,
"             \ }

" let g:neoformat_enabled_javascript = ['customprettier']
" let g:prettier#autoformat = 1
" autocmd BufWritePre *.js,*.json PrettierAsync
let g:ale_fixers = {
  \ 'javascript': ['prettier', 'prettier-standard', 'eslint'],
  \ 'typescriptreact': ['prettier', 'prettier-standard', 'eslint'],
  \ 'typescript': ['prettier', 'prettier-standard', 'eslint']
  \ }
" let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 0

" Markdown
" ========

" Auto wrap markdown
au BufRead,BufNewFile *.md setlocal textwidth=80 wrap spell
" Highlight code blocks
let g:markdown_fenced_languages = [
        \ 'javascript',
        \ 'json',
        \ 'typescript',
        \ 'ruby'
    \ ]
" Execute code blocks
let g:medieval_langs = ['javascript=node']

" Slime
let g:slime_target = 'vimterminal'

" Close scratch preview
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" matze/vim-move
let g:move_key_modifier = 'C'

" Ron89/thesaurus_query.vim
" =========================
let g:tq_map_keys = 0
nnoremap <leader>K :ThesaurusQueryReplaceCurrentWord<CR>

" YouCompleteMe and UltiSnips
" (https://medium.com/brigade-engineering/sharpen-your-vim-with-snippets-767b693886db)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:UltiSnipsSnippetsDir             = '~/.vim/UltiSnips'
" let g:UltiSnipsSnippetDirectories      = ['UltiSnips']
" let g:UltiSnipsDontReverseSearchPath   = '1'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
" let g:loaded_youcompleteme = 1

" Display line at col 80
" if exists('+colorcolumn')
"   let &colorcolumn = "80"
"   hi ColorColumn ctermbg=darkgray guibg=#063541
" endif

" let g:indentLine_color_term='darkgray'
" let g:indentLine_char='·'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*/target/*

" Ale
" ===
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'
" let g:ale_sign_error = '⨉'
" let g:ale_sign_warning = '⚠'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_javascript_flow_executable = 'node_modules/.bin/flow'

augroup AutoAle
  autocmd!
  autocmd User ALELint call UpdateLightline()
augroup END

function! UpdateLightline()
  if exists('#lightline')
    call lightline#update()
  endif
endfunction

" Surround
" ========
" Use # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" Thanks to http://git.io/_XqKzQ
let g:surround_35  = "#{\r}"
let g:surround_36  = "${\r}"

" Rooter
" ======
let g:rooter_manual_only = 1
let g:rooter_silent_chdir = 1
" let g:rooter_patterns = ['Rakefile', '.git/']

" Chdir (built-in)
" ================
" set autochdir

" vim-test
" ========
let test#strategy = "vimux"
" let test#strategy = "tslime"
" let test#strategy = "vimterminal"
" let test#vim#term_position = "vertical"

nmap <silent> <leader>tn :TestNearest<cr>
nmap <silent> <leader>tf :TestFile<cr>
nmap <silent> <leader>ts :TestSuite<cr>
nmap <silent> <leader>tl :TestLast<cr>
nmap <silent> <leader>tg :TestVisit<cr>

" Grep
" ====
" if executable('ag')
"   " Use ag over grep
"   set grepprg=ag\ --nogroup\ --nocolor
" endif
if executable('ag')
  set grepprg=ag\ --vimgrep\ $*
  set grepformat^=%f:%l:%c:%m
endif

" FZF
" ===
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

autocmd VimEnter * command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Files + devicons
function! Fzf_dev()
  let s:actions = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

  " let l:fzf_files_options = '--expect=ctrl-t,ctrl-x,ctrl-v --preview "echo {} | tr -s \" \" \"\n\" | tail -1 | xargs rougify | head -'.&lines.'"'
  " let l:fzf_files_options = '--expect=ctrl-t,ctrl-x,ctrl-v --preview "echo {} | tr -s \" \" \"\n\" | tail -1 | xargs rougify -t github | head -'.&lines.'"'
  let l:fzf_files_options = '--expect=ctrl-t,ctrl-x,ctrl-v'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:action_for(key, ...)
    let default = a:0 ? a:1 : 'e'
    return get(s:actions, a:key, default)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(lines)
    let l:cmd = s:action_for(a:lines[0])
    let l:parts = split(a:lines[1], ' ')
    let l:file_path = get(l:parts, 1, '')
    " execute 'silent e' l:file_path
    execute 'silent '.cmd l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink*':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" splitjoin
" =========

let g:splitjoin_trailing_comma = 1

" Custom commands
" ===============

command -nargs=* Spotify execute "term spotify <args>"

" Mappings
" ========

" Toggle nerdtree
nmap <leader>n :NERDTreeToggle<CR>

" Find current file in nerdtree
nmap ,n :NERDTreeFind<CR>

" Find errors with ALE
nmap <leader>e <Plug>(ale_previous_wrap)
nmap <leader>f <Plug>(ale_next_wrap)

" ALE error details
map <leader>k :ALEDetail<CR>

" Ctrl+p fuzzy file search
" map <C-p> :FZF<CR>
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" map <C-p> :call Fzf_dev()<CR>

" Quickfix close and open
nmap <leader>cx :cclose<CR>
nmap <leader>co :copen<CR>

" Loclist
nmap <leader>lc :lclose<CR>
nmap <leader>lo :lopen<CR>

" Redraw garbled buffers
nmap <leader>r :redraw!<CR>

" AG search word under cursor
nmap <silent> <leader>ag :Ag <c-r><c-w><cr>

" Dispatch
nmap <leader>di :Dispatch<cr>

" Colors
" ======

" Style

set background=dark
" set background=light

" Themes

colorscheme nova
let g:nova_transparent=1

" colorscheme solarized
" colorscheme alduin
" colorscheme OceanicNext
" colorscheme kalahari
" colorscheme oxeded
" colorscheme Tomorrow-Night-Eighties
" colorscheme hybrid
" colorscheme Monokai
" colorscheme wombat256
" colorscheme babymate256
" colorscheme grb256
" colorscheme beauty256

" colorscheme lucius
" let g:lucius_style = 'dark'
" let g:lucius_contrast = 'high'
" let g:lucius_contrast_bg = 'high'

" colorscheme gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='hard'

" Options

highlight clear SignColumn
