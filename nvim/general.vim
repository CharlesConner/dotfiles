let mapleader = ","
set shell=zsh " Set zsh as the prompt for vim
set backspace=2 " Backspace deletes in insertmode
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler " Always show cursor position
set showcmd " Display incomplete commands
set laststatus=2 " Always displays the status line
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set shiftwidth=2
set tabstop=2
set shiftround
set expandtab
set scrolloff=3
set list listchars=tab:»·,trail:·  " Display extra whitespace characters
set hidden
set inccommand=nosplit

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Line numbers
set number
set numberwidth=5

" Highlight search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Open new split panes to right and bottom
set splitbelow
set splitright

" The Silver Searcher
if executable('ag')
let &grepprg = "ag --nogroup --nocolor --path-to-ignore ~/.ignore"
endif

" Enable folding
set foldmethod=indent
set foldlevel=99

if has("autocmd")
filetype plugin indent on

autocmd BufReadPost * " {{{2
" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
			\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal g`\"" |
			\ endif "}}}2

" Automatically clean trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

autocmd BufRead,BufNewFile COMMIT_EDITMSG call pencil#init({'wrap': 'soft'})
			\ | set textwidth=0

autocmd BufRead,BufNewFile *.md set filetype=markdown

autocmd BufRead,BufNewFile .eslintrc,.jscsrc,.jshintrc,.babelrc set ft=json

au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.scssm set filetype=scss.css

autocmd BufRead,BufNewFile gitconfig set ft=.gitconfig
autocmd BufEnter *.tsx set filetype=typescript

autocmd BufEnter * set foldmethod=indent

endif

" UI
syntax enable
if has("termguicolors")  " set true colors
	set termguicolors
endif
set background=dark
colorscheme palenight
let no_buffers_menu=1