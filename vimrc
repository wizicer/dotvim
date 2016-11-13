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
" ## Initialize [pathogen]
    " in diff mode, load no plugins, could manually enable some plugins by
    " executing something like `pathogen#interpose('bundle/YouCompleteMe')`
    if !&diff
        call pathogen#infect()
    endif
    call pathogen#helptags()
    Helptags

" ## Basic Initialization

    " Maximized window when in diff mode
    if &diff
        set lines=999 columns=999
    endif

    "set langmenu=en_US
    "let $LANG = 'en_US'
    if has("gui_running")
        source $VIMRUNTIME/menu.vim
        colo desert " other fav color is evening/slate
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
    map <F10> :emenu <C-Z>          " Make a binding that automatically invokes :emenu completion
    syntax on                       
    set display=lastline            " 显示最多行，不用@@
    set backspace=indent,eol,start
    set guioptions=r                " no menu and toolbar, only right hand scrollbar
    if has("gui_gtk2")
        set guifont=Droid\ Sans\ Mono
    else
        set guifont=Consolas:h10:cANSI
    end
    set laststatus=2

    """ Miscellaneous
    set nobackup
    let mapleader=","
    set hidden                      " make sure undo history can be saved after switched files

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
    au BufNewFile,BufRead *.ejs set filetype=html
    au BufNewFile,BufRead *.cson set filetype=coffee
    au BufNewFile,BufRead *.markdown,*.md,*.mkd set filetype=markdown

" ## Enhanced Command
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
        set guifont=FixedSys:h8
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

    let g:Tlist_Ctags_Cmd = "\"C:/Program Files/Vim/vimfiles/ctags58/ctags.exe\""


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
    map <leader>v :sp $MYVIMRC<CR><C-W>_
    map <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:echo 'vimrc reloaded'<CR>

    "Map escape key to jj -- much faster
    imap jj <esc>

    inoremap <S-TAB> <Esc><<i
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

    au FileType vimwiki setl wrap
    au FileType vimwiki setl spell
    au FileType vimwiki setl shiftwidth=2 expandtab

    au FileType markdown setl textwidth=100

    map <up> gk
    map <down> gj

    " for coffee script syntax
    let coffee_compile_vert = 1

    au BufNewFile,BufRead *.jshtml setf html
    au BufNewFile,BufReadPost *.proto setf proto

" map p to multiple time paste without change current clipboard item
    xnoremap p pgvy

    let g:plantuml_executable_script = "plantuml.jar"

" ## Other

    " nnoremap <F5> :w<CR> :silent make<CR>
    " inoremap <F5> <Esc>:w<CR>:silent make<CR>
    " vnoremap <F5> :<C-U>:w<CR>:silent make<CR>

" map `Ctrl-F11` to open shell in current directory 

    nmap <C-F11> :silent !start cmd<CR>
    imap <C-F11> <Esc><C-F11>

" map `Alt-F11` to open git bash shell in current directory

    nmap <A-F11> :silent !start sh --login<CR>
    imap <A-F11> <Esc><A-F11>

" map `Shift-F11` to open current file in explorer

    nmap <S-F11> :silent !start explorer /select,%:p<CR>
    imap <S-F11> <Esc><S-F11>

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



" ## Plugin Settings

" ### [VimWiki] Configuration
    
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

" set markdown syntax default for none-folding

    let g:vim_markdown_folding_disabled=1

" no conceal for links

    let g:vimwiki_conceallevel = -1

" map `Alt+Shift+Q` to trigger todo item switch between checked or not 

    nmap <A-Q> :VimwikiToggleListItem<CR>

" ### [NerdTree]
" Map `<leader>n" to open [NerdTree]

    map <leader>n :NERDTreeToggle<CR>

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

" ### [vim-jsbeautify]

  autocmd FileType javascript,typescript vnoremap <buffer> gd :call RangeJsBeautify()<cr>
  autocmd FileType html vnoremap <buffer> gd :call RangeHtmlBeautify()<cr>
  autocmd FileType css,less vnoremap <buffer> gd :call RangeCSSBeautify()<cr>

  autocmd FileType javascript,typescript noremap <buffer> gd :call JsBeautify()<cr>
  autocmd FileType html noremap <buffer> gd :call HtmlBeautify()<cr>
  autocmd FileType css,less noremap <buffer> gd :call CSSBeautify()<cr>

" ### [VOoM]

  autocmd FileType markdown noremap <buffer> <leader>vm :VoomToggle markdown<cr>

" ## Host specifed config
" load specific config by hostname

    let hostfile = $HOME . '/.vim/vimrc-' . substitute(hostname(), "\\..*", "", "")
    if filereadable(hostfile)
        exe 'source ' . hostfile
    endif


  let g:vimtex_view_general_viewer = 'SumatraPDF'
  let g:vimtex_view_general_options = '-forward-search @tex @line @pdf'
  let g:vimtex_view_general_options_latexmk = '-reuse-instance'

" [pathogen]: https://github.com/tpope/vim-pathogen
" [NerdTree]: https://github.com/scrooloose/nerdtree 
" [altr]: https://github.com/kana/vim-altr
" [vim-jsbeautify]: https://github.com/maksimr/vim-jsbeautify
" [VOoM]: https://github.com/vim-voom/VOoM
