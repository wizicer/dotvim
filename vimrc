call pathogen#infect()
call pathogen#helptags()
Helptags

"set langmenu=en_US
"let $LANG = 'en_US'
source $VIMRUNTIME/menu.vim
" source $VIMRUNTIME/delmenu.vim
set encoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set nocompatible
set magic
set ru "标尺信息
set ai
set sw=4
set ts=4
set number
set dir=%temp%
filetype plugin on
syntax on
set dy=lastline "显示最多行，不用@@
"以上是缩进相关
set backspace=indent,eol,start
colo evening
sy on
set go=r "无菜单、工具栏
set nobackup
set hlsearch
set showmatch
set ignorecase
set tabstop=2
set expandtab

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently 
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex


"tab mappings
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-t> :tabnew<CR>
map <M-w> :tabclose<CR>
map! <M-1> <esc>1gt
map! <M-2> <esc>2gt
map! <M-3> <esc>3gt
map! <M-4> <esc>4gt
map! <M-5> <esc>5gt
map! <M-6> <esc>6gt
map! <M-7> <esc>7gt
map! <M-8> <esc>8gt
map! <M-9> <esc>9gt
map! <M-t> <esc>:tabnew<CR>
map! <M-w> <esc>:tabclose<CR>
 
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
"2006-09-13 如下：保存视图
        au BufWinLeave *.ztx mkview
        au BufWinEnter *.ztx silent loadview
au BufNewFile,BufRead *.tx1 setf tx1
au BufNewFile,BufRead *.xaml set filetype=xml
    au BufRead,BufNewFile *.atg    setfiletype coco

let g:WindowMaximized = 0
function! MaxRestoreWindow()
  if g:WindowMaximized == 1
    let g:WindowMaximized = 0
    " restore the window
    :simalt ~r
  else
    let g:WindowMaximized = 1
    " maximize the window
    :simalt ~x
  endif
endfunction
map <c-F5> :call MaxRestoreWindow()<CR>

let g:ChineseFont = 1
function! ChangeFont()
  if g:ChineseFont == 1
    let g:ChineseFont = 0
    set guifont=SimHei:h10
  else
    let g:ChineseFont = 1
    set guifont=FixedSys:h8
  endif
endfunction
command Changefont :call ChangeFont()
" map <F5> :call ChangeFont()<CR>

let g:EnableTabCompletion = 1
function! ChangeTabCompletion()
  if g:EnableTabCompletion == 1
    let g:EnableTabCompletion = 0
    imap <Tab> <C-P>
  else
    let g:EnableTabCompletion = 1
    imap <Tab> <Nop>
  endif
endfunction
command TabCompletion :call ChangeTabCompletion()

let g:Tlist_Ctags_Cmd = "\"C:/Program Files/Vim/vimfiles/ctags58/ctags.exe\""

" ######### VimWiki 写作助手 ######### "
 
" 使用鼠标映射
let g:vimwiki_use_mouse = 1
 
" 不要将驼峰式词组作为 Wiki 词条
let g:vimwiki_camel_case = 0

" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
 
let g:vimwiki_hl_headers = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''
 
" 是否开启按语法折叠  会让文件比较慢
" let g:vimwiki_folding = 1
 
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
 
"     \	'cpp': 'c++',
" \	'cs': 'c#',
" Vim file type -> Syntax highlighter language
let g:vimwiki_list[0].nested_syntaxes = {
\	'css': 'css',
\	'pascal': 'pascal',
\	'vb': 'vb',
\	'java': 'java',
\	'javascript': 'javascript',
\	'php': 'php',
\	'sql': 'sql',
\	'python': 'python',
\	'perl': 'perl',
\	'sh': 'sh',
\	'xml': 'xml',
\	'html': 'html',
\	'xhtml': 'xhtml',
\	'xslt': 'xslt',
\	'haskell': 'haskell',
\	'ini': 'ini',
\	'cpp': 'c',
\	'csharp': 'cs',
\	'bat': 'dosbatch',
\	'uml': 'plantuml',
\	'plantuml': 'plantuml',
\}

" set markdown syntax default for none-folding
let g:vim_markdown_folding_disabled=1

nmap <A-Q> :VimwikiToggleListItem<CR>

let g:fsharp_interactive_bin = 'C:\Program Files (x86)\Microsoft F#\v4.0\Fsi.exe'

let g:html_number_lines=0

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

let mapleader=","

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala,atg let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab,coffee let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Mappings to move line

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" editing/reloading vimrc
map ,v :sp $MYVIMRC<CR><C-W>_
map <silent> ,V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"Map escape key to jj -- much faster
imap jj <esc>

" Pressing return clears highlighted search
" nmap <CR> :nohlsearch<CR>


inoremap <S-TAB> <Esc><<i
" imap <Tab> strpart(getline("."), col(".") - 3, 1)="*" ? "\<Lt>Esc>>>$a":""
imap <C-Tab> <Esc>>>$a

imap ,[ <Esc><<a
imap ,] <Esc>>>$a

map ,r :set wrap!<cr> 
map ,s :set spell!<cr> 


au BufEnter *.wiki set wrap
au BufLeave *.wiki set nowrap
au BufEnter *.wiki set spell
au BufLeave *.wiki set nospell
au BufNewFile,BufReadPost *.wiki setl shiftwidth=2 expandtab

map <up> gk
map <down> gj
" map <left> gh
" map <right> gl

" <Ctrl-l> redraws the screen and removes any search highlighting.
" nnoremap <silent> <C-l> :nohl<CR><C-l>


" for coffee script syntax
let coffee_compile_vert = 1
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

au BufNewFile,BufRead *.jshtml setf html
" au BufNewFile,BufRead *.jshtml noremap <silent> ,cc vat:s/^\(.*\)$/<!--\1-->/<CR>:nohlsearch<CR>
" au BufNewFile,BufRead *.jshtml noremap <silent> ,cu vat:s/-->//<CR>:nohlsearch<CR>

au BufNewFile,BufReadPost *.proto setl shiftwidth=2 expandtab
au BufNewFile,BufReadPost *.proto setf proto

xnoremap p pgvy

let g:plantuml_executable_script = "plantuml.jar"

" au BufNewFile,BufRead *.md nnoremap <F5> :w<CR> :silent PandocHtml<CR>
au BufNewFile,BufRead *.md let g:F6Command = 'PandocHtml'

nnoremap <F6> :w<CR>:call RunF6Command()<CR>
inoremap <F6> <C-O>:w<CR><C-O>:silent call RunF6Command()<CR>
vnoremap <F6> :<C-U>:w<CR>:call RunF6Command()<CR>


let g:F6Command = ''
function! RunF6Command()
  if g:F6Command != ''
    execute g:F6Command
  endif
endfunction



" nnoremap <F5> :w<CR> :silent make<CR>
" inoremap <F5> <Esc>:w<CR>:silent make<CR>
" vnoremap <F5> :<C-U>:w<CR>:silent make<CR>

nmap <F11> :silent !start explorer /select,%:p<CR>
imap <F11> <Esc><F11>

let g:Powerline_symbols = 'fancy'

let maplocalleader = ","


" Host specific config
let hostfile = $HOME . '\vimfiles\_vimrc-' . substitute(hostname(), "\\..*", "", "")
if filereadable(hostfile)
  exe 'source ' . hostfile
endif
