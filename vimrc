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

" Always switch to the current file directory.. Messes with some plugins, best left commented out
" set autochdir

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

" Set 7 lines to the curors - when moving vertical..
set so=7

" Turn on WiLd menu
set wildmenu
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif " binary images
set wildignore+=*.luac " Lua byte code
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.pyc " Python byte code
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files

" Always show current position
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

" highlight current line
set cursorline

" highlight bg color of current line
hi cursorline guibg=#333333

" highlight cursor
hi CursorColumn guibg=#333333


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
try
    lang en_US
catch
endtry

" Default file types
set ffs=unix,dos,mac


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
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

" Visually indicates tab \t.:w
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Switch-off displaying tab \t
" autocmd filetype html,xml set listchars-=tab:>.

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" From an idea by Michael Naumann
function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bash like keys for the command line
cnoremap <C-A>          <Home>
cnoremap <C-E>          <End>
cnoremap <C-K>          <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

func! Cwd()
  let cwd = getcwd()
  return "e " . cwd
endfunc

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
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <S-Tab> :tabprevious<cr>
map <Tab> :tabnext<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i
" inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0
map 0 ^

" Strip all spaces at the end of the lines.
" TODO: This moves the mouse cursor from the last edited position. Fix IT!
autocmd BufWritePre * :%s/\s\+$//e

set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>bb :cd ..<cr>

" Open NERDTree with this shortcut
nmap <silent> <c-n> :NERDTreeToggle<CR>

nmap <leader>k :NERDTreeFromBookmark<space>
nmap <leader>n :NERDTreeFind<CR>

ab @@ Ifthikhan Nazeem <iftecan2000@gmail.com>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tlist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F4> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1     " exit if taglist is last window open
let Tlist_Show_One_File = 1       " Only show tags for current buffer
let Tlist_Enable_Fold_Column = 0  " no fold column (only showing one file)
let tlist_sql_settings = 'sql;P:package;t:table'
let tlist_ant_settings = 'ant;p:Project;r:Property;t:Target'

" a http://www.zalas.eu/getting-a-class-and-method-overview-in-vim-with-the-taglist-plugin
" set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
let Tlist_Use_Horiz_Window=0
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Process_File_Always = 1

" Set tag filename(s)
set tags=./tags,tags

" Adding ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

augroup omnicomplete_hooks
    autocmd!
    autocmd FileType python :set omnifunc=pythoncomplete#Complete
    " autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS  " Clashes with vim-nodejs-complete plugin.
    autocmd FileType html :set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType css :set omnifunc=csscomplete#CompleteCSS
    autocmd FileType xml :set omnifunc=xmlcomplete#CompleteTags
    autocmd FileType php :set omnifunc=phpcomplete#CompletePHP
    autocmd FileType c :set omnifunc=ccomplete#Complete
augroup END

" Search the word under the cursor. The command <C-R><C-W> prints the word
" under the cursor in command mode.
nmap <leader>a :Ack! <C-R><C-W>
nmap <leader>g :grep! -REn <C-R><C-W>


" Open vimrc in a split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Converts a word from lowercase to uppercase. How to use Ctrl-Shift-u for "W"?
imap <C-u> <Esc>vwUi
nmap <C-u> vwU

nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" Wrapes a "selection with double" quotes
vnoremap <leader>" xi"<esc>pa"<esc>
vnoremap <leader>' xi'<esc>pa'<esc>

" Enter normal mode from insert mode.
" inoremap jk <esc>
" inoremap <esc> <nop>

nnoremap <F3> :NumbersToggle<CR>

nnoremap <leader>o :!gedit %<CR>


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

" Prefilled search for class and functions in Python
augroup search_hooks
    autocmd!
    autocmd FileType python nnoremap f/ /def<space>
    autocmd FileType python nnoremap c/ /class<space>
    autocmd FileType python nnoremap f? ?def<space>
    autocmd FileType python nnoremap c? ?class<space>
augroup END

" Easily indent code blocks by keeping them highlighted. Usually after the
" first indent the highlight is removed.
vnoremap < <gv
vnoremap > >gv

" Draws a line on the 80th column
set tw=79
set colorcolumn=80

" Shortcut for saving
noremap <leader>w :w<CR>

" Shortcut for quitting
noremap <leader>q :q<CR>

" Toggle between to the last and current buffer.
noremap <Backspace> :b#<CR>

" PHP-QA plugin settings
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
