"directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
call plug#end()

"quickly open/reload .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"navigation in insert mode to emacs style
imap <C-p> <esc><Up>
imap <C-n> <esc><Down>
imap <C-b> <esc><Left>
imap <C-f> <esc><Right>

"window navigation
map <C-o> <C-w><C-w>

"tab navigation
map <C-t> :tabnew<CR>
imap <C-t> <esc>:tabnew<CR>
map <Leader>w :close<CR>
map <Leader>[ :tabprevious<CR>
map <Leader>] :tabnext<CR>

"map <esc> to <ctrl-l>
imap <C-l> <Esc>
vmap <C-l> <Esc>

"save with ctrl-s
nmap <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

"NERDTree
map <Leader>\ :NERDTreeToggle<CR>

"color schemes and syntax highlighting
map ts :SyntasticToggleMode<CR>
syntax enable 		    "enable syntax highlighting

"editor configuration
set tabstop=4       "set tab spacing to 4 spaces
"set expandtab		"expands tabs into spaces instead
"set shiftwidth=4
"set softtabstop=4   "this edits in the number of tab spaces
set relativenumber  "show relative linenumbers around cursor
set number          "show actual line number under cursor
autocmd BufWritePre * :%s/\s\+$//e "removes trailing whitespace on save
set clipboard+=unnamedplus
set backspace=indent,eol,start

"ui configuration
set number            "adds line numbers to your editor
set showcmd           "shows last command entered in bottom right
set cursorline        "highlights current line
filetype indent on    "load filetype specific indent files
filetype plugin on    "turn on filetype plugins
set wildmenu          "visual autocomplete for command menu
set showmatch         "shows matching {[( when cursor is above

"syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntasting_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
map <silent> <Leader>e :Errors<CR>

