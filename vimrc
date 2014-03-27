" This vim file was originally based on Bram Moolenaar's
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

  " Use Vim settings, rather than Vi settings (much better!).
  " This must be first, because it changes other options as a side effect.
set nocompatible

  " allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup        " keep a backup file
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set dir=/a/good/place/to/save/temp/files/

  " Don't use Ex mode, use Q for formatting
map Q gq

  " CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
  " so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

  " In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

  " Switch syntax highlighting on, when the terminal has colors
  " Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

  " Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters. - not a big fan of
  " this feature...
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

  "load the actionscript and mxml syntax files
autocmd BufRead *.as set filetype=actionscript 
autocmd BufRead *.mxml set filetype=mxml 
syntax on

  "show tabs and line breaks
set list

  "turn line numbers on
set number

  "set tab to be 4 spaces
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

  "show current line by highlighting or underlining it
set cursorline

  "set the font
set gfn=Monaco:h14

  "set the colorscheme
set background=dark 
colorscheme solarized

  "map some keys to quickly switch windows
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-k> <c-w>k
map <c-j> <c-w>j

  "map some keys to quickly change the size of split windows
map <silent> == :wincmd =<CR>
map <silent> -- :vertical resize 10<CR>
map <silent> ++ :vertical resize 200<CR>
map <silent> '1 :vertical resize 20<CR>
map <silent> '2 :vertical resize 75<CR>
map <silent> '3 :vertical resize 120<CR>

  "map a quick key to trigger emmet plugin
imap `y <c-y>,


  "some handy markdown mappings
map <silent> `- :call UnderlineCurrentLineWithDash()<CR>
map <silent> `= :call UnderlineCurrentLineWithEquals()<CR>

  "other hand mappings
map <silent> `cd :call ChangeCurrentWorkingFolderToActivePageFold()<CR>
map <silent> `cc :call RemoveMultiLineIfBraces()<CR>

function RemoveMultiLineIfBraces()
    normal 0dwi<80>kb ^[
endfunction

function ChangeCurrentWorkingFolderToActivePageFold()
    cd %:p:h
endfunction

function UnderlineCurrentLineWithEquals()
    normal yypv$r=^[
endfunction

function UnderlineCurrentLineWithDash()
    normal yypv$r-^[
endfunction

function CheckOffToDoItem()
    normal 0f[lrX'
endfunction

  "pathogen plugins (~/.vim/bundle)
  " kchmck/vim-coffee-script
  " mintplant/vim-literate-coffeescript
  " tpope/vim-markdown
  " tpope/vim-surround
  " mattn/emmet-vim/
   
  "init the pathogen plug-ins
execute pathogen#infect()

  "other plugin that I like to use
  " Drawit - http://www.vim.org/scripts/script.php?script_id=40
  " lusty juggler and lusty explorer - https://github.com/sjbach/lusty

