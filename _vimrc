set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'valloric/youcompleteme'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'universal-ctags/ctags'
Plugin 'tpope/vim-surround'
Plugin 'moll/vim-bbye'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'

"Plugin 'scrooloose/syntastic'
"Plugin 'calviken/vim-gdscript3'

call vundle#end()
filetype plugin indent on
syntax on
set laststatus=2
set encoding=utf-8

" for go
set autowrite

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

map <C-y> :NERDTreeToggle<CR>

" hemisu
set background=dark
colorscheme hemisu

" colors
highlight Search term=reverse ctermbg=24 guibg=#005F87
highlight SpellRare term=reverse ctermbg=24 guibg=#005F87
highlight DiffAdd term=reverse ctermbg=24 guibg=#005F87
"highlight Search term=standout ctermfg=241 ctermbg=233 guifg=#777777 guibg=#111111
"highlight Visual term=standout ctermbg=233 guibg=#222222
"highlight Search term=standout ctermbg=233 guibg=#222222
"highlight SpellRare term=standout ctermbg=233 guibg=#222222
"highlight DiffAdd term=standout ctermbg=233 guibg=#222222

highlight GoDebugBreakpoint term=reverse ctermfg=0 ctermbg=88 guifg=Black guibg=#63001C
highlight GoDebugCurrent term=reverse ctermbg=24 guibg=#005F87

" air-line
let g:airline_theme='minimalist'
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
nmap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nmap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
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

" ycm
set completeopt-=preview

" tagbar
nmap <C-o> :TagbarToggle<CR>


au BufWinLeave,BufWritePost,BufLeave * if expand("%") != "" && &buftype == "" | silent mkview! | endif
au BufWinEnter,BufReadPost,BufEnter * if expand("%") != "" && &buftype == "" | silent loadview | endif

" snips
let g:UltiSnipsExpandTrigger="<C-d>"
let g:UltiSnipsJumpForwardTrigger="<C-s>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" redo
nmap <S-u> :redo<CR>

" window switching
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>

" ag
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" disable ctrl-z
nnoremap <c-z> <nop>

" insert closing brace
inoremap {<CR> {<CR>}<C-o>O

" bindings for go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
"nnoremap <C-a> :cclose<CR>

"function! s:run_go_files()`
	"let l:file = expand('%')
	"if l:file =~# '^\f\+_test\.go$'
		"call (go-test)
	"elseif l:file =~# '^\f\+\.go$'
		"call (go-run) 
	"endif
"endfunction
"autocmd FileType go nmap <C-r> :<C-u>call <SID>run_go_files()<CR>

autocmd FileType go nmap <C-r> <Plug>(go-run)
autocmd FileType go nmap <C-u> <Plug>(go-test)
"autocmd FileType go nmap <C-i> <Plug>(go-info)

let g:go_auto_type_info = 0 

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
		call go#test#Test(0, 1)
	elseif l:file =~# '^\f\+\.go$'
		call go#cmd#Build(0)
	endif
endfunction
autocmd FileType go nmap <C-g> :<C-u>call <SID>build_go_files()<CR>

" for highlighting variables
":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')) nnoremap <buffer> <C-h>

" This trigger takes advantage of the fact that the quickfix window can be
" easily distinguished by its file-type, qf. The wincmd J command is
" equivalent to the Ctrl+W, Shift+J shortcut telling Vim to move a window to
" the very bottom (see :help :wincmd and :help ^WJ).
autocmd FileType qf wincmd J
