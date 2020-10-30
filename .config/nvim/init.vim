"INIT.VIM"

set number relativenumber "Line numbering

set incsearch "Set incremental search

set showcmd "show which commands are read

set ic "Set Ignore case in search as default

set scrolloff=50 "Setting scroll centering

set showmatch "highlight matching {[()]}"

set clipboard+=unnamedplus "yank to clipboard

"Some basics:
set nocompatible

filetype plugin on

syntax on

" Enable autocompletion
set wildmode=longest,list,full

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"Map leader
let mapleader = ","

" Set ultisnips triggers and other Ultisnipps things
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

"Set UltiSnips file types
"au FileType todo :UltiSnipsAddFiletypes todo
"au FileType txt :UltiSnipsAddFiletypes txt 

" Map substitute
nnoremap S :%s//g<Left><Left>

" Turn on spell checking
nnoremap s :set spell<CR>

" Yank file dir path
nnoremap <Leader>yp :let @+=expand('%:p:h')<CR> 

"Paste file dir path
nnoremap <Leader>pp :put =expand('%:p:h')<CR>

"Save file as sudo on files that require root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Remapping splits resizing
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Fuzzy files config
nnoremap ; :Files /home/mariuswis<CR>

"Fuzzyfind in Dropbox
nnoremap <Leader>db :Files /run/media/OSDisk/Users/mariussw/ARC_Project Dropbox/Marius Wishman<cr>

"Fuzzyfind ingnores git and wine
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .wine'

"Vimtex-compile
nnoremap <Leader>c :VimtexCompile<CR>

"Remap thesaurus"
nnoremap <Leader>t :ThesaurusQueryReplaceCurrentWord<CR>

"Using latex
let g:tex_flavor = 'latex'

"Vim-plug section
call plug#begin(stdpath('data') . '/plugged')

Plug 'chrisbra/Colorizer'

Plug 'Ron89/thesaurus_query.vim'

Plug 'chrisbra/csv.vim'

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'

Plug 'junegunn/fzf', { 'do': './install --bin' }

Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'

Plug 'tpope/vim-surround'

Plug 'jalvesaq/Nvim-R'

"Plug 'junegunn/vim-emoji'

"Plug 'itchyny/calendar.vim'

Plug 'vim-airline/vim-airline'

"Plug 'dylanaraps/wal.vim'

call plug#end()

"colorscheme wal 

" Zathura/vimtex
let g:vimtex_view_method = 'zathura'

" For all text files set 'textwidth' to 80 characters.
autocmd FileType text setlocal textwidth=80
augroup END

" For all tex files set 'textwidth' to 80 characters.
autocmd FileType tex setlocal textwidth=80
augroup END

"Colorizer
let g:colorizer_auto_color = 1 "Currently not working...
nnoremap <Leader>h :ColorHighlight<CR>

"Startify customization

let g:ascii = [
\'                                            ..						',
\'                                         .::::.						',
\'                            ___________ :;;;;:`____________					',
\'                            \_________/ ?????L \__________/					',
\'                              |.....| ????????> :.......''					',
\'                              |:::::| $$$$$$"`.:::::::'' ,					',
\'                             ,|:::::| $$$$"`.:::::::'' .OOS.					',
\'                           ,7D|;;;;;| $$"`.;;;;;;;'' .OOO888S.				',
\'                         .GDDD|;;;;;| ?`.;;;;;;;'' .OO8DDDDDNNS.				',
\'                         ""DDO|IIIII| .7IIIII7'' .DDDDDDDDNNNF`				',
\'                           ""D|IIIIII7IIIII7'' .DDDDDDDDNNNF`					',
\'                              |EEEEEEEEEE7'' .DDDDDDDNNNNF`					',
\'                              |EEEEEEEEZ'' .DDDDDDDDNNNF`					',
\'                              |888888Z'' .DDDDDDDDNNNF`					',
\'                              |8888Z'' ,DDDDDDDNNNNF`						',
\'                              |88Z''    "DNNNNNNN"						',
\'                              ""         "MMMM"						',
\'                                           ""							',
\'												',
\'    ___    ____                                            __   _         _    ________  ___	',
\'   /   |  / / /  __  ______  __  __   ____  ___  ___  ____/ /  (_)____   | |  / /  _/  |/  /	',
\'  / /| | / / /  / / / / __ \/ / / /  / __ \/ _ \/ _ \/ __  /  / / ___/   | | / // // /|_/ / 	',
\' / ___ |/ / /  / /_/ / /_/ / /_/ /  / / / /  __/  __/ /_/ /  / (__  )    | |/ // // /  / /	',
\'/_/  |_/_/_/   \__, /\____/\__,_/  /_/ /_/\___/\___/\__,_/  /_/____/     |___/___/_/  /_/	',
\'               /___/ 									 	',
\]

let g:startify_custom_header =  
          \ startify#pad(g:ascii)

let g:startify_bookmarks = [
	\'~/.config/nvim/init.vim',
	\'/run/media/OSDisk/Users/mariussw/ARC_Project Dropbox/Marius Wishman/Todo.txt',
	\'~/.config/i3/config',
	\'/run/media/OSDisk/Users/mariussw/ARC_Project Dropbox/Marius Wishman/GEO-ISD/ISDV2_Africa.csv']

    let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

"Start new windows running Startify"
nnoremap <Leader>vs :vsp<bar>Startify<CR>
nnoremap <Leader>hs :sp<bar>Startify<CR>
nnoremap <Leader>s :Startify<CR>

