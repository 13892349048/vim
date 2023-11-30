call plug#begin('~/.vim/plugged/')

Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
"Plug 'vim-airline/vim-airline'
Plug 'suan/vim-instant-markdown'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/ibmedit.vim'
Plug 'tpope/vim-fugitive'
Plug 'fugalh/desert.vim'
Plug 'albertorestifo/github.vim'
Plug 'chriskempson/base16-vim'
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'tell-k/vim-autopep8'
Plug 'tomlion/vim-solidity'
Plug 'mhinz/vim-mix-format'
Plug 'vim-syntastic/syntastic'
Plug 'mileszs/ack.vim'
Plug 'jnurmine/Zenburn'
Plug 'leafgarland/typescript-vim'
Plug 'crusoexia/vim-monokai'
" 可以快速对齐的插件
Plug 'junegunn/vim-easy-align'
" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'
" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'
" gr gt 
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plug 'jiangmiao/auto-pairs'
call plug#end()


"""""""""""""""
"find file
"""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

""""""""""""""""""""""""""""
" COLOR SCHEME AND APPERANCE 
""""""""""""""""""""""""""""
syntax enable
set termguicolors
colorscheme base16-atelier-cave
set background=dark
set number
set guicursor+=i:block-cursor " Always use blockcursor.
set termguicolors
""""""""""""""""""
" GENERAL SETTINGS 
""""""""""""""""""
set bs=2
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set timeout timeoutlen=5000 ttimeoutlen=100
set hlsearch
set incsearch
set ignorecase
set smartcase
set smartindent
set autoindent
set hidden
set colorcolumn=80
set splitbelow " split panes below instead above.

"""""""""""""""
" OPTIMIZATIONS
"""""""""""""""
let loaded_matchparen = 1 " avoid loading the param pluging

""""""""""""""
" KEY BINDINGS 
""""""""""""""
imap jj <Esc>
let mapleader="\<SPACE>"
nmap <silent> <leader>v :vsp<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> mm :noh<CR> " clear highlight selection

"""""
" ACK
"""""
nnoremap <Leader>f :Ack!<Space>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeFileLines = 1

""""""""""
" NERDTREE
""""""""""
nmap <leader>b :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"

""""""""""
" Coc completion engine
""""""""""
" use Tab to navigate
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" commit completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"""""""
" CTRLP
"""""""
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|env'

"""""""""
" AIRLINE
"""""""""
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

""""""""""""""""""""""""
" PRETTIER
""""""""""""""""""""""""
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.scss,*.json,*.md,*yaml PrettierAsync
let g:prettier#exec_cmd_async = 1

""""""""""""""""""""""""
" LANGUAGE CONFIGURATION
""""""""""""""""""""""""
" GOLANG
let g:go_fmt_command="goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1

let g:godef_split=2


" ELIXIR
let g:mix_format_on_save = 1
" RUST
let g:rustfmt_autosave = 1
" PYTHON
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1

""""""""""""""""
" CUSTOM SCRIPTS
""""""""""""""""
" Set the current indentation :Indent <number>
" E.G <:Indent 2> will set the indentation to 2 spaces.
:command -nargs=1 Ee :ident <args>

fun! s:indent(indent)
    execute ':set tabstop=' . a:indent
    execute ':set shiftwidth=' . a:indent
endfun

" Search and replace :Replace <origin> <dest>
" E.G <:Replace foo bar> will replace occurences of foo with bar.
fun! s:sub(search, replace)
   execute ':%s/' . a:search . '/' . a:replace . '/gc'
endfun

command! -nargs=+ Replace call s:sub(<f-args>)
command! -nargs=+ Indent call s:indent(<f-args>)
