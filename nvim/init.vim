""" cPlug 

call plug#begin('/home/yahir/.config/nvim/plugged/')

""" colors
Plug 'ulwlu/elly.vim'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'co1ncidence/bliss'

""" barra
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""" icons
Plug 'ryanoasis/vim-devicons'

"""" Identlone
Plug 'Yggdroot/indentLine'

" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'kiteco/vim-plugin'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}


"Plug 'rantasub/vim-bash-completion'
Plug 'vim-scripts/bash-support.vim'

Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
"Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

""" LIVE SERVER
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()


""" SETTERS
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set number
set clipboard=unnamed
set mouse=a
set cursorline
"set ignorecase
set smartcase
set autoindent
set wrap
set autoread
set termguicolors
syntax on
filetype plugin on

"set wildmode=longest,list,full
"set wildmenu
"set completeopt+=preview
set completeopt-=menu
set completeopt+=menuone   " Show the completions UI even with only 1 item
set completeopt-=longest   " Don't insert the longest common text
set completeopt-=preview   " Hide the documentation preview window
set completeopt+=noinsert  " Don't insert text automatically
set completeopt-=noselect  " Highlight the first completion automatically
""" COLORS
colorscheme elly

"set background=dark    " Setting dark mode
"set background=light   " Setting light mode
"let g:gruvbox_transparent_bg=1
"  Possible values are soft, medium and hard.
"let g:gruvbox_contrast_light='hard'
"let g:gruvbox_contrast_dark='hard'
"colorscheme gruvbox

"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

"colorscheme bliss

""" VARS
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='term'
"let g:airline_theme='term'

""" KITE 
let g:kite_supported_languages = ['*']
let g:kite_auto_complete=1
let g:kite_tab_complete=1

""" CLOSE TAG
let g:closetag_filenames = '.html,.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '.xhtml,.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
"let g:coc_disable_startup_warning = 1
let g:airline_section_warning = "%{kite#statusline()}"

"" live server
let g:bracey_eval_on_save=0
let g:bracey_refresh_on_save=1
let g:bracey_auto_start_server=1
" g:bracey_server_path
"default: 'http://127.0.0.1'

""" NAMP
let mapleader=' '
nmap <Leader>b :NERDTreeToggle <CR>
nmap <Leader>t :TagbarToggle <CR>
"nmap <Leader>o| :Tabularize /| <CR> 
nmap <Leader>o= :Tabularize /= <CR>
nmap <Leader>o: :Tabularize /: <CR>
nmap <C-s> :w <CR>
nmap <C-w> :q <CR>
nmap <Leader>s :source  /home/yahir/.config/nvim/init.vim<CR>
nmap <Leader>pc :PlugClean <CR>
nmap <Leader>pi :PlugInstall <CR>
vmap <C-c> "+y <CR>
"nmap <A-p> :toggleAutopairs
nmap <Leader><Left> :tabprevious<CR>                                                                            
nmap <Leader><Right> :tabnext<CR>
nmap <Leader>n :tabnew <CR>
nmap <Leader>vs :vsplit <CR>
nmap <Leader>r :AirlineTheme random <CR>

" zr recoge el capítulo en el que te encuentres
" za abre el capítulo
" zR despliega todos los capítulos
"autocmd VimEnter * AirlineTheme atomic
"autocmd VimEnter * AirlineTheme fruit_punch
"autocmd VimEnter * AirlineTheme lessnoise
"autocmd VimEnter * AirlineTheme wombat
"autocmd VimEnter * AirlineTheme distinguished
autocmd VimEnter * AirlineTheme elly
"autocmd VimEnter * AirlineTheme gruvbox

let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  "powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''

au FileType * execute 'setlocal dict+=~/.config/nvim/words/'.&filetype.'.txt'
