" Ifthikhan Nazeem's ~/.vimrc
" For more details see: https://github.com/ifthikhan/vimmy


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Consider the rest of this script to be utf8
scriptencoding utf-8

" ??
set encoding=utf8

" No backwards compatibility with vi. This must be the first line.
set nocompatible

" An interesting feature to embed vim settings in the file to be edited.
" set nomodeline

" Remove ALL autocommands for the current group. When the .vimrc file is
" sourced twice, the autocommands will appear twice.  To avoid this, put this
" command in your .vimrc file, before defining autocommands: Also include it
" within augroup
autocmd!

" Function to return the system type
function! MySys()
    let g:my_platform = "unknown"
    if has("unix")
        let g:my_platform = substitute(system('uname -s'), "\n", "", "")
    return g:my_platform
endfunction

" Set the current local
try
    lang en_US
catch
endtry

" Setup Bundle Support. The next two lines ensure that the ~/.vim/bundle/
" system works
runtime! autoload/pathogen.vim
call pathogen#infect()
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EOL formats to try.
set ffs=unix,dos,mac

" Character encoding and do not set BOM
set encoding=utf8 nobomb

" Automatically detect file types. Place this line above the pathogen bundle
" loading if snipmate does not work.
filetype plugin indent on

" When vimrc is edited, reload it.
augroup myvimrchooks
    autocmd!
    autocmd bufwritepost .vimrc :source ~/.vimrc
augroup END

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations like <leader>w
" saves the current file.
let mapleader = ","
let g:mapleader = ","

" Will automatically reflect the buffer which you are working on.
set title

" Enable mouse. Use <Shift> and mouse to make selection to copy to clipboard.
set mouse=a

" Enable the mouse while running within GNU Screen
set ttymouse=xterm2

" Remember past commands
set history=700

" Display numbers
set number

" Turn on Wild menu
set wildmenu
set wildignore+=*.jpg,*.gif
set wildignore+=*.o,*.obj,*.manifest,*.pyc,*.sw?

" Show line and column position
set ruler

" Show incomplete commands
set showcmd

" Hide buffers
set hid

" Set to auto read when a file is changed from the outside
set autoread

" Differ redrawing file
set lazyredraw

"" Draw fast
set ttyfast

" Set magic on, for regular expression, special characters that can be used in
" search patterns
" .     - Requires a backslash to be interpreted literally.
" <>    - Requires backslashes to be interpreted as regex special chars.
set magic

" How many tenths of a second to blink
set mat=2

" No sound on errors ??
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set font ??
set gfn=Monospace\ 13

try
    " Possible alternatives are: peaksea, mayansmoke, pyte, ir_black
    colorscheme ir_black
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme zellner
endtry

" Setting this to a value will force vim to switch colorschemes automagically.
" set background=dark

" Bash like keys for the command line
cnoremap <C-A>   <Home>
cnoremap <C-E>   <End>
cnoremap <C-K>   <C-U>
cnoremap <C-P>   <Up>
cnoremap <C-N>   <Down>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

" Always show the statusline
set laststatus=2

" Returns the path of the home dir
function! GetHomeDir()
    return system('echo -n $HOME')
endfunction

function! CurDir()
    let curdir = substitute(getcwd(), GetHomeDir(), "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" Format the statusline. Currently replaced by
" https://github.com/itchyny/lightline.vim
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\
            "\ %l/%L:%c

set guitablabel=%t

" Toggle NERDTree
nmap <silent> <c-n> :NERDTreeToggle<CR>

" Ignore python code files.
let NERDTreeIgnore = ['\.pyc$']

" Don't display line numbers in NERDTree buffer
let NERDTreeShowLineNumbers = 0

" Root directory identifier
let g:ctrlp_root_markers = ['root.dir']

" Ignore dot files and dirs.
let g:ctrlp_dotfiles = 0

" Follow symbolic links
let g:ctrlp_follow_symlinks = 1

" Set the default search mode to be regex
let g:ctrlp_regexp = 1

" When opening a file with <cr> or <c-t>, if the file's already opened somewhere
" CtrlP will try to jump to it instead of opening a new instance, this is the
" default behavior. This behavior has been disabled.
let g:ctrlp_switch_buffer = 0

" Toggle tag list
nnoremap <silent> <F5> :TlistToggle<CR>

" Exit if taglist is last window open
let Tlist_Exit_OnlyWindow = 1

" Only show tags for current buffer
let Tlist_Show_One_File = 1

" Align the taglist window onto right.
let Tlist_Use_Right_Window = 1

" Search the word under the cursor. The command <C-R><C-W> prints the word
" under the cursor in command mode.
nmap <leader>a :Ack! <C-R><C-W>

nmap <leader>g :grep! -REn <C-R><C-W>

" Set tag filename(s)
set tags=./tags,tags

" Adding ack
let g:ackprg="ack -H --nocolor --nogroup --column"

" Highlight the search term in the open buffers
let g:ackhighlight=1

" Open the a window for preview when navigating with j or k
let g:ackpreview=1

" Function to toggle between regular and relative numbering
function! ToggleLineNumbers()
    if !exists("w:toggle_line_numbers")
        let w:toggle_line_numbers = 1
    endif

    if &number == 0
        set number
    else
        if w:toggle_line_numbers == 1
            set relativenumber
            let w:toggle_line_numbers = 0
        else
            set norelativenumber
            set number
            let w:toggle_line_numbers = 1
        endif
    endif
endfunction

" Disable all forms of numbering
function! DisableLineNumbers()
    if exists("w:toggle_line_numbers")
        unlet w:toggle_line_numbers
    endif
    set nonumber
    set norelativenumber
endfunction

nnoremap <silent> <F3> :call ToggleLineNumbers()<CR>
nnoremap <silent> <F4> :call DisableLineNumbers()<CR>

" Insert section headers for vimrc
function! VimSectionComment()
    function! IsEmptyLine(line)
        " Single quotes eliminates double escaping of backslashes
        if a:line =~ '^\s*$'
            return 1
        else
            return 0
    endfunction

    let cur_line = getline(".")
    let cur_line = IsEmptyLine(cur_line) ? "..." : cur_line

    if cur_line !~ '^"'
        let cur_line = "\" " . cur_line
    endif

    call setline(".", cur_line)

    " \e in the below expression is to denote an escape character.
    "See :h expr-string
    " TODO: Manage indentation levels based on the current line
    execute("normal O\e78i\"\ejo\e78i\"\e")
    execute('normal k0')

    " Add two empty lines above.
    let lineno = line(".")
    let [line1, line2] = getline(lineno - 3, lineno - 2)
    if !IsEmptyLine(line2)
        call cursor(lineno - 1, 1)
        execute("normal O\e\O")
        call cursor(lineno + 2, 3)
    elseif !IsEmptyLine(line1) && IsEmptyLine(line2)
        call cursor(lineno - 1, 1)
        execute("normal O\e")
        call cursor(lineno + 1, 3)
    endif

    " Add an empty line below.
    let lineno = line(".")
    let lineb = getline(lineno + 2)
    if !IsEmptyLine(lineb)
        call cursor(lineno + 1, 1)
        execute("normal o\e")
        call cursor(lineno, 3)
    endif
endfunction

nnoremap <silent> <leader>v :call VimSectionComment()<CR>

" Search the word under cursor in vim help files
function! SearchWordUnderCursorInVimHelp()
    let word_under_cursor = expand("<cword>")
    if !empty(word_under_cursor)
        execute("h " . word_under_cursor)
    else
        echo "No word under the cursor"
    endif
endfunction

nnoremap <silent> <leader>h :call SearchWordUnderCursorInVimHelp()<CR>

" Disable default working path mode
let g:ctrlp_working_path_mode = 0

" Useful when reading tabular data or long files with header
function! FixHeader()
    execute("normal ma gg yy")
    let w:heading_buffer_name = "__header__"
    new `=w:heading_buffer_name`
    resize 1
    setlocal buftype=nowrite
    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nobuflisted
    setlocal tw=0
    setlocal colorcolumn=0
    exec "normal P"
    " Jump back to the previous window and the correct position
    exec  bufwinnr(bufname("#")) . " wincmd w"
    exec "normal 'a"
    au BufWinLeave <buffer> call CloseFixedHeaderWin()
endfunction

function! CloseFixedHeaderWin()
    exec bufwinnr(bufname(w:heading_buffer_name)) . " wincmd w"
    exec "q"
endfunction

command! -nargs=0 FixHeader : call FixHeader()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Editing, Formatting and Snippets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cursor key move the cursor to the next/previous line if pressed at the
" end/beginning of a line ??
set whichwrap+=<,>,h,l

" Set backspace config
set backspace=eol,start,indent

" Show matching bracets when text indicator is over them
set showmatch

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

set softtabstop=4

" automatically inserts one extra level of indentation in structured files
" such as the source files.
" set smartindent Disabled for now

" Affects how <TAB> key presses are interpreted depending on where the cursor "
" is. If 'smarttab' is on, a <TAB> key inserts indentation according to "
" 'shiftwidth' at the beginning of the line, whereas 'tabstop' and 'softtabstop'
" are used " elsewhere. There is seldom any need to set this option, unless it is
" necessary " to use hard TAB characters in body text or code.
" set smarttab " Lines longer than the width of the window will wrap.

set wrap

" Wrap lines at a character in the breakat variable.
set lbr

" Sets the maximum line length. Lines exceeding this length will be broken to a
" newline
set tw=79

" Draws a line at the nth column. Multiple column. Makes redraw slower. When
" preceded by a + or - the number given is added to the value of tw.
" TODO: It's better to highlight text after tw instead of drawing this column.
set colorcolumn=+1

" Don't apply colorcolumn to help or readonly files.
" @TODO: This might be a good fit for "Filetypes section
function! CanApplyColorColumn()
    if &ft == "help" || &readonly == 1
        setlocal colorcolumn=0
    endif
endfunction
autocmd BufReadPre * :call CanApplyColorColumn()

" Add this option to ensure that if <CR> is pressed in "INSERT" mode and if
" within a comments block the comment character is added to the new line as
" well.
set formatoptions+=r

" Visually indicates unprintable characters. The character to be displayed
" are customised with the listchars.
set list

" Customise how and which unprintable characters are denoted and printed.
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Remap VIM 0
nnoremap 0 ^

" Strips the trailing spaces
function! StripTrailingSpaces()
    if !&binary && &modifiable && &filetype != 'diff'
        exe "normal ma"
        %s/\s\+$//e
        exe "normal `a"
    endif
endfunction

function! ToggleStripTrailingSpaces()
    if !exists('g:ifrc_strip_trail_spaces') || g:ifrc_strip_trail_spaces == 0
        let g:ifrc_strip_trail_spaces = 1
    else
        let g:ifrc_strip_trail_spaces = 0
    endif
endfunction

function! ThouShaltTryStrippingIt()
    if exists('g:ifrc_strip_trail_spaces') && g:ifrc_strip_trail_spaces == 1
        call StripTrailingSpaces()
    endif
endfunction

" Strip all spaces at the end of the lines.
autocmd BufWritePre * call ThouShaltTryStrippingIt()

" Convert lowercase word under the cursor to uppercase
noremap <c-u> viwU<CR>

" Open the current buffer in gedit
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy & Paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle paste mode with F2
set pastetoggle=<F2>

" Always exit paste mode when leaving insert mode
au InsertLeave * set nopaste


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and Highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlighting
syntax on

"Ignore case when searching
set ignorecase

" Ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase

" Highlight search string
set hlsearch

" Show search matches as you type
set incsearch

" Highlight current line
set cursorline

" Highlight bg color of current line. The defaults for this theme is adequate.
"hi CursorLine   cterm=underline ctermbg=None ctermfg=None guibg=None guifg=None

" Highlight cursor. The defaults for the theme is adequate.
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred
            "\ guifg=white

" Highlight line number
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE
                "\ guifg=DarkGrey guibg=NONE

" Use these directive if the Pmenu color gets messed up
hi Pmenu ctermfg=0 ctermbg=6 guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff

map <silent> <leader><space> :noh<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backups & Undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git or hg anyway...
set nobackup

" ??
set nowb

" Disable vim's famous swap file :)
set noswapfile

"Persistent undo
set undofile
set undodir=~/.vim_undodir


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add a file named ~/.vimrcx in the home directory to override vimrc settings
" specific to the current host
let g:if_extended_vimrc = GetHomeDir() . '/.vimrcx'
if filereadable(g:if_extended_vimrc)
    so `=g:if_extended_vimrc`
endif

let g:SuperTabDefaultCompletionType = "context"
