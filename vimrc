set nocompatible              " required
filetype off                  " required
set number
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'jpalardy/vim-slime'
Plugin 'hanschen/vim-ipython-cell'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'sheerun/vim-polyglot'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/tagbar'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'frazrepo/vim-rainbow'
Plugin 'kien/ctrlp.vim'
" python sytax checker
Plugin 'nvie/vim-flake8'
"Plugin 'vim-scripts/Pydiction'
"Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Yggdroot/indentLine'

""code folding
Plugin 'tmhedberg/SimpylFold'
"git interface
Plugin 'tpope/vim-fugitive'

Plugin 'preservim/nerdcommenter'
" add all your plugins here (note older versions of Vundle


let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinSize = 31        " Set panel width to 31 columns

let g:slime_target = "tmux"

let g:tagbar_autofocus = 1 " Focus the panel when opening it
let g:tagbar_autoshowtag = 1 " Highlight the active tag
let g:tagbar_position = 'botright vertical' " Make panel vertical and place on the right

let g:Tlist_Ctags_Cmd='/usr/bin/ctags'

let g:airline_theme='base16_solarized'

let python_highlight_all=0

let g:ycm_autoclose_preview_window_after_completion=1
"nerd commenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"nerd commenter end
"INTEND LINE
let g:indentLine_char = '|'
"INTENT LINE END
" Mapping to open and close the panel
nmap <F8> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <C-G> :vsplit <bar> :wincmd l <bar> :FSRight<CR>


map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'


set completeopt-=preview
set tabstop=4 " How many columns of whitespace
set shiftwidth=4 " How many columns of whitespace a level of indentation is worth
"set expandtab " Use spaces when tabbing
"set incsearch  " Enable incremental search
set hlsearch   " Enable highlight search
set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits
set encoding=utf-8
set clipboard=unnamedplus
vmap <C-c> "+y
imap <C-v> <C-r>+

set splitbelow
set splitright

nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctrl+JK ile bir line tasima
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Z ile bir line bosluk birakma
nmap Z i<cr><esc>k$
" \d ile hafizaya almadan kesme islemi yapma
nnoremap <leader>d "_d
vnoremap <leader>d "_d

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
"Run Python File with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

syntax on

set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey
highlight Visual cterm=bold ctermbg=White ctermfg=NONE

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
