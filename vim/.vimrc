set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pearofducks/ansible-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
Plugin 'chriskempson/base16-vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'hashivim/vim-terraform'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



set laststatus=2		" Let the statusline appear all the time
syntax on			" Syntax highlighting
set mouse=a			" Enable mouse support
set number			" Display Line Numbers on the left
set relativenumber		" Cursor line is the reference for line numbers
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch			" do incremental searching
set hlsearch
set t_Co=256
set history=1000
set timeoutlen=50
set tabstop=4



"" Airline options
""""""""""""""""""
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" powerline symbols

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Theme
let g:airline_theme = 'powerlineish'

"let g:airline_theme = 'powerlineish'

let g:airline#extensions#tabline#enabled = 1		" Enable TabLine
let g:airline#extensions#tabline#tab_min_count = 2	" configure the minimum number of tabs needed to show the tabline.
let g:airline#extensions#tabline#buffer_min_count = 2	" don't show buffers names if opened only one file
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline_mode_map = {
"			\ 'n' : 'N',
"			\ 'i' : 'I',
"			\ 'R' : 'R',
"			\ 'c' : 'C',
"			\ 'v' : 'V',
"			\ }

" Ansible specific options
let g:ansible_extra_syntaxes = "sh.vim ruby.vim"
let g:ansible_attribute_highlight = "ab"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1



"" NERDTREE options
"""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif		" Close vim if only NERDTree is left open



" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") >= 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")



" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif


" Colorscheme options
" let base16colorspace=256		" Access colors present in 256 colorspace

if !exists("g:onedark_terminal_italics")
	let g:onedark_terminal_italics = 1
endif

if !exists("g:quantum_italics")
	let g:quantum_italics = 1
endif

if !exists("g:quantum_black")
	let g:quantum_black = 1
endif

set background=dark
set termguicolors
colorscheme quantum

" Highlighting options
" highlight cursorlinenr ctermfg=yellow
" highlight Nonrmal ctermbg=none
" highlight NonText ctermbg=none

if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif
