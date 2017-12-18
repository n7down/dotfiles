set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'valloric/youcompleteme'
Plugin 'scrooloose/syntastic'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'universal-ctags/ctags'
Plugin 'tpope/vim-surround'
Plugin 'moll/vim-bbye'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
filetype plugin indent on
set laststatus=2            " be iMproved, required
set encoding=utf-8

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

" nerdtree
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

map <C-t> :NERDTreeToggle<CR>

" hemisu
set background=dark
colorscheme hemisu

" air-line
let g:airline_solarized_bg='dark'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" air-line tabs
let g:airline#extensions#tabline#enabled = 1

" numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" backspace
set backspace=indent,eol,start

" buffers
" nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nmap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
" nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
nmap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" map <C-d> :bp<bar>sp<bar>bn<bar>bd<CR>
map <C-w> :Bdelete<CR>

" mouse
set mouse=a

" nerdtree git plugin
let g:NERDTreeIndicatorMapCustom = {
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

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✖"
" let g:syntastic_warning_symbol = "⚠"
let g:syntastic_warning_symbol = "!"
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_check_header = 1
" let g:syntastic_c_checkers = ['gcc']
" let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_c_include_dirs = ['src', 'src/main', 'src/main/target/BETAFLIGHTF3']
let g:syntastic_cpp_include_dirs = ['src', 'src/main']

" this is causing issues
let g:ycm_filetype_specific_completion_to_disable = {
			\ 'cpp': 1
			\ }
let g:ycm_show_diagnostics_ui = 0

function! ToggleErrors()
	if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
		" No location/quickfix list shown, open syntastic error location panel
		Errors
	else
		lclose
	endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>

" tagbar
nmap <C-r> :TagbarToggle<CR>
" autocmd VimEnter * nested :TagbarOpen

let g:tagbar_type_cpp = {
			\ 'ctagstype' : 'c++',
			\ 'kinds'     : [
			\ 'd:macros:1:0',
			\ 'p:prototypes:1:0',
			\ 'g:enums',
			\ 'e:enumerators:0:0',
			\ 't:typedefs:0:0',
			\ 'n:namespaces',
			\ 'c:classes',
			\ 's:structs',
			\ 'u:unions',
			\ 'f:functions',
			\ 'm:members:0:0',
			\ 'v:variables:0:0'
			\ ],
			\ 'sro'        : '::',
			\ 'kind2scope' : {
			\ 'g' : 'enum',
			\ 'n' : 'namespace',
			\ 'c' : 'class',
			\ 's' : 'struct',
			\ 'u' : 'union'
			\ },
			\ 'scope2kind' : {
			\ 'enum'      : 'g',
			\ 'namespace' : 'n',
			\ 'class'     : 'c',
			\ 'struct'    : 's',
			\ 'union'     : 'u'
			\ }
			\ }

" snips
let g:UltiSnipsExpandTrigger="<C-z>"
let g:UltiSnipsJumpForwardTrigger="<C-s>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" redo
nmap <S-u> :redo<CR>

" window switching
" right
:nmap <silent> <C-h> :wincmd h<CR>
" down
:nmap <silent> <C-j> :wincmd j<CR>
" up
:nmap <silent> <C-k> :wincmd k<CR>
" left
:nmap <silent> <C-l> :wincmd l<CR>
