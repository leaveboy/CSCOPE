"=============================================================================
"     FileName: .vimrc
"         Desc: vimrc
"       Author: Lee Meng
"        Email: leemeng0x61@gmail.com
"     HomePage: http://leaveboy.github.io/
"      Version: 0.0.1
"   LastChange: 2013-05-26 21:32:04
"      History:
"=============================================================================
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
" 以下设置必须写在set term=XX后面
set term=xterm
set <xF1>=^[OP
set <xF2>=^[OQ
set <xF3>=^[OR
set <xF4>=^[OS
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'hallison/vim-markdown'
Bundle 'Lokaltog/vim-powerline'
" vim-scripts repos
Bundle 'taglist.vim'
Bundle 'vimwiki'
Bundle 'ag.vim'
Bundle 'The-NERD-Commenter'
Bundle 'SuperTab-continued.'
Bundle 'AuthorInfo'
Bundle 'checksyntax-B'
Bundle 'Indent-Guides'
Bundle 'xml.vim'
Bundle 'Mark'
Bundle 'The-NERD-tree'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

function! MySys()
return "win32"
endfunction
"Set shell to be zsh
if MySys() == "linux" || MySys() == "mac"
"set shell=bash
set shell=zsh
else
"I have to run win32 python without cygwin
"set shell=E:\cygwin\bin\sh
endif

"Sets how many lines of history VIM har to remember
set history=400

"Enable filetype plugin
if has("eval")
filetype indent on
filetype plugin on " enable plugin
filetype plugin indent on
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
let g:indent_guides_auto_colors = 1
endif

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a
set t_Co=256
"Set mapleader
let mapleader = ","
let g:mapleader = ","

"Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Font
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax hl
"execute pathogen#infect()
syntax enable
syntax on

"Set font to Monaco 10pt
"if MySys() == "mac"
" set gfn=Bitstream Vera Sans Mono:h14
" set nomacatsui
" set termencoding=macroman
"elseif MySys() == "linux"
" set gfn=Monospace 11
" "set encoding=utf-8
"endif

"internationalization
"I only work in Win2k Chinese version
if has("multi_byte")
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
endif

"if you use vim in tty,
"'uxterm -cjk' or putty with option 'Treat CJK ambiguous characters as wide' on
if has("ambiwidth")
set ambiwidth=double
endif

if has("gui_running")
"set guioptions-=m
"set guioptions-=T
set guioptions-=l
set guioptions-=L
"set guioptions-=r
set guioptions-=R

if MySys()=="win32"
"start gvim maximized
"if has("autocmd")
"au GUIEnter * simalt ~x
"endif
endif
"let psc_style='cool'
"colorscheme ps_color
"colorscheme default
else
"set background=dark
"colorscheme torte 
endif

"Some nice mapping to switch syntax (useful if one mixes different languages in one file)
map <leader>1 :set syntax=cheetah<cr>
map <leader>2 :set syntax=xhtml<cr>
map <leader>3 :set syntax=python<cr>
map <leader>4 :set ft=javascript<cr>
map <leader>$ :syntax sync fromstart<cr>

"Highlight current
if has("gui_running")
if has("cursorline")
"set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333
endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetype
set ffs=unix,dos,mac

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu

"Always show current position
set ruler

"The commandbar is 2 high
set cmdheight=1

"Show line number
set nu

"Do not redraw, when running macros.. lazyredraw
set lz

"Change buffer - without saving
set hid

"set current curline
set cursorline

"Set backspace
set backspace=eol,start,indent

"Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

"Ignore case when searching
"set ignorecase
set incsearch

"Set magic on
set magic

"No sound on errors.
set noerrorbells
set novisualbell
set t_vb=

"show matching bracet
set showmatch

"How many tenths of a second to blink
set mat=4

"Highlight search thing
set hlsearch

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
let curdir = substitute(getcwd(), '/home/lm', "~/", "g")
return curdir
endfunction

"Format the statusline
set statusline=
"set statusline+=%f "path to the file in the buffer, relative to current directory
"set statusline+=\ %h%1*%m%r%w%0* " flag
"set statusline+=\ [%{strlen(&ft)?&ft:'none'}, " filetype
"set statusline+=%{&encoding}, " encoding
"set statusline+=%{&fileformat}] " file format
"set statusline+=\ CWD:%r%{CurDir()}%h
"set statusline+=\ Line:%l/%L
"set statusline+=\ Line:%l/%L\ Column:%c\ %p%%
set statusline=%F%m%r%h%w\ %=#%n\ [%{&fileformat}:%{(&fenc==\"\"?&enc:&fenc).((exists(\"\+bomb\")\ &&\ &bomb)?\"\+B\":\"\").\"\"}:%{strlen(&ft)?&ft:'**'}]\ [%L\\%l,%c]\ %p%%
set rulerformat=%44(%=%m%r%h%w#%n\ [%{&fileformat}:%{(&fenc==\"\"?&enc:&fenc).((exists(\"\+bomb\")\ &&\ &bomb)?\"\+B\":\"\").\"\"}:%{strlen(&ft)?&ft:'**'}]\ [%L\\%l,%c]\ %p%%%)
set ruler

""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
" From an idea by Michael Naumann
function! VisualSearch(direction) range
let l:saved_reg = @"
execute "normal! vgvy"
let l:pattern = escape(@", '\/.*$^~[]')
let l:pattern = substitute(l:pattern, " $", "", "")
if a:direction == 'b'
execute "normal ?" . l:pattern . "^M"
else
execute "normal /" . l:pattern . "^M"
endif
let @/ = l:pattern
let @" = l:saved_reg
endfunction

"Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map space to / and c-space to ?
map <space> /
"map <c-space> ?

"Smart way to move btw. window
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"Actually, the tab does not switch buffers, but my arrow
"Bclose function ca be found in "Buffer related" section
"map <leader>bd :Bclose<cr>
"map <down> <leader>bd
"Use the arrows to something usefull
"map <right> :bn<cr>
"map <left> :bp<cr>

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
if has("usetab")
set switchbuf=usetab
endif

if has("stal")
set stal=2
endif

"Moving fast to front, back and 2 sides ;)
imap <m-$> <esc>$a
imap <m-0> <esc>0i
imap <D-$> <esc>$a
imap <D-0> <esc>0i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Switch to current dir
map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
"http://www.vim.org/tips/tip.php?tip_id=153
"
ino ( ()<esc>:let leavechar=")"<cr>i
ino { {}<esc>:let leavechar="}"<cr>i
ino $q ''<esc>:let leavechar="'"<cr>i
ino $w ""<esc>:let leavechar='"'<cr>i
imap <c-l> <esc>:exec "normal f" . leavechar<cr>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrev
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Comment for C like language
if has("autocmd")
au BufNewFile,BufRead *.js,*.htc,*.c,*.tmpl,*.css ino $c /**<cr> **/<esc>O
endif

"My information
let g:vimrc_author='Lee Meng'
let g:vimrc_email='leemeng0x61@gmail.com'
let g:vimrc_homepage='http://leaveboy.github.io/' 
nmap <F8> :AuthorInfoDetect<cr> 
iab xname <c-r> qicheng.meng<c-i>
iab xdate <c-r>=strftime("%c")<c-i>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using control
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! Cwd()
let cwd = getcwd()
return "e " . cwd
endfunc

func! DeleteTillSlash()
let g:cmd = getcmdline()
if MySys() == "linux" || MySys() == "mac"
let g:cmd_edited = substitute(g:cmd, "\(.*[/]\).*", "\1", "")
else
let g:cmd_edited = substitute(g:cmd, "\(.*[\\]\).*", "\1", "")
endif
if g:cmd == g:cmd_edited
if MySys() == "linux" || MySys() == "mac"
let g:cmd_edited = substitute(g:cmd, "\(.*[/]\).*/", "\1", "")
else
let g:cmd_edited = substitute(g:cmd, "\(.*[\\]\).*[\\]", "\1", "")
endif
endif
return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
return a:cmd . " " . expand("%:p:h") . "/"
endfunc

"cno $q <C->eDeleteTillSlash()<cr>
"cno $c e <C->eCurrentFileDir("e")<cr>
"cno $tc <C->eCurrentFileDir("tabnew")<cr>
cno $th tabnew ~/
cno $td tabnew ~/Desktop/

"Bash like
cno <C-A> <Home>
cno <C-E> <End>
cno <C-K> <C-U>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fast open a buffer by search for a name
"map <c-q> :sb

"Open a dummy buffer for paste
map <leader>q :e ~/buffer<cr>

"Restore cursor to file position in previous editing session
set viminfo='10,"100,:20,%,n~/.viminfo

" Buffer - reverse everything ... :)
map <F9> ggVGg

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
buffer #
else
bnext
endif

if bufnr("%") == l:currentBufNum
new
endif

if buflisted(l:currentBufNum)
execute "bdelete! ".l:currentBufNum
endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
"set noswapfile
set noar


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set fen
set fdl=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python script
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=2
set smarttab
set lbr
"set tw=500

""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indenting
set cindent

"Wrap line
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]
map <leader>sp [
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y :YRShow<cr>

""""""""""""""""""""""""""""""
" => File explorer
""""""""""""""""""""""""""""""
"Split vertically
let g:explVertical=1

"Window size
let g:explWinSize=35

let g:explSplitLeft=1
let g:explSplitBelow=1

"Hide some file
let g:explHideFiles='^.,.*.class$,.*.swp$,.*.pyc$,.*.swo$,.DS_Store$'

"Hide the help thing..
let g:explDetailedHelp=0


""""""""""""""""""""""""""""""
" => Minibuffer
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

"WindowZ
map <c-w><c-t> :WMToggle<cr>

let g:bufExplorerSortBy = "name"

"taglist{
let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
let Tlist_Sort_Type = "name"
let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
"let Tlist_Ctags_Cmd='/opt/local/bin/ctags'  "设置ctags命令的位置
map <F3> :Tlist<cr>
"}

"{
let NERDTreeWinPos = "left"
map <F4> :NERDTreeToggle<cr>
"}

map <F6> :r !env LANG=en_US.UTF-8 date<cr>

""""""""""""""""""""""""""""""
" => LaTeX Suite thing
""""""""""""""""""""""""""""""
"set grepprg=grep\ -r\ -s\ -n
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_ViewRule_pdf='xpdf'

if has("autocmd")
"Binding
au BufRead *.tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

"Auto complete some things ;)
au BufRead *.tex ino $i indent
au BufRead *.tex ino $* cdot
au BufRead *.tex ino $i item
au BufRead *.tex ino $m [<cr>]<esc>O
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
au BufRead,BufNew *.vim map <buffer> <leader><space> :w!<cr>:source %<cr>
endif

""""""""""""""""""""""""""""""
" => HTML related
""""""""""""""""""""""""""""""
" HTML entities - used by xml edit plugin
let xml_use_xhtml = 1
"let xml_no_auto_nesting = 1

"To HTML
let html_use_css = 0
let html_number_lines = 0
let use_xhtml = 1

if has("eval") && has("autocmd")
fun! <SID>abbrev_cpp()
iabbrev <buffer> cci const_iterator
iabbrev <buffer> ccl cla
iabbrev <buffer> cco const
iabbrev <buffer> cdb \bug
iabbrev <buffer> cde \throw
iabbrev <buffer> cdf /** \file<CR><CR>/<Up>
iabbrev <buffer> cdg \ingroup
iabbrev <buffer> cdn /** \namespace<CR><CR>/<Up>
iabbrev <buffer> cdp \param
iabbrev <buffer> cdt \test
iabbrev <buffer> cdx /**<CR><CR>/<Up>
iabbrev <buffer> cit iterator
iabbrev <buffer> cns namespace
iabbrev <buffer> cpr protected
iabbrev <buffer> cpu public
iabbrev <buffer> cpv private
iabbrev <buffer> csl std::list
iabbrev <buffer> csm std::map
iabbrev <buffer> css std::string
iabbrev <buffer> csv std::vector
iabbrev <buffer> cty typedef
iabbrev <buffer> cun using namespace
iabbrev <buffer> cvi virtual
iabbrev <buffer> #i #include
iabbrev <buffer> #d #define
endfun

fun! <SID>abbrev_java()
iabbrev <buffer> #i import
iabbrev <buffer> #p System.out.println
iabbrev <buffer> #m public static void main(String[] arg
endfun

fun! <SID>abbrev_python()
iabbrev <buffer> #i import
iabbrev <buffer> #p print
iabbrev <buffer> #m if __name__=="__main":

endfun

augroup abbreviation
autocmd!
autocmd FileType cpp,c :call <SID>abbrev_cpp()
autocmd FileType java :call <SID>abbrev_java()
autocmd FileType python :call <SID>abbrev_python()
augroup END
endif

let wiki = {}
let wiki.path             = '~/document/vimwiki'
let wiki.path_html        = '/var/www/'
"let wiki.template_path    = '~/document/vimwiki/template'
"let wiki.template_ext     = '.html'
"let wiki.template_default = 'default_template'
let wiki.html_header	    = '~/document/vimwiki/template/header.tpl'
let wiki.html_footer      = '~/document/vimwiki/template/footer.tpl'
"let wiki.path_html        = '~/document/vimwiki/html/'
"let wiki.html_header	    = '~/document/vimwiki/template/header.html'
"let wiki.html_footer      = '~/document/vimwiki/template/footer.html'
let wiki.auto_export      = 0
let wiki.css_name         = 'style.css'
let wiki.nested_syntaxes  = {'Clang': 'c', 'C++': 'cpp', 'Lisp': 'lisp', 'Ruby': 'ruby', 'SQL': 'sql', 'Bash': 'sh', 'Vim': 'vim', 'Make': 'make',      'CMake': 'cmake', 'JS': 'javascript', 'CSS': 'css', 'HTML': 'html', 'XML': 'xml'} 

let g:vimwiki_list = [wiki]
let g:vimwiki_camel_case = 0
let g:vimwiki_CJK_length = 1
let g:vimwiki_hl_cb_checked = 1
let tlist_vimwiki_settings = 'wiki;h:Headers'
let g:vimwiki_file_exts = 'c, cpp, wav, txt, h, hpp, zip, sh, awk, ps, pdf'
let g:vimwiki_user_htmls = 'contact.html, canvas-1.html, html.html'
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1,red,center,left,right,h2,h4,h5,h6,pre,script,style'
let g:vimwiki_menu = ''
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M
noremap <Leader>M :%s/\r//g<CR>

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Remove indenting on empty line
map <F2> :%s/s*$//g<cr>:noh<cr>''

"Super paste
ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>
set nocp " non vi compatible mode

"powerline{
"set guifont=Monaco\ for\ Powerline
"set nocompatible
"set t_Co=256
"let g:Powerline_symbols = 'fancy'
"let g:SuperTabDefaultCompletionType = "context"
"let g:syntastic_mode_map = { 'mode': 'passive' }
"}

"ag{
let g:agprg="<custom-ag-path-goes-here> -H --nocolor --nogroup --column"
"}

"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"set completeopt=menu,menuone
" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included file
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

" cscope {
" map <ctrl>+F12 to generate ctags for current folder:
cs add ./cscope.out
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR><CR>
" }
