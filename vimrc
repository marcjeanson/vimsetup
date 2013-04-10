call pathogen#infect()
syntax on
set nocompatible
filetype plugin indent on

" put all the swap files in /var/tmp instead of the current dir
set directory=/var/tmp

set nowrap 
set autoindent expandtab smarttab           " settings for indentation
set tabstop=2 shiftwidth=2 softtabstop=2    " use 2 spaces for indenting
set nobackup nowritebackup                  " turn off backup file creation
set laststatus=2                            " always show the status line
set incsearch ignorecase smartcase hlsearch " search options
set hidden
set history=1000                            " remember the last 1000 command instead of the default 20
set cursorline                              " highlight the current line
set wildmenu                                " Make the command/file menu completion show more information
set wildmode=list:longest                   " Make the completions window larger
set notimeout
set ttimeout
set timeoutlen=50
set number
set list

" STATUSLINE
set statusline=
set statusline +=%<%f%*             "relative path"
set statusline +=%y%*               "file type
set statusline +=%m%*               "modified flag
set statusline +=%=%5l%*            "current line
set statusline +=/%L%*              "total lines
set statusline +=%4v\ %*            "virtual column number

let mapleader = ","

" CtrlP
let g:ctrlp_map = '<leader>1'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
map <silent> <leader>2 :CtrlPMixed<CR>
map <silent> <leader>3 :CtrlPBuffer<CR>

" Instead of using C-w to prefix window movement commands, lets try tab
map <tab> <C-w>

map <leader>n :NERDTreeToggle<CR>
"map <leader>R :wa\|:Rake<CR>
map <leader>f :Ag -i<SPACE>

imap <C-l> <space>=><space>

"toggle the search highlighting by pressing space
:noremap <Space> :set hlsearch! hlsearch?<cr>

"fix my common typos
command! W :w
command! Wa :wa
command! Q :q
command! Qa :qa

colorscheme molokai

let vimclojure#HighlightBuiltins=1  " Highlight Clojure's builtins
let vimclojure#ParenRainbow=1       " Rainbow parentheses'!

" settings to speed up vim in the terminal with long lines
set synmaxcol=300
set ttyfast
set ttyscroll=3
set lazyredraw

" vroom settings
let g:vroom_use_binstubs = 1

let g:ackprg = 'ag --nogroup --nocolor --column'

" make sure nerdtree doesn't get squashed by other windows
let g:NERDTreeWinSize = 40

nmap <leader>l :NumbersToggle<CR>

" Dealing with whitespace
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
