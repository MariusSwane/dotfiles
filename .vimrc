" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

set number "Line numbering

set incsearch "Set incremental search

"set spell " turn on spell checking

set showcmd "show which commands are read

set ic "Set Ignore case in search as default

set scrolloff=50 "Setting scroll centering

set showmatch "highlight matching {[()]}"

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

" Turn off spell checking
nnoremap s :set spell<CR>

"Save file as sudo on files that require root
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"Automatic closing
""inoremap " ""<left>

""inoremap ' ''<left>
""inoremap ( ()<left>
""inoremap [ []<left>
""inoremap { {}<left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>O

" NERDTree mapping
nnoremap <Leader>nt  :NERDTreeToggle<CR>

"Fuzzy files config
nnoremap ; :Files /home/mariuswis<CR>

nnoremap <Leader>db :Files /run/media/mariuswis/OSDisk/Users/mariussw/Dropbox/<cr>

let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

"Vimtex-compile
nnoremap <Leader>c :VimtexCompile<CR>

"Remap thesaurus"
nnoremap <Leader>t :ThesaurusQueryReplaceCurrentWord<CR>

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

let g:tex_flavor = 'latex'

if empty(glob('~/.vim/autoload/plug.vim'))

  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs

    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif

"Vim-plug section
call plug#begin('~/.vim/plugged')

Plug 'chrisbra/Colorizer'

Plug 'Ron89/thesaurus_query.vim'

Plug 'chrisbra/csv.vim'

Plug 'lervag/vimtex'

Plug 'SirVer/ultisnips'

Plug 'junegunn/fzf', { 'do': './install --bin' }

Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'

"Plug 'itchyny/lightline.vim'

"Plug 'powerline/powerline'

Plug 'mhinz/vim-startify'

Plug 'jalvesaq/Nvim-R'

Plug 'tpope/vim-surround'

"Plug 'mattn/emoji-vim'

Plug 'junegunn/vim-emoji'

Plug 'junegunn/vim-easy-align'

Plug 'itchyny/calendar.vim'

Plug 'vim-airline/vim-airline'

Plug 'dylanaraps/wal.vim'

call plug#end()

colorscheme wal 

" Powerline

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Zathura/vimtex
let g:vimtex_view_method = 'zathura'

" For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
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
          \ startify#pad(g:ascii + startify#fortune#cowsay())

let g:startify_bookmarks = [
	\'~/.vimrc',
	\'~/Documents/Todo.txt',
	\'~/.config/i3/config',
	\'/run/media/mariuswis/OSDisk/Users/mariussw/ARC_Project Dropbox/Marius Wishman/GEO-ISD/isd_v2_11_06_2019_merged-Africa.csv']

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

