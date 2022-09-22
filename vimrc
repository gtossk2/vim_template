" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'preservim/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'taglist.vim'
Plugin 'gtags.vim'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rhysd/vim-clang-format'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" ================= VIM Setting ===================
" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" set leader to ,
let mapleader=","
let g:mapleader=","

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" Set mouse enable
set mouse=

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
"set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
set cursorline

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
" nnoremap / /\v
" vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" Auto change the current directory
set autochdir

" Switch Tab
"nmap <C-l> gt
"nmap <C-h> gT

" Copy to clipboard
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" Moving split
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l
nnoremap <C-Left> <C-w>h

" Resizing split
nmap <M-Right> :vertical resize +2<CR>
nmap <M-Left> :vertical resize -2<CR>
nmap <M-Down> :resize +2<CR>
nmap <M-Up> :resize -2<CR>

if &term =~ '^screen'
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif


" ==================== Tlist ======================
" map<f10> :Tlist<CR>
" let Tlist_Show_One_File = 1 " Displaying tags for only one file~
" let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
" let Tlist_Use_Right_Window = 0 " split to the right side of the screen
" let Tlist_Sort_Type = "order" " sort by order or name
" let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
" let Tlist_Compart_Format = 1 " Remove extra information and blank lines from the taglist window.
" let Tlist_GainFocus_On_ToggleOpen = 0 " Jump to taglist window on open.
" let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
" let Tlist_Close_On_Select = 0 " Close the taglist window when a file or tag is selected.
" let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
" let Tlist_WinWidth = 40


" ==================== Tagbar ======================
"nmap <Leader>tb :TagbarToggle<CR>
" let g:tagbar_ctags_bin='ctags'          " ctags path
let g:tagbar_width=30
let g:tagbar_left = 1
map <F10> :Tagbar<CR>
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "Auto open tagbar while detect C language


" ==================== Set Nerd Tree ====================
" nmap <F9> :NERDTreeFind<CR>
nnoremap <silent> <expr> <F9> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

let NERDTreeWinPos='right'
let NERDTreeWinSize=30
" let NERDTreeMapOpenInTab='\r'
" let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror

" Close NERDTree if the only remaining window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" ==================== Ack ====================
let g:ackprg = 'ag --nogroup --nocolor --column'


" ==================== gutentags ====================
" Set tag path
set tags=./.tags;,.tags

" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0
"Change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
"Enable advanced commands: GutentagsToggleTrace, etc.
let g:gutentags_define_advanced_commands = 1
let g:gutentags_trace = 0

" set cscope find symbol
" nnoremap <C-\> :exec("Gtags -g ".expand("<cword>"))<cr>
let g:gutentags_plus_nomap = 1
nnoremap <C-\> :GscopeFind s <C-R>=expand("<cword>")<CR><CR>

"cscope
"if has("cscope")
"    if executable('gtags-cscope') && executable('gtags')
"        "禁用原GscopeFind按键映射
"        let g:gutentags_plus_nomap = 1
"        "Find this C symbol 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
"        nmap <C-\>s :GscopeFind s <C-R>=expand("<cword>")<CR><CR>
"        "Find this difinition 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
"        nmap <C-\>g :GscopeFind g <C-R>=expand("<cword>")<CR><CR>
"        "Find functions called by this function 查找本函数调用的函数
"        nmap <C-\>d :GscopeFind d <C-R>=expand("<cword>")<CR><CR>
"        "Find functions calling this function 查找调用本函数的函数
"        nmap <C-\>c :GscopeFind c <C-R>=expand("<cword>")<CR><CR>
"        "Find this text string 查找指定的字符串
"        nmap <C-\>t :GscopeFind t <C-R>=expand("<cword>")<CR><CR>
"        "Find this egrep pattern 查找egrep模式，相当于egrep功能，但查找速度快多了
"        nmap <C-\>e :GscopeFind e <C-R>=expand("<cword>")<CR><CR>
"        "Find this file 查找并打开文件，类似vim的能
"        nmap <C-\>f :GscopeFind f <C-R>=expand("<cfile>")<CR><CR>
"        "Find files #including this file 查找包含本文件的文件
"        nmap <C-\>i :GscopeFind i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    else
"        set csto=1
"        set cst
"        set nocsverb
"        " add any database in current directory
"        if filereadable("cscope.out")
"            cs add cscope.out
"        endif
"        set csverb
"
"        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"
"        nmap <C-F12> :cs add cscope.out<CR>
"        "F12用ctags生成tags
"        nmap <F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q -f .tags<CR>
"        "--language-force=C++
"        nmap <S-F12> :!cscope -Rbkq<CR>
"        " cscope参数
"        "-R: 在生成索引文件时，搜索子目录树中的代码
"        "-b: 只生成索引文件，不进入cscope的界面
"        "-d: 只调出cscope gui界面，不跟新cscope.out
"        "-k: 在生成索引文件时，不搜索/usr/include目录
"        "-q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
"        "-i: 如果保存文件列表的文件名不是cscope.files时，需要加此选项告诉cscope到哪儿去找源文件列表。可以使用"-"，表示由标准输入获得文件列表。
"        "-I dir: 在-I选项指出的目录中查找头文件
"        "-u: 扫描所有文件，重新生成交叉索引文件
"        "-C: 在搜索时忽略大小写
"        "-P path: 在以相对路径表示的文件前加上的path，这样，你不用切换到你数据库文件所在的目录也可以使用
"    endif
"endif
"


" ==================== ctrlp ====================
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

