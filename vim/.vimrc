filetype plugin indent on
syntax on
filetype on

" set foldmethod=syntax
" set foldmethod=indent
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set hidden
set scrolloff=10
set sidescrolloff=5
set sidescroll=1
set nohlsearch
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undoir
set undofile
set incsearch
"set hlsearch
set mouse=a
set lazyredraw
set clipboard=unnamedplus
set wildmenu
" set wildmode=full,full
set wildoptions=pum
set ttyfast
let g:gruvbox_italic=1
set termguicolors
packloadall
set rnu
set background=dark
let g:mapleader=" "
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'jremmen/vim-ripgrep'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-utils/vim-man'
Plugin 'lyuts/vim-rtags'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'sbdchd/neoformat'
Plugin 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plugin 'junegunn/fzf.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'mhinz/vim-grepper'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'alvan/vim-closetag'
Plugin 'preservim/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mhinz/vim-startify'
Plugin 'sainnhe/gruvbox-material'
Plugin 'sheerun/vim-polyglot'
Plugin 'luochen1990/rainbow'
Plugin 'unblevable/quick-scope'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'zivyangll/git-blame.vim'
Plugin 'voldikss/vim-floaterm'
Plugin 'liuchengxu/vim-which-key'
Plugin 'tpope/vim-surround'
Plugin 'uiiaoo/java-syntax.vim'
Plugin 'tpope/vim-commentary'
Plugin 'mlaursen/vim-react-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'pantharshit00/vim-prisma'
Plugin 'dkarter/bullets.vim'
Plugin 'mattn/emmet-vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'godlygeek/tabular'
Plugin 'chrisbra/csv.vim'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'tribela/vim-transparent'
Plugin 'joshdick/onedark.vim'
Plugin 'preservim/tagbar'
Plugin 'puremourning/vimspector'
Plugin 'sainnhe/everforest'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'fatih/vim-go'
Plugin 'Jorengarenar/vim-syntaxMarkerFold'
Plugin 'lambdalisue/fern.vim'
Plugin 'lambdalisue/fern-git-status.vim'
Plugin 'lambdalisue/glyph-palette.vim'
Plugin 'lambdalisue/fern-renderer-nerdfont.vim'
Plugin 'lambdalisue/nerdfont.vim'
Plugin 'lambdalisue/fern-hijack.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'junegunn/goyo.vim'
Plugin 'APZelos/blamer.nvim'
Plugin 'catppuccin/vim', { 'as': 'catppuccin' }
Plugin 'rust-lang/rust.vim',
" Plugin 'bling/vim-bufferline'

call vundle#end()

colorscheme catppuccin_mocha
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey20

filetype plugin on


nnoremap <silent> <Leader><Enter> :Buffers<CR>
let $FZF_DEFAULT_OPTS= '--bind ctrl-a:select-all'
command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

syn match parens /[(){}]/

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]


"set encoding=UTF-8
map <S-L> :bn<CR>
map <S-H> :bp<CR>
map <C-x> :bw<CR>
"nnoremap <silent> <expr> <C-\> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
let g:NERDTreeIgnore = ['^node_modules$']


" map <C-n> :call NERDTreeToggleAndRefresh()<CR>

" function NERDTreeToggleAndRefresh()
"   :NERDTreeToggle
"   if g:NERDTree.IsOpen()
"     :NERDTreeRefreshRoot
"   endif
" endfunction



map <C-\> :vsplit<CR>
au BufReadPost *.handlebars set filetype=html syntax=handlebars
:command Q q
:command W w
:command Wq wq

autocmd BufWritePre *.js Neoformat

nnoremap <Leader>r :%s///g<Left><Left>

" command! -bang -nargs=* Rg \ call fzf#vim#grep( \ "rg --column --line-number --no-heading --color=always --smart-case " . \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" mhinz/vim-grepper" .............................................................................
let g:grepper={}
let g:grepper.tools=["rg"]
xmap gr <plug>(GrepperOperator)
" After searching for text, press this mapping to do a project wide find and" replace. It's similar to <leader>r except this one applies to all matches" across all files instead of just the current file.
nnoremap <Leader>l
    \ :let @s='\<'.expand('<cword>').'\>'<CR>
    \ :Grepper -cword -noprompt<CR>
    \ :cfdo %s/<C-r>s//g \| update
    \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" inoremap {<CR> {<CR>}<Esc>ko<tab>
" inoremap [<CR> [<CR>]<Esc>ko<tab>
" inoremap (<CR> (<CR>)<Esc>ko<tab>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tabs_label = ''
let g:airline_powerline_fonts = 1
let g:airline_experimental = 1
let g:airline_detect_spelllang=1
let g:airline_section_c_only_filename = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = ' '
  let airline#extensions#coc#stl_format_err = '%C'
let g:airline#extensions#coc#warning_symbol = ' '
  let airline#extensions#coc#stl_format_warn = '%C'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " let g:airline_left_sep=''
    " let g:airline_right_sep=''
    " let g:airline_section_z=''
    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.maxlinenr = ''
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ' |'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ' ☰  '
    let g:airline_symbols.maxlinenr = '  '


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" let g:coc_snippet_next = '<tab>'

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <NUL> coc#refresh()

let g:UltiSnipsExpandTrigger = '<C-0>'
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'
" let g:UltiSnipsJumpForwardTrigger = '<C-Tab>'
" let g:UltiSnipsJumpBackwardTriggerr = '<S-TAB>'

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
" TODO: criar snippets <17-07-22, erlonbie> "
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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-Down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  nnoremap <silent><nowait><expr> <C-Up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
  inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 LazyGit :call (FloatermNew --width=0.9 --height=0.9 lazygit)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline^=%{coc#status()}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
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

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<C-b>"
"let g:UltiSnipsJumpBackwardTrigger="<C-z>"


"rainbow brackets
let g:rainbow_active = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

"startify

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'v': '~/.vimrc' },
            \ { 'n': '~/.config/nvim/init.lua' },
            \ { 'b': '~/.bashrc' },
            \ { 't': '~/.config/qtile/config.py' },
            \ { 'a': '~/.alacritty.yml' },
            \ ]

let g:startify_custom_header = [
      \ ' $$$$$$$$\           $$\                   $$\               $$\    $$\ $$\',
      \ ' $$  _____|          $$ |                  $  |              $$ |   $$ |\__|',
      \ ' $$ |       $$$$$$\  $$ | $$$$$$\  $$$$$$$\\_/$$$$$$$\       $$ |   $$ |$$\ $$$$$$\$$$$\',
      \ ' $$$$$\    $$  __$$\ $$ |$$  __$$\ $$  __$$\ $$  _____|      \$$\  $$  |$$ |$$  _$$  _$$\',
      \ ' $$  __|   $$ |  \__|$$ |$$ /  $$ |$$ |  $$ |\$$$$$$\         \$$\$$  / $$ |$$ / $$ / $$ |',
      \ ' $$ |      $$ |      $$ |$$ |  $$ |$$ |  $$ | \____$$\         \$$$  /  $$ |$$ | $$ | $$ |',
      \ ' $$$$$$$$\ $$ |      $$ |\$$$$$$  |$$ |  $$ |$$$$$$$  |         \$  /   $$ |$$ | $$ | $$ |',
      \ ' \________|\__|      \__| \______/ \__|  \__|\_______/           \_/    \__|\__| \__| \__|',
      \]

"NERDTree-git

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"Git-gutter

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

"Gblame
nnoremap <Leader>ss :<C-u>call gitblame#echo()<CR>

function! s:ToggleBlame()
    if &l:filetype ==# 'fugitiveblame'
        close
    else
        Git blame
    endif
endfunction

nnoremap <leader>b :call <SID>ToggleBlame()<CR>

"Float term

let g:floaterm_keymap_toggle = '<leader>tf'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.5
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

highlight link javaIdentifier NONE
highlight link javaDelimiter NONE

vnoremap > >gv
vnoremap < <gv

map <C-c> <plug>Commentary

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let NERDTreeShowHidden=0

noremap x "_x
noremap X "_x


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|node_modules)',
  \ }

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'gitcommit',
    \ 'scratch'
    \]

" Move current tab into the specified direction.
"
" @param direction -1 for left, 1 for right.
" function! TabMove(direction)
"     " get number of tab pages.
"     let ntp=tabpagenr("$")
"     " move tab, if necessary.
"     if ntp > 1
"         " get number of current tab page.
"         let ctpn=tabpagenr()
"         " move left.
"         if a:direction < 0
"             let index=((ctpn-1+ntp-1)%ntp)
"         else
"             let index=(ctpn%ntp)
"         endif

"         " move tab page.
"         execute "tabmove ".index
"     endif
" endfunction

" map <C-h> :call TabMove(-1)<CR>
" map <C-l> :call TabMove(1)<CR>

" nmap <C-l> zfi{
" nmap <C-h> :set foldmethod=indent<CR>
" nmap <C-c> :set foldmethod=manual<CR>
" nmap <C-e> :e<CR>

let g:LanguageClient_serverCommands = {
\ 'prolog': ['swipl',
\            '-g', 'use_module(library(lsp_server)).',
\            '-g', 'lsp_server:main',
\            '-t', 'halt',
\            '--', 'stdio']
\ }

let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '¦'
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
" let g:indentLine_setColors = 0
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0
au FileType markdown let g:indentLine_setConceal= 0

" noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(15)<CR>
" noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-15)<CR>

" let g:comfortable_motion_friction = 0.0
" let g:comfortable_motion_air_drag = 4.0

" let g:comfortable_motion_friction = 200.0
" let g:comfortable_motion_air_drag = 0.0

let g:comfortable_motion_friction = 80.0
let g:comfortable_motion_air_drag = 2.0

let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
" nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
" nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

" if has('vim')
"     let g:python3_host_prog = '/usr/bin/python3'
" else
"     set pyxversion=3

"     " OSX
"     set pythonthreedll=/Library/Frameworks/Python.framework/Versions/3.6/Python

"     " Windows
"     set pythonthreedll=python37.dll
"     set pythonthreehome=C:\Python37
" endif
"
"
let g:coc_global_extensions = [
      \'coc-vimlsp',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-marketplace',
      \'coc-html',
      \'coc-emoji',
      \'coc-emmet',
      \'coc-clang-format-style-options',
      \'coc-yaml',
      \'coc-tsserver',
      \'coc-swagger',
      \'coc-sql',
      \'coc-pyright',
      \'@yaegassy/coc-black-formatter',
      \'coc-prisma',
      \'coc-omnisharp',
      \'coc-json',
      \'coc-java',
      \'coc-flutter',
      \'coc-clangd',
      \'coc-phpactor',
      \'coc-rust-analyzer',
      \'@frogsquare/coc-dart-analyze',
      \'coc-go',
      \]

" copy (write) highlighted text to .vimbuffer
"vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
"map <C-v> :r ~/.vimbuffer<CR>

nmap <C-T> :TagbarToggle<CR>
let g:vimspector_enable_mappings = 'HUMAN'

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" nmap <C-f> :Files<CR>
" nmap <C-b> :Ag<CR>
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" let g:go_def_mapping_enabled=0
let g:go_highlight_extra_types = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_highlight_chan_whitespace_error = 1
let g:go_gotags_bin = 'gotags'
let g:go_highlight_space_tab_error = 1
let g:go_fmt_command = 'goimports'
let g:go_jump_to_error = 1
let g:go_loaded_gosnippets = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_doc_popup_window = 1
let g:go_jump_to_error = 1
let g:go_loaded_gosnippets = 1
let g:go_loaded_install = 1

autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
let g:NERDTreeHijackNetrw=0

nmap <C-n> <Cmd>CocCommand explorer<CR>
" nnoremap <C-n> :Fern . -drawer -toggle<cr>
nnoremap <Leader>fe :Fern %:h -drawer -toggle<cr>

let g:fern#renderer = "nerdfont"
let g:fern#disable_viewer_smart_cursor = 1

function! s:init_fern() abort
  nmap <buffer> I <Plug>(fern-action-hidden:toggle)
  nmap <buffer> H <Plug>(fern-action-open:split)
  nmap <buffer> V <Plug>(fern-action-open:vsplit)
  nmap <buffer> R <Plug>(fern-action-rename)
  nmap <buffer> M <Plug>(fern-action-move)
  nmap <buffer> C <Plug>(fern-action-new-copy)
  nmap <buffer> N <Plug>(fern-action-new-path)
  nmap <buffer> F <Plug>(fern-action-new-file)
  nmap <buffer> D <Plug>(fern-action-new-dir)
  nmap <buffer> dd <Plug>(fern-action-trash)
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType fern call s:init_fern()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
  autocmd FileType coc-explorer call glyph_palette#apply()
augroup END

xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

" highlight Pmenu guibg=#d8a657 guifg=black gui=bold
" highlight CursorHold guibg=#d8a657 gui=bold
" highlight Fold guibg=#d8a657 gui=bold

" <Leader>f{char} to move to {char}
map  <Leader><leader>f <Plug>(easymotion-bd-f)
nmap <Leader><leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader><leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader><leader>w <Plug>(easymotion-bd-w)
nmap <Leader><leader>w <Plug>(easymotion-overwin-w)

" Vim default
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

let g:multi_cursor_use_default_mapping=0

" Default mapping
" let g:multi_cursor_start_word_key      = '<C-o>'
" let g:multi_cursor_select_all_word_key = '<C-e>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<C-e>'
" let g:multi_cursor_next_key            = '<C-o>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-X>'
" let g:multi_cursor_quit_key            = '<Esc>'

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

xmap <leader>x  <Plug>(coc-convert-snippet)

let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_prefix = ' > '


let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nmap <space>ed <Cmd>CocCommand explorer --preset .vim<CR>
nmap <space>ef <Cmd>CocCommand explorer --preset floating<CR>
nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>
" let g:fern_disable_startup_warnings = 1
nmap <leader>tt :TagbarToggle<CR>
