" # Introduction
" This vimrc can be translate to markdown file by removing all leading double
" qoutes, here is the example:
"
" 1. put script in `script.in` file
"
" ```
" ggVGy
" :e! %:h/vimrc.md
" ggVGx"0pggVx:%s/^" \=//g
" :wq!
" ```
" 2. start vim by following command `vim -s script.in -n vimrc`
" 3. `Optional` generate html from markdown via pandoc
" 
" # Configurations
" ## Initialize specialty for windows
    if has("win32") || has("win64") || has("win16")
    " On windows, if called from cygwin or msys(git bash), the shell needs to be changed
    " to cmd.exe to make sure some plugin is working
        if &shell=~#'bash$'
            set shell=$COMSPEC " sets shell to correct path for cmd.exe
        endif
    " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization across (heterogeneous) systems easier.
        set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif
" ## Initialize python environment
    " only support python 3.7 x86 version

    if !has('nvim')
        if filereadable("C:/Program Files (x86)/Python37-32/python37.dll")
            set pythonthreedll=C:\Program\ Files\ (x86)\Python37-32\python37.dll
        endif
        if filereadable("C:/DevTools/Python/Python37/python37.dll")
            set pythonthreedll=C:\DevTools\Python\Python37\python37.dll
        endif
        if filereadable("C:/DevTools/Python37-32/python37.dll")
            set pythonthreedll=C:\DevTools\Python37-32\python37.dll
        endif
    endif

    " **Fix python 37 deprecation warning**
    " ref <https://github.com/vim/vim/issues/3117#issuecomment-406853295>

    if has('python3')
        silent! python3 1
    endif

" ## Initialize [vim-plug]
    " in diff mode, almost load no plugins, could manually enable some plugins by
    " executing something like `pathogen#interpose('bundle/YouCompleteMe')`

    " change to local app data folder to avoid mapped network latency when
    " computer in domain network
    if (has("win32") || has("win64") || has("win16")) && $LOCALAPPDATA != ""
      call plug#begin($LOCALAPPDATA . '/.vim/plugged')
    else
      call plug#begin('~/.vim/plugged')
    endif

    " enable following statement to avoid timeout when connecting https://github...
    " let g:plug_url_format = 'git@github.com:%s.git'

    if !&diff
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'othree/html5.vim'
        Plug 'aklt/plantuml-syntax'
        Plug 'kchmck/vim-coffee-script'
        Plug 'Lokaltog/vim-easymotion'
        Plug 'elzr/vim-json'
        Plug 'enthooz/vim-razor'
        Plug 'honza/vim-snippets'
        Plug 'wavded/vim-stylus'
        Plug 'tpope/vim-surround'
        Plug 'vimwiki/vimwiki'
        Plug 'tomtom/tcomment_vim'
        Plug 'digitaltoad/vim-pug'
        Plug 'vim-airline/vim-airline'
        Plug 'tpope/vim-sleuth'
        " Plug 'Yggdroot/indentLine'
        " Plug 'ervandew/supertab'
        Plug 'curist/vim-angular-template'
        Plug 'tpope/vim-repeat'
        Plug 'godlygeek/tabular'
        Plug 'kana/vim-altr'
        Plug 'kana/vim-smartinput'
        Plug 'dkprice/vim-easygrep'
        Plug 'airblade/vim-gitgutter'
        Plug 'tpope/vim-fugitive' ", { 'on':  'Gstatus' } ref to https://github.com/junegunn/vim-plug/issues/525#issuecomment-256169881 for why it not work
        Plug 'ekalinin/Dockerfile.vim'
        Plug 'vim-scripts/VisIncr'
        Plug 'xolox/vim-misc'
        Plug 'xolox/vim-shell'
        Plug 'xolox/vim-colorscheme-switcher', { 'on': ['NextColorScheme', 'PrevColorScheme'] }
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'kraxli/vim-renamer', { 'on': 'Renamer' }
        Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
        Plug 'haya14busa/incsearch.vim'
        Plug 'haya14busa/incsearch-fuzzy.vim'
        Plug 'terryma/vim-expand-region'
        Plug '907th/vim-auto-save' ", { 'on': 'AutoSaveToggle' }
        Plug 'tpope/tpope-vim-abolish', { 'on': 'Subvert' }
        Plug 'isobit/vim-caddyfile'
        Plug 'mhinz/vim-startify'
        Plug 'lervag/vimtex'
        Plug 'KeitaNakamura/tex-conceal.vim'
        if has('python3')
        " if !has('nvim')
            Plug 'SirVer/ultisnips'
        else
            Plug 'garbas/vim-snipmate'
            Plug 'MarcWeber/vim-addon-mw-utils' "required for snipmate
            Plug 'tomtom/tlib_vim' "required for snipmate
        endif
    endif

    Plug 'drmikehenry/vim-fontsize'
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'mattn/calendar-vim', { 'on':  'Calendar' }
    Plug 'nelstrom/vim-markdown-folding', { 'for': 'markdown' }
    Plug 'groenewege/vim-less', { 'for': 'less' }
    Plug 'vim-voom/VOoM', { 'for': 'markdown' }
    Plug 'mustache/vim-mustache-handlebars', { 'for': 'mustache' }
    Plug 'maksimr/vim-jsbeautify', { 'for': [ 'js', 'json' ] }
    Plug 'tpope/vim-liquid', {'for': ['liquid']}
    Plug 'leafgarland/typescript-vim', {'for': [ 'ts', 'typescript']}
    Plug 'posva/vim-vue', {'for': [ 'vue', 'wpy']}
    Plug 'embark-theme/vim', { 'as': 'embark' }

    " Add plugins to &runtimepath
    call plug#end()

" ## Basic Initialization

    " Maximized window when in diff mode
    if &diff
        set lines=999 columns=999
    endif

    "set langmenu=en_US
    "let $LANG = 'en_US'
    if has("gui_running")
        source $VIMRUNTIME/menu.vim
        colo embark " other fav color is desert/evening/slate
    endif
    if !empty($CONEMUBUILD) && !has("gui_running")
        " refer to http://conemu.github.io/en/VimXterm.html
        " also refer to http://stackoverflow.com/a/27673246/2558077 for <BS> fix
        set term=pcansi
        set t_Co=256
        let &t_AB="\e[48;5;%dm"
        let &t_AF="\e[38;5;%dm"
        colorscheme zenburn

        let g:indentLine_char = '|'
        let g:indentLine_color_term = 239
    endif
    " source $VIMRUNTIME/delmenu.vim
    set encoding=utf-8
    "set langmenu=zh_CN.UTF-8
    "language message zh_CN.UTF-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
    set directory=$TEMP,/tmp
    filetype plugin on
    if has("autocmd")
        filetype plugin indent on
    endif

    """ Moving Around/Editing
    set cursorline                  " have a line indicate the cursor location
    set ruler                       " show the cursor position all the time
    set nostartofline               " Avoid moving cursor to BOL when jumping around
    set virtualedit=block           " Let cursor move past the last char in <C-v> mode
    set scrolloff=3                 " Keep 3 context lines above and below the cursor
    set backspace=2                 " Allow backspacing over autoindent, EOL, and BOL
    set showmatch                   " Briefly jump to a paren once it's balanced
    set nowrap                      " don't wrap text
    set linebreak                   " don't wrap textin the middle of a word
    set autoindent                  " always set autoindenting on
    set tabstop=2                   " <tab> inserts 4 spaces 
    set shiftwidth=4                " but an indent level is 2 spaces wide.
    set softtabstop=4               " <BS> over an autoindent deletes both spaces.
    set expandtab                   " Use spaces, not tabs, for autoindent/tab key.
    set shiftround                  " rounds indent to a multiple of shiftwidth
    set matchpairs+=<:>             " show matching <> (html mainly) as well
    set foldmethod=indent           " allow us to fold on indents
    set foldlevel=5                 " don't fold by default
                                    
    """ Searching and Patterns      
    set ignorecase                  " Default to using case insensitive searches,
    set smartcase                   " unless uppercase letters are used in the regex.
    set smarttab                    " Handle tabs more intelligently 
    set hlsearch                    " Highlight searches by default.
    set incsearch                   " Incrementally search while typing a /regex
                                    
                                    
    """ UI                          
    set nocompatible
    set magic
    set number
    set wildmenu                    " Enable smart command line completion on <Tab>
    set wildmode=full               " Make repeated presses cycle between all matching choices
    set wildcharm=<C-Z>             " Make Ctrl-Z in a mapping act like pressing <Tab> interactively on the command line
    " Make a binding that automatically invokes :emenu completion
    map <F10> :emenu <C-Z>
    syntax on                       
    set display=lastline            " 显示最多行，不用@@
    set backspace=indent,eol,start
    set guioptions=r                " no menu and toolbar, only right hand scrollbar
    if has("gui_gtk2")
        set guifont=Droid\ Sans\ Mono
    elseif has("mac")
        set guifont=Menlo:h11
        set guifontwide=PingFang\ SC:h11
    else
        set guifont=Consolas:h10:cANSI
        set guifontwide=SimHei:h10:cANSI:qDRAFT
    end
    set laststatus=2

    """ Miscellaneous
    set nobackup
    set nomore                      " make listings no pause when whole screen is filled, useful when operating on multiple file
    let mapleader=","
    set hidden                      " make sure undo history can be saved after switched files
    set formatoptions+=mM           " reflow chinese text for `gq` command
    set vb t_vb=                    " disable beep and visual bell

" ## Nvim specific config

    if has('nvim')
        colo desert
        noremap <C-6> <C-^>
        imap <S-Insert> <C-R>+
        nmap <S-Insert> "+p
        vmap <S-Insert> "+p
        vmap <C-Insert> "+y
        " set guifont=Consolas:h12
        set guifontwide=黑体:h13:cGB2312
        " set guifontwide=Microsoft\ YaHei:h12
        " set guifont=Microsoft\ YaHei:h11
    endif

" ## Other

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
    map <C-t> :tabnew<CR>
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


    nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
    
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
    au BufNewFile,BufRead *.ejs set filetype=html
    au BufNewFile,BufRead *.cson set filetype=coffee
    au BufNewFile,BufRead *.markdown,*.md,*.mkd set filetype=markdown

" ## Enhanced Command
" ### Start editing the file under the cursor even not exist yet, from: https://superuser.com/a/277326

    map <leader>gf :e <cfile><cr>

" ### Beautify

    command! -range -nargs=0 -bar BeautifyJson <line1>,<line2>!python -m json.tool

" ### Window Maximized Shortcut
" Use `Ctrl+F5` to switch between maximized and normal

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

    function! MaximizeLineColumn()
        set lines=999 columns=999
    endfunction
    command MaximizeLineColumn :call MaximizeLineColumn()

" ### Change Font
" No shortcut, but command `ChangeFont` to switch between Chinese character
" available and english font

    let g:ChineseFont = 1
    function! ChangeFont()
    if g:ChineseFont == 1
        let g:ChineseFont = 0
        set guifont=SimHei:h10
    else
        let g:ChineseFont = 1
        set guifont=Consolas:h10:cANSI
    endif
    endfunction
    command Changefont :call ChangeFont()

" ### Tab Enhancement
" Temporary enable tab to fire auto-completion, should consider other tab
" enhancement script to replace this, use `ChangeTabCompletion` command to
" switch

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


" ### Build command
" For the habit of using visual studio, I mapped `F6` to build command

    nnoremap <F6> :w<CR>:call RunF6Command()<CR>
    inoremap <F6> <C-O>:w<CR><C-O>:silent call RunF6Command()<CR>
    vnoremap <F6> :<C-U>:w<CR>:call RunF6Command()<CR>

    let g:F6Command = ''
    function! RunF6Command()
    if g:F6Command != ''
        execute g:F6Command
    else 
        let l:temppath = getcwd()
        let l:buildpath = expand("%:p:h") 
        let l:list = "build.bat:make.bat:"
        while strlen(l:list)
            let i = match(l:list, ":")
            let l:buildfile = strpart(l:list, 0, i)
            let l:list = strpart(l:list, i+1)

            if filereadable(l:buildpath . '\\' . l:buildfile)
                exe 'lcd ' . l:buildpath
                exe 'silent !' . escape(l:buildpath, '!') . '\\' . l:buildfile
            endif
        endwhile
        exe 'lcd ' . l:temppath
    endif
    endfunction

" ## Split window

" `Ctrl-jklm` to change to that split

    map <c-j> <c-w>j
    map <c-k> <c-w>k
    map <c-l> <c-w>l
    map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )

    imap <C-W> <C-O><C-W>

    " Mappings to move line

    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    " editing/reloading vimrc
    map <leader>v :sp $HOME/.vim/vimrc<CR><C-W>_
    map <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:echo 'vimrc reloaded'<CR>

    "Map escape key to jj -- much faster
    imap jj <esc>

    inoremap <S-TAB> <Esc><<a
    " imap <Tab> strpart(getline("."), col(".") - 3, 1)="*" ? "\<Lt>Esc>>>$a":""
    imap <C-Tab> <Esc>>>$a

    map <leader>rr :set wrap!<cr> 
    map <leader>ss :set spell!<cr> 
    " toggle the syntax on/off with this command:
    map <leader>sn :if exists("g:syntax_on") <Bar>
        \   syntax off <Bar>
        \ else <Bar>
        \   syntax enable <Bar>
        \ endif <CR>
    map <leader>sl :if &syntax != "off" <Bar>
        \   setlocal syntax=off <Bar>
        \ else <Bar>
        \   setlocal syntax=on <Bar>
        \ endif <CR>

    " use `vimgrep` to search current word
    :nmap g* :vimgrep /<C-R><C-W>/ **/*<CR>
    :nmap g# :vimgrep /<C-R><C-W>/ *<CR>
    :nmap gn :cn<CR>
    :nmap gp :cp<CR>

    " replace words under cursor
    :nnoremap gh :%s/\<<C-r><C-w>\>//g<Left><Left>

" ## Other

    let g:fsharp_interactive_bin = 'C:\Program Files (x86)\Microsoft F#\v4.0\Fsi.exe'

    let g:html_number_lines=0

    au FileType markdown setl textwidth=120

    map <up> gk
    map <down> gj

    " for coffee script syntax
    let coffee_compile_vert = 1

    au BufNewFile,BufRead *.jshtml setf html
    au BufNewFile,BufReadPost *.proto setf proto

" map p to multiple time paste without change current clipboard item
    xnoremap p pgvy

    let g:plantuml_executable_script = "plantuml.jar"

" ## Spell

    nnoremap zfp [s1z=
    nnoremap zfn ]s1z=
    nnoremap zff 1z=
    nnoremap zp [s
    nnoremap zn ]s

" ## Other

    " nnoremap <F5> :w<CR> :silent make<CR>
    " inoremap <F5> <Esc>:w<CR>:silent make<CR>
    " vnoremap <F5> :<C-U>:w<CR>:silent make<CR>


    if has("mac")
" map `Ctrl-F11` to open shell in current directory 

    nmap <C-F11> :silent terminal<CR>
    imap <C-F11> <Esc><C-F11>

" map `Alt-F11` to open external shell in current directory

    nmap <A-F11> :silent !open -a Terminal "`pwd`"<CR>
    imap <A-F11> <Esc><A-F11>

" map `Shift-F11` to open current file in finder

    nmap <S-F11> :silent !open "`pwd`"<CR>
    imap <S-F11> <Esc><S-F11>

    else

" map `Ctrl-F11` to open shell in current directory 

    nmap <C-F11> :silent !start cmd<CR>
    imap <C-F11> <Esc><C-F11>

" map `Alt-F11` to open git bash shell in current directory

    nmap <A-F11> :silent !start cmd /c "code %:p:h"<CR>
    imap <A-F11> <Esc><A-F11>

" map `Shift-F11` to open current file in explorer

    nmap <S-F11> :silent !start explorer /select,%:p<CR>
    imap <S-F11> <Esc><S-F11>

    end
" change the current directory automatically

    autocmd BufEnter * silent! lcd %:p:h

" make `gf` with file extension based on current FileType

    autocmd FileType markdown setlocal suffixesadd=.md,.markdown

" change the current directory by command `<leader>cd`

    nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" ## Custom fold
" download from <http://www.gregsexton.org/2011/03/improving-the-text-displayed-in-a-fold/>
    fu! CustomFoldText()
        " get first non-blank line
        let fs = v:foldstart
        while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
        endwhile
        if fs > v:foldend
            let line = getline(v:foldstart)
        else
            let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
        endif
    
        let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
        let foldSize = 1 + v:foldend - v:foldstart
        let foldSizeStr = " " . foldSize . " lines "
        let foldLevelStr = repeat("+--", v:foldlevel)
        let lineCount = line("$")
        let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
        let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
        return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
    endf

    " set custom fold text to system
    set foldtext=CustomFoldText()

" ## Translate markdown
    " https://github.com/rhysd/translate-markdown
    " install dependence: `npm i -g translate-markdown`
    function! s:translate_markdown(lang) abort
        " if &filetype !=# 'markdown'
        "     echoerr 'Not a Markdown buffer!'
        "     return
        " endif

        if !executable('translate-markdown')
            echoerr '`translate-markdown` command is not found!'
            return
        endif

        let start = getpos("'<")
        let end = getpos("'>")
        let saved = getpos('.')

        call setpos('.', start)
        normal! v
        call setpos('.', end)

        let save_reg_g = getreg('g')
        let save_regtype_g = getregtype('g')
        try
            silent normal! "gy
            let input = substitute(getreg('g'), '\/', "%2F", "g")
        finally
            call setreg('g', save_reg_g, save_regtype_g)
            call setpos('.', saved)
        endtry

        silent call system('translate-markdown ' . a:lang, input)
    endfunction
    command! -nargs=0 -range=% TranslateMarkdownToEnglish call <SID>translate_markdown('en')<CR>
    command! -nargs=0 -range=% TranslateMarkdownToChinese call <SID>translate_markdown('zh-CN')<CR>
    map <leader>te :TranslateMarkdownToEnglish<CR>
    map <leader>tc :TranslateMarkdownToChinese<CR>
    " map <leader>tc :call <SID>translate_markdown('zh-CN')<CR>


" ## Plugin Settings

" ### [VimWiki] Configuration

" basic settings

    au FileType vimwiki setl wrap
    " au FileType vimwiki setl spell
    au FileType vimwiki setl shiftwidth=4 expandtab
    au FileType vimwiki let b:auto_save = 1
    
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
    
    let g:vimwiki_folding = 'expr'
    
" 是否在计算字串长度时用特别考虑中文字符

    let g:vimwiki_CJK_length = 1

" set markdown syntax default for none-folding

    let g:vim_markdown_folding_disabled=1

" no conceal for links

    let g:vimwiki_conceallevel = 0

" disable table mapping for snipmate

    let g:vimwiki_table_mappings = 0

" map `Alt+Shift+I` and `Alt+Shift+C` to toggle conceallevel 

    au FileType vimwiki nmap <A-I> :set conceallevel=0<CR>
    au FileType vimwiki nmap <A-C> :set conceallevel=2<CR>

" map `Alt+Shift+Q` to trigger todo item switch between checked or not 

    au FileType vimwiki nmap <A-Q> :VimwikiToggleListItem<CR>

" map vimwiki to onedrive folder 
 
    let g:vimwiki_list = [{
    \ 'path': 'C:/Users/icer/OneDrive/Work/wiki/personal',
    \ 'path_html': 'C:/Users/icer/OneDrive/Work/wiki/html/personal',
    \ 'syntax': 'markdown',
    \ 'ext': '.md',
    \ 'auto_export': 0,
    \}]

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
    \	'go': 'go',
    \}

" ### [UltiSnips]

    let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsListSnippets = '<NUL>'
    map <leader>sm :UltiSnipsEdit<CR>
    map <leader>sr :call UltiSnips#RefreshSnippets()<CR>

" ### [SnipMate]
" Map `<leader>sm" to open [SnipMate]

    " map <leader>sm :SnipMateOpenSnippetFiles<CR>
    let g:snipMate = { 'snippet_version' : 1 }

" ### [NerdTree]
" Map `<leader>n" to open [NerdTree]

    map <leader>n :NERDTreeToggle<CR>

" ### [Tagbar]
"
    let g:tagbar_ctags_bin = '~\.vim\bin\ctags.exe'
    let g:ctrlp_buftag_ctags_bin = '~\.vim\bin\ctags.exe'
    nmap <leader>tt :TagbarToggle<CR>


" ### [Powerline]

    let g:Powerline_symbols = 'fancy'
    let maplocalleader = ","

" ### [altr]

    if exists('altr#define')
        call altr#define('%.css',
        \                '%.less',
        \                '%.styl',
        \                '%.scss',
        \                '%.coffee',
        \                '%.js',
        \                '%.ts',
        \                '%.json',
        \                '%.jade',
        \                '%.htm',
        \                '%.html')
    endif
    nmap <F7> <Plug>(altr-forward)
    nmap <S-F7> <Plug>(altr-back)

" ### [Tabular]

    nmap <leader>t= :Tabularize /=<CR>
    vmap <leader>t= :Tabularize /=<CR>
    nmap <leader>tf :Tabularize /<bar><CR>
    vmap <leader>tf :Tabularize /<bar><CR>
    nmap <leader>t: :Tabularize /:\zs<CR>
    vmap <leader>t: :Tabularize /:\zs<CR>
    nmap <leader>t, :Tabularize /,<CR>
    vmap <leader>t, :Tabularize /,<CR>

" ### [vim-jsbeautify]

  autocmd FileType javascript,typescript vnoremap <buffer> gd :call RangeJsBeautify()<cr>
  autocmd FileType html vnoremap <buffer> gd :call RangeHtmlBeautify()<cr>
  autocmd FileType css,less vnoremap <buffer> gd :call RangeCSSBeautify()<cr>

  autocmd FileType javascript,typescript noremap <buffer> gd :call JsBeautify()<cr>
  autocmd FileType html noremap <buffer> gd :call HtmlBeautify()<cr>
  autocmd FileType css,less noremap <buffer> gd :call CSSBeautify()<cr>

" ### [VOoM]

  autocmd FileType markdown noremap <buffer> <leader>vm :VoomToggle markdown<cr>

" ### [CtrlP]

    " Ignore files in .gitignore
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ### [incsearch]

    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    map z/ <Plug>(incsearch-fuzzy-/)
    map z? <Plug>(incsearch-fuzzy-?)
    map zg/ <Plug>(incsearch-fuzzy-stay)

" ### [airline]

    let g:airline#extensions#tagbar#enabled = 0

    " " count characters
    " let g:airline_section_y = '%{has_key(wordcount(), "cursor_chars")?wordcount()["cursor_chars"] : "-"}C'

    " " https://www.vivi.sh/blog/technical/live-wordcount-vim-airline/
    " " Enable wordcount but only english word
    " let g:airline#extensions#wordcount#enabled = 1
    " " Add notes to filetypes
    " let g:airline#extensions#wordcount#filetypes = '\vnotes|help|markdown|vimwiki|rst|org|text|asciidoc|tex|mail'

" ### [xolox:shell]

    let g:shell_mappings_enabled = 0
    nmap <F11> :Fullscreen<CR>
    imap <F11> <Esc><F11>

" ### [fugitive.vim]

    nmap <leader>gs :Git<CR>
    nmap <leader>gl :Git pull<CR>
    nmap <leader>gp :Git push<CR>
    nmap <leader>gwu :Git add -A <bar> Git commit -am "updated"<CR>
    nmap <leader>gac :Git add -A <bar> Git commit<CR>
    nmap <leader>gtc :silent !tgit commit<CR>
    nmap <leader>gtl :silent !tgit log<CR>
    let $GIT_ASKPASS = 'no'

" ### [vim-colorscheme-switcher]

    nmap <F8> :NextColorScheme<CR>

" ### [startify]

    let g:startify_custom_header = ''
    let g:startify_bookmarks = [
        \ { 'h': '~/OneDrive/Work/wiki/personal/index.md' },
        \ { 'd': '~/OneDrive/Work/wiki/personal/diary/diary.md' },
        \ { 'a': '~/OneDrive/Work/phd/13-application/index.md' },
        \ ]
    nmap <leader>s :Startify<CR>

" ### [vim-surround]

    let g:surround_{char2nr('b')} = "**\r**"


" ### [vim-auto-save]

    let g:auto_save_events = ["CursorHold", "CursorHoldI"]

" ### [fzf.vim]

    command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
    nmap <leader>rg :Rg<CR>

" ### Tex [lervag/vimtex]

    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0

  " let g:vimtex_view_general_viewer = 'SumatraPDF'
  " let g:vimtex_view_general_options = '-forward-search @tex @line @pdf'
  " let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" ### Tex [KeitaNakamura/tex-conceal.vim]

    " set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

" ## Host specifed config
" load specific config by hostname

    let hostfile = $HOME . '/.vim/vimrc-' . substitute(hostname(), "\\..*", "", "")
    if filereadable(hostfile)
        exe 'source ' . hostfile
    endif


" [vim-plug]: https://github.com/junegunn/vim-plug 
" [NerdTree]: https://github.com/scrooloose/nerdtree 
" [altr]: https://github.com/kana/vim-altr
" [vim-jsbeautify]: https://github.com/maksimr/vim-jsbeautify
" [VOoM]: https://github.com/vim-voom/VOoM
" [Tagbar]: https://github.com/majutsushi/tagbar
" [incsearch]: https://github.com/haya14busa/incsearch.vim
" [airline]: https://github.com/vim-airline/vim-airline
" [fugitive.vim]: https://github.com/tpope/vim-fugitive
" [SnipMate]: https://github.com/garbas/vim-snipmate
" [startify]: https://github.com/mhinz/vim-startify
" [UltiSnips]: https://github.com/SirVer/ultisnips
" [vim-auto-save]: https://github.com/907th/vim-auto-save
" [fzf.vim]: https://github.com/junegunn/fzf.vim
