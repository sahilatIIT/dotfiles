"********************************"
"		init.vim / .vimrc		 "
"********************************"

" Key Bindings "
""""""""""""""""""""""""""""""""""
set mouse=a "enable the mouse 
let mapleader="\\"
"faster saving
"nnoremap <Leader>w :w<CR>
"nnoremap <Leader>q :q<CR>
"nnoremap <Leader>wq :wq<CR>
"switch windows faster
nnoremap H <C-w>h
nnoremap J <C-w>j
nnoremap K <C-w>k
nnoremap L <C-w>l
"push windows around faster
nnoremap <Leader>h <C-w>H
nnoremap <Leader>j <C-w>J
nnoremap <Leader>k <C-w>K
nnoremap <Leader>l <C-w>L
"arrow keys with vim keys
map <C-h> <Left>
map <C-j> <Down>
map <C-k> <Up>
map <C-l> <Right>
"exit vim terminal insert mode with escape
tmap <Esc> <C-\><C-n>
tnoremap <Leader>q :q!<CR>

" Plug-ins
""""""""""""""""""""""""""""""""""
call plug#begin("~/.vim/plugged/")
	Plug 'dag/vim-fish'
	Plug 'lervag/vimtex'
	Plug 'ap/vim-css-color'
	Plug 'godlygeek/tabular'
	Plug 'tpope/vim-fugitive'
	Plug 'dylanaraps/wal.vim'
	Plug 'mhinz/neovim-remote'
	Plug 'scrooloose/syntastic'
	Plug 'itchyny/lightline.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'unblevable/quick-scope'
	Plug 'scrooloose/nerdcommenter'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

" Appearance "
""""""""""""""""""""""""""""""""""
"set wrap		   "turns word wrap on
set nowrap		   "turns word wrap off
set title
set ruler
set number		   "just normal line numbers
set t_Co=256	   "fixes colors even more
set showmatch	   "show matching brackets
set cursorline	   "shows darker color for line cursor
set cmdheight=1	   "command line
set laststatus=2   "status line is 2 lines high
set termguicolors  "fixes colors even more more 
set noequalalways  "windows dont have to be equal size
set signcolumn=no  "left hand column for special signs
"set background=dark
set background=light
syntax on 
"colorscheme onehalfdark
colorscheme onehalflight
"colorscheme wal 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 "fixes colors
"let g:lightline = { 'colorscheme': 'wal' }
"let g:lightline = { 'colorscheme': 'onehalfdark' }
let g:lightline = { 'colorscheme': 'onehalflight' }

" Auto Completion "
""""""""""""""""""""""""""""""""""
function! CleverTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<Tab>"
	else
		return "\<C-N>"
	endif
endfunction
function! CleverShiftTab()
	if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		return "\<S-Tab>"
	else
		return "\<C-P>"
	endif
endfunction
"CleverTab - Tab to open forward native autocomplete (from h: ins-completion)
"CleverShiftTab - Shift+Tab to go back in native autocomplete menu 
inoremap <Tab> <C-R>=CleverTab()<CR>
inoremap <S-Tab> <C-R>=CleverShiftTab()<CR>
"allows Enter to select Pop-Up Menu (pum) autocomplete suggestions
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"set complete=.,w,b,t,i
"set completion to also show on just one match, 
"and to not insert unless selected
set completeopt=menuone,noinsert 
set omnifunc=syntaxcomplete#Complete "omni-completion (syntax-based) for supported languages
filetype plugin on "detect file type and run native vim file-specific scripts 

" Swap Files "
""""""""""""""""""""""""""""""""""
set nobackup
set noswapfile
set nowritebackup

" Spacing
""""""""""""""""""""""""""""""""""
"set ai			  "auto indent"
set noai			  "auto indent"
"set si			  "smart indent"
set nosi			  "smart indent"
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set backspace=eol,start,indent

" Searching "
""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set smartcase
set ignorecase

" Extra "
""""""""""""""""""""""""""""""""""
set belloff=all	   "try to get rid of annoying bells
set encoding=utf-8
packadd termdebug  "add the native vim gdb plugin
set shell=/usr/bin/fish

" Plug-in: NerdCommenter "
""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims=0			 "adds a space after the comment char
let g:NERDToggleCheckAllLines=1
let g:NERDCreateDefaultMappings=0
"comment similar to vscode
map <C-_> <Plug>NERDCommenterToggle 

" Plug-in: Git Gutter "
""""""""""""""""""""""""""""""""""
let g:gitgutter_async=0				"no async updates on git dif
let g:gitgutter_highlight_linenrs=1 "line numbers colored too
autocmd BufWritePost * GitGutter    "update git diff on save
"line numbers match the color of git diff
hi link GitGutterAddLineNr			DiffAdd
hi link GitGutterChangeLineNr		DiffChange 
hi link GitGutterDeleteLineNr		DiffDelete 
hi link GitGutterChangeDeleteLineNr	DiffDelete

" Plug-in: Vim-Tex"
""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_progname = 'nvr'

" Plug-in: Syntastic"
""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
