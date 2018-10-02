call plug#begin('~/.vim/plugged')

" Material theme.
Plug 'kaicataldo/material.vim'

" SASS & CSS stuff.
Plug 'cakebaker/scss-syntax.vim'
Plug 'shmargum/vim-sass-colors'

" Javascript syntax highlighting.
Plug 'pangloss/vim-javascript'

" Auto-pairing braces, parentheses and quotes.
Plug 'jiangmiao/auto-pairs'

" YouCompleteMe autocompletion.
Plug 'Valloric/youCompleteMe', { 'do': './install.py --tern-completer' }

" Deoplete autocompletion.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Airline bar.
Plug 'vim-airline/vim-airline'

" Airline themes.
Plug 'vim-airline/vim-airline-themes'

" Nerd-tree file explorer.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Emmet.
Plug 'mattn/emmet-vim'

" Vue component syntax highlighting.
Plug 'posva/vim-vue'

" PHP Stuff.
Plug 'StanAngeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'

call plug#end()

" General stuff.
filetype plugin indent on
set number
set expandtab
set smarttab

" File-type-specific indentation and stuff.
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4
autocmd FileType vue setlocal shiftwidth=2 tabstop=2

" Theme stuff.
set background=dark

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:material_theme_style = 'default'

let g:material_terminal_italics = 1

colorscheme material

" Airline-theme
let g:airline_theme = 'material'

" Javascript syntax highlighting.
let g:javascript_plugin_jsdoc = 1

" Start autocompletion after4 characters.
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Don't show YCM's preview window ( I find it really annoying )
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Open nerdtree if no file has been specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Deoplete plugin settings.
let g:deoplete#enable_at_startup = 1

" Command to move along tabs Konsole-style.
map <A-Right> gt
map <A-Left> gT

" Emmet completion.
map <c-e> <c-y>,
