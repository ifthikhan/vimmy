"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No backwards compatibility with vi. This must be the first line.
set nocompatible

" Automatically detect file types. Place this line above the pathogen bundle loading.
" If not snipmate does not work.
filetype plugin indent on

" Syntax highlighting
syntax on

" Will automatically reflect the buffer which you are working on.
set title

" Remove ALL autocommands for the current group.
" When your .vimrc file is sourced twice, the autocommands will appear twice.
" To avoid this, put this command in your .vimrc file, before defining
" autocommands: Also include it within augroup
autocmd!

" Function to return the system type
function! MySys()
    return "linux"
endfunction


" Setup Bundle Support. The next two lines ensure that the ~/.vim/bundle/ system works
runtime! autoload/pathogen.vim
call pathogen#infect()
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()


" Enable mouse. Use <shift> and mouse to make selection to copy to the clipboard.
set mouse=a
" Enable the mouse while running within GNU Screen
set ttymouse=xterm2

" Set to auto read when a file is changed from the outside
set autoread

" Wth a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" When vimrc is edited, reload it.
augroup myvimrchooks
    autocmd!
    autocmd bufwritepost .vimrc :source ~/.vimrc
augroup END


scriptencoding utf-8

" Sets how many lines of history VIM has to remember
set history=700

" Don't grep through svn-base files
set grepprg=grep\ --exclude='*.svn-base'\ -n\ $*\ /dev/null

" Display numbers
set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on WiLd menu
set wildmenu
set wildignore+=*.jpg,*.bmp,*.gif " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.sw? " Vim swap files

" Always show current position, total line count and column number
set ruler

" The commandbar height
set cmdheight=2

" Change buffer - without saving
set hid

" Set backspace config
set backspace=eol,start,indent

" Cursor key move the cursor to the next/previous line if pressed at the end/beginning of a line
set whichwrap+=<,>,h,l

"Ignore case when searching
set ignorecase

" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Highlight search things
set hlsearch

" Show search matches as you type
set incsearch

" Don't redraw while executing macros
set nolazyredraw

" Set magic on, for regular expression, special characters that can be used in search patterns
" .     - Requires a backslash to be interpreted literally.
" <>    - Requires backslashes to be interpreted as regex special chars.
set magic

" Show matching bracets when text indicator is over them
set showmatch

" How many tenths of a second to blink
set mat=2

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enable syntax hl.
syntax enable

" Set font according
set gfn=Monospace\ 10
set shell=/bin/bash

colorscheme zellner
set background=dark

set encoding=utf8

" Set the current local
try
    lang en_US
catch
endtry

" EOL formats to try.
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor Styles. (Should always be defined under themes)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight current line
set cursorline

" Highlight bg color of current line
hi CursorLine   cterm=underline ctermbg=Black ctermfg=None guibg=None guifg=None

" highlight cursor
hi CursorColumn     cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git or hg anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    set undodir=~/.vim_undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" See for a decent explanation of the indent and TAB settings
" http://vim.wikia.com/wiki/Indenting_source_code
" http://tedlogan.com/techblog3.html

" Changes the width of the TAB character.
set tabstop=4

" Use the appropriate number of spaces to insert tabs.
" Will insert 'softtabstop' amount of space characters. Otherwise, the
" amount of spaces inserted is minimized by using TAB characters.
set expandtab

" Copy the indentation from the previous line, when starting a new line
set autoindent

" Number of spaces for each auto-indent step. Also it affects what happens when
" you press >>, << or ==.
set shiftwidth=4

" automatically inserts one extra level of indentation in structured files
" such as the source files.
" set smartindent Disabled for now

" Affects how <TAB> key presses are interpreted depending on where the cursor is.
" If 'smarttab' is on, a <TAB> key inserts indentation according to 'shiftwidth'
" at the beginning of the line, whereas 'tabstop' and 'softtabstop' are used
" elsewhere. There is seldom any need to set this option, unless it is necessary
" to use hard TAB characters in body text or code.
" set smarttab

" Lines longer than the width of the window will wrap.
set wrap

" Wrap lines at a character in the breakat variable.
set lbr

" Draws a line on the 80th column
set tw=79

set colorcolumn=80

" Visually indicates unprintable characters. The character to be displayed
" are customised with the listchars.
set list

" Customise how and which unprintable characters are denoted and printed.
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Aids when pasting text from clipboard. Press f2 to toggle when in insert mode
set pastetoggle=<F2>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bash like keys for the command line
cnoremap <C-A>          <Home>
cnoremap <C-E>          <End>
cnoremap <C-K>          <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map leader enter to unhighlight search
map <silent> <leader>/ :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
" map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn  :tabnew<cr>
map <leader>te  :tabedit
map <leader>tc  :tabclose<cr>
map <leader>tm  :tabmove
map <S-Tab>     :tabprevious<cr>
map <Tab>       :tabnext<cr>


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""

" Always hide the statusline
set laststatus=2

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction


" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0
map 0 ^

" Strip all spaces at the end of the lines.
" TODO: This moves the mouse cursor from the last edited position. Fix IT!
" Ideally it should be toggled.
autocmd BufWritePre * :%s/\s\+$//e

set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTRee customisations.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <silent> <c-n> :NERDTreeToggle<CR>

nmap <leader>k :NERDTreeFromBookmark<space>

nmap <leader>n :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$']

" Hide line numbers in NERDTree buffer
let NERDTreeShowLineNumbers = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P related config settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Root directory identifier
let g:ctrlp_root_markers = ['root.dir']

" Ignore dot files and dirs.
let g:ctrlp_dotfiles = 0

" Follow symbolic links
let g:ctrlp_follow_symlinks = 1

" Set the default search mode to be regex
let g:ctrlp_regexp = 1
"
" When opening a file with <cr> or <c-t>, if the file's already opened somewhere
" CtrlP will try to jump to it instead of opening a new instance, this is the default
" behavior. This behavior has been disabled.
let g:ctrlp_switch_buffer = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PHP-QA related config settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tlist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <F4> :TlistToggle<CR>

let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open

let Tlist_Show_One_File = 1       " Only show tags for current buffer

let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)

let tlist_sql_settings = 'sql;P:package;t:table'

let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'

let Tlist_Use_Horiz_Window=0

let Tlist_Use_Right_Window = 1

let Tlist_Compact_Format = 1

let Tlist_GainFocus_On_ToggleOpen = 1

let Tlist_File_Fold_Auto_Close = 1

let Tlist_Inc_Winwidth = 0

let Tlist_Process_File_Always = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Search the word under the cursor. The command <C-R><C-W> prints the word
" under the cursor in command mode.
nmap <leader>a :Ack! <C-R><C-W>

nmap <leader>g :grep! -REn <C-R><C-W>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set tag filename(s)
set tags=./tags,tags

" Adding ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

augroup omnicomplete_hooks
    autocmd!
    autocmd FileType python     :set omnifunc=pythoncomplete#Complete
    autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType html       :set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css        :set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml        :set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php        :set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c          :set omnifunc=ccomplete#Complete
augroup END

nnoremap <F3> :NumbersToggle<CR>

nnoremap <leader>o :!gedit %<CR>

" Easily indent code blocks by keeping them highlighted. Usually after the
" first indent the highlight is removed.
vnoremap < <gv
vnoremap > >gv

" Shortcut for saving
noremap <leader>w :w<CR>

" Shortcut for quitting
noremap <leader>q :q<CR>

" Toggle between to the last and current buffer.
noremap <Backspace> :b#<CR>

" Pydiction dictionary
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
