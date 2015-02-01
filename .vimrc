version 6.0
if !&cp | set cp | endif
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
" vim: set ft=vim :

set nocompatible
filetype off
set backspace=indent,eol,start
syntax enable
set background=dark
set ruler
set sw=4
set ts=4
set ai "auto indent
set si "smart indent
set expandtab
set smartcase
set number
set pastetoggle=<F2>
set incsearch
set hlsearch
set showmatch
set showcmd

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=1      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set nowrap
set noerrorbells
set hidden
set cursorline
set cursorcolumn
set laststatus=2
set ignorecase
set smartcase
set mouse=v
set wildmenu
set wildmode=longest:full,full

if $TMUX == ''
    set clipboard+=unnamed
endif

" Cursor Configuration
if 1 == 0
    if &term =~ '^xterm'
      " solid underscore
      let &t_SI .= "\<Esc>[5 q"
      " solid block
      let &t_EI .= "\<Esc>[1 q"
      " 1 or 0 -> blinking block
      " 3 -> blinking underscore
      " Recent versions of xterm (282 or above) also support
      " 5 -> blinking vertical bar
      " 6 -> solid vertical bar
    endif
endif

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" let Vundle manage Vundle
" required!
" Plugin Manager
Bundle 'gmarik/Vundle.vim'

" Autocomplete
" Bundle 'vim-scripts/L9'
" Bundle 'vim-scripts/FuzzyFinder'
" Bundle 'vim-scripts/AutoComplPop'
" Bundle 'vim-scripts/SearchComplete'
Bundle 'Valloric/YouCompleteMe'


" Syntax Highlighting
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/groovy.vim'

" Productivity Improvements
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'hlissner/vim-forrestgump'
Bundle 'jmcantrell/vim-diffchanges'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-powerline'

" File Navigation
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
" Bundle 'Lokaltog/vim-easymotion' Unstable

" Colorschemes
Bundle 'vim-scripts/Wombat'
Bundle 'vim-scripts/tir_black'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'godlygeek/csapprox'
Bundle 'tpope/vim-vividchalk'
Bundle 'coryf/vim-pathogen-tomorrow-theme'
Bundle 'plasticboy/vim-markdown'

" Old Plugins
" Bundle 'Raimondi/delimitMate'
" Bundle 'vim-scripts/keepcase.vim'
" Bundle 'vim-scripts/Shortcut-functions-for-KeepCase-script-'
" Bundle 'maxbrunsfeld/vim-yankstack'
" Bundle 'paradigm/vim-multicursor'
" Bundle 'Stormherz/tablify'
" Bundle 'vim-scripts/a.vim'
" Bundle 'vim-scripts/SQLComplete.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

filetype plugin indent on     " required!

"python from powerline.vim import source_plugin; source_plugin()
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup

" let g:ctrlp_map = '<leader>p'

" nmap <c-p> <Plug>yankstack_substitute_older_paste
" "nmap <c-P> <Plug>yankstack_substitute_newer_paste
" call yankstack#setup()
" " yankstack
" set clipboard=unnamed

" nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"hi CursorLine term=underline cterm=underline gui=underline
"highlight text between matching brackets
"noremap % v%

"map CTRL+l to clear search results
nnoremap <silent> <C-l> :let @/=""<CR>

" Ctrl j and k map to page up and down
map <C-j> <PageDown>
map <C-k> <PageUp>

"K splits lines at cursor
nmap K i<cr><esc>k$

" Toggle numbers on side
:nmap <F10> :set invnumber<CR>

"
" :nmap <F3> <C-w><C-w>

" remove trailing whitespace
" DO NOT USE WITH BINARY FILES!
" autocmd BufWritePre * :call <SID>StripWhite()
" fun! <SID>StripWhite()
"     %s/[ \t]\+$//ge
"     %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
" endfun
"
" jj switches to command mode
:imap jj <Esc>

" associate *.wsdl with xml filetype
"au BufRead,BufNewFile *.wsdl setfiletype xml

" associate *.gradle with groovy filetype
au BufNewFile,BufRead *.gradle setf groovy

" Send highlighted text to the clipboard
":nmap <+-p> :'<,'>w !cat > /dev/clipboard

"set shell=/bin/zsh

" VIM-Shell
" Ctrl_W e opens up a vimshell in a horizontally split window
" Ctrl_W E opens up a vimshell in a vertically split window
" The shell window will be auto closed after termination
"nmap <C-W>e :new \| vimshell zsh<CR>
"nmap <C-W>E :vnew \| shell bash<CR>
" set t_ku=^[OA
" set t_kd=^[OB
" set t_kr=^[OC
" set t_kl=^[OD

" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"

" yankring <c-p> <c-n> :YRShow <F11>
"nnoremap <silent> <F11> :YRShow<CR>

" snipMate
:filetype plugin on

" NERDTree Plugin
:nnoremap <silent> <F4> :NERDTreeToggle<CR>

" Tagbar Plugin
:nnoremap <silent> <F8> :TagbarToggle<CR>

" Diff Patch
:nnoremap <silent> <F5> :DiffChangesPatchToggle<CR>
:nnoremap <silent> <F6> :DiffChangesPatchToggle<CR>

" Close buffer while retaining window
" <leader>bd
:nnoremap <Leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>


" Replace word under cursor
" <leader>s that line only
" <leader>s entire file
:nnoremap <Leader>s  :s/\<<C-r><C-w>\>//g<Left><Left>
:nnoremap <Leader>sg :%s/\<<C-r><C-w>\>//g<Left><Left>
" :vnoremap <Leader>sk :s/\<<C-r><C-w>\>/\=KeepCase( submatch(0), '')/gi<Left><Left><Left><Left><Left>
" :nnoremap <Leader>sk :%s/\<<C-r><C-w>\>/\=KeepCase( submatch(0), '')/gi<Left><Left><Left><Left><Left>

" Tabularize the lines based on given characters
:nnoremap <Leader>t :Tabularize /
:vnoremap <Leader>t :Tabularize /

" New perl files should start with header filled out
au BufNewFile *.pl s-^-#!/usr/bin/perl\r\ruse strict;\ruse warnings;\r\r-

" Makes switching windows easier from the home row keys
:nmap <Leader>w <C-w>
"
"nnoremap <Leader>w :<c-u>call MultiCursorManual()<cr>
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Press <leader>x to pretty format xml
:nnoremap <silent> <Leader>x :%s/></>\r</g<CR>:set ft=xml<CR>gg=G:let @/=""<CR>

if has('gui_running')
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h14
    ca tn tabnew
    set mouse=ra
    " Alt - left click to use block visual mode
    nmap <A-LeftMouse> <LeftMouse><C-V>
    vmap <A-LeftDrag> <LeftDrag>
    imap <A-LeftMouse> <LeftMouse><C-O><C-V>
    vmap <A-LeftMouse> <Esc><LeftMouse><C-V>
    set transparency=10
    set guioptions=egmrt
endif

" Set default colorscheme
colorscheme wombat

if has("win16") || has("win32") || has("win64")

   "On windows, if called from cygwin or msys, the shell needs to be changed
   "to cmd.exe to work with certain plugins that expect cmd.exe on windows versions
   "of vim.
   if &shell=~#'bash$' || &shell=~#'zsh$'
      set shell=$COMSPEC " sets shell to correct path for cmd.exe
   " else
   "    :cd C:\Users\trprin\Documents\
   endif

   set guifont=Ubuntu_Mono:h12:cANSI
   ca tn tabnew

   set mouse=ra

   " Alt - left click to use block visual mode
   nmap <A-LeftMouse> <LeftMouse><C-V>
   vmap <A-LeftDrag> <LeftDrag>
   imap <A-LeftMouse> <LeftMouse><C-O><C-V>
   vmap <A-LeftMouse> <Esc><LeftMouse><C-V>

   " set fileformat=unix
   " set fileformats=unix,dos
   " :nnoremap <Leader>du :%s///g
   set rtp+=~/.vim/
   " Not necessary, but I like to cleanup &rtp to use \ instead of /
   " when on windows machines
   " let &rtp=substitute(&rtp,"[/]","\\","g")
   " set completeopt-=preview
   " set guioptions-=m
   " set guioptions-=T
   " set sw=2
   " set ts=2
endif

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_include_dirs = ['libopencm3/include']
let g:syntastic_c_compiler_options = '-DSTM32F0'


if has('gui_running')
    " Fix the annoying double ESC issue with powerline
    " https://powerline.readthedocs.org/en/latest/tipstricks.html
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_min_num_of_chars_for_completion = 1
" let g:ycm_auto_trigger = 1
" let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0
