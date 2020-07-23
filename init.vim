"SETUP VIM PLUGINSs""
call plug#begin('~/.config/nvim')
"font
    Plug 'powerline/fonts'
"Nerdcomment
    Plug 'preservim/nerdcommenter'
"Easymotion
    Plug 'easymotion/vim-easymotion'
"view
	Plug 'Yggdroot/indentLine'
"Ntree
	Plug 'scrooloose/nerdtree'
"theme
	Plug 'morhetz/gruvbox'
"vim air-line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
"Run
    Plug 'derekwyatt/vim-protodef'
    Plug 'terryma/vim-multiple-cursors'
"crtl+p
	Plug 'kien/ctrlp.vim'
"linting
	Plug 'dense-analysis/ale'
"ycm(compiler)
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
"clang format
	Plug 'rhysd/vim-clang-format'
"auto pairs
	Plug 'vim-scripts/auto-pairs-gentle'	
"Tagbar (f8)
	Plug 'majutsushi/tagbar'
"gundo(nodeicons)
	Plug 'sjl/gundo.vim'
"Vim-move
	Plug 'matze/vim-move'
"wildfire(removeinside())
	Plug 'gcmt/wildfire.vim'	
call plug#end()
"========================SETTINGS==========================
"========================Ntree=============================
map <C-b> :NERDTreeToggle<CR> "Mo toggle"
map <C-i> :NERDTreeFind<CR> "Tim vi tri file"
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$']
command! -nargs=0 Prettier :CocCommand prettier.formatFile
set modifiable
"=====================Nerdcomment=========================
filetype plugin on
"========================themes============================
syntax enable
set background=dark
highlight normal ctermbg=none
colorscheme gruvbox
set termguicolors
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](node_modules|build|public|lib|dist)|(\.(git|svn))$',
    \ 'file': 'tags\|tags.lock\|tags.temp',
    \ }
"=======================YCM===============================
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_key_list_select_completion = ['<C-k>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-l>', '<Up>']
let g:SuperTabDefaulCompletionType = '<C-k>'

" disable annoying ycm confirmation
let g:ycm_confirm_extra_conf = 0

" add path to ycm_extra_conf.py (you could also copy the file in the home folder)
" delete '...98' argument from .ycm_extra_conf.py, otherwise syntastic does
" not work properly
let g:ycm_global_ycm_extra_conf = '/home/jan/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

 
" ################ Ale ##############################
 
" autocompletion
let g:ale_completion_enabled = 1

let g:ale_cpp_clang_executable = 'clang++-5.0'

" linter
 let g:ale_linters = {
            \   'cpp': ['clang']
            \}
let g:ale_cpp_clang_options = '-std=c++1z -O0 -Wextra -Wall -Wpedantic -I /usr/include/eigen3'
"let g:ale_cpp_clangtidy_options = '-checks="cppcoreguidelines-*"'
"let g:ale_cpp_cpplint_options = ''
"let g:ale_cpp_gcc_options = ''
"let g:ale_cpp_clangcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''


" ################ Clang format #####################
 
" Clang format - auto formatting
 
let g:clang_format#command = 'clang-format-2.8'
let g:clang_format#style_options = {
            \ "BreakBeforeBraces" : "Attach",
            \ "UseTab" : "Never",
            \ "IndentWidth" : 5,
            \ "ColumnLimit" : 101,
            \ "AccessModifierOffset" : -3,
            \ "AllowShortIfStatementsOnASingleLine" : "false",
            \ "AllowShortFunctionsOnASingleLine" : "false",
            \}

" shortcuts for autoformatting the entire file: Ctrl+j
inoremap <C-j> <Esc>:ClangFormat<CR>
nnoremap <C-j> <Esc>:ClangFormat<CR>
"==================Auto pairs=========================

let g:AutoPairsUseInsertedCount = 2

"=================Tagbar==============================
nmap <F8> :TagbarToggle<CR>
"set g:tagbar_ctags_bin.
set number
"=================Custom==============================
set nowrap
set autoindent
set smartindent
set lazyredraw
nmap <c-s> :w<CR>
imap <c-s> <ESC>:w<CR>
nmap <F5> :so %<CR>
nmap <F6>:ssty -ixon<CR>
set autoindent
set smartindent
set lazyredraw
"vmap 1line
set lazyredraw

" Ignore case when searching
set ignorecase

" Don't ignore case when search has capital letter
set smartcase

" Enable highlighted case-insensitive incremential search
set incsearch

" Enble search highlighting
set hlsearch
"Hide buffers
set hidden
"allow backspace
set backspace=indent,eol,start
set smarttab
set cindent
set relativenumber
set tabstop=4
set shiftwidth=4
" always uses spaces instead of tab characters
set expandtab
"terminal
set autowrite
nnoremap <F5> :!g++ -std=c++11 % -Wall -g && ./a.out<CR>
"=================IndentLine===============================
" toggle""
let g:indentLine_char = '│'
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"===================Gundo===============================
"nnoremap = <Leader>ud :GundoToggle<CR>

"===================vim-move===========================
let g:move_map_keys = 0
vmap <C-k> <Plug>MoveBlockUp
vmap <C-j> <Plug>MoveBlockDown
nmap <C-k> <Plug>MoveLineUp
nmap <C-j> <Plug>MoveLineDown
"=====================Fonts with ligtures vim========
"syntax match arrow "->" conceal cchar=→
"syntax match rpipe "|>" conceal cchar=⊳
"syntax match lpipe "<|" conceal cchar=⊲
"syntax match rcomp ">>" conceal cchar=»
"syntax match lcom "<<" conceal cchar=«
"syntax match lambda "\\" conceal cchar=λ
"syntax match cons "::" conceal cchar=∷
"syntax match parse1 "|=" conceal cchar=⊧
"syntax match parse2 "|." conceal cchar=⊦
"syntax match neq "/=" conceal cchar=≠
"===================wildfire==========================
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)
" This selects the next closest text object.
"====================Vimeasymotion===================

nmap <silent> gw <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
