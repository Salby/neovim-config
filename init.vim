call plug#begin('~/.vim/plugged')

" ALE Linting.
Plug 'w0rp/ale'

" Nord theme.
Plug 'arcticicestudio/nord-vim'

" SASS & CSS stuff.
Plug 'cakebaker/scss-syntax.vim'

" Javascript syntax highlighting.
Plug 'pangloss/vim-javascript'

" Auto-pairing braces, parentheses and quotes.
Plug 'jiangmiao/auto-pairs'

" Deoplete autocompletion.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Tern
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
" Tern-deoplete
Plug 'carlitux/deoplete-ternjs'
" Rust-deoplete
Plug 'sebastianmarkow/deoplete-rust'
" Dart-deoplete
"Plug 'villainy/deoplete-dart', { 'for': 'dart' }

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
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

" Jinja template support.
Plug 'lepture/vim-jinja'

" Dartlang support.
Plug 'dart-lang/dart-vim-plugin'

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

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" Theme stuff.
set background=dark

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 12

colorscheme nord

" Airline settings.
let g:airline#extensions#ale#enabled = 1

"" Theme.
let g:airline_theme = 'nord'

"" Powerline-fonts
let g:airline_powerline_fonts = 1

" Javascript syntax highlighting.
let g:javascript_plugin_jsdoc = 1

" Start autocompletion after4 characters.
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0

" Open nerdtree if no file has been specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ALE settings.
let g:ale_sign_column_always = 1
let g:ale_sign_error = '->'
let g:ale_sign_warning = '>-'

"" Rust
let g:ale_linters = {'rust': ['rls']}

" Deoplete plugin settings.
let g:deoplete#enable_at_startup = 1

" Tern-deoplete plugin.
let g:deoplete#sources#ternjs#filetypes = [
        \ 'jsx',
        \ 'javascript.jsx',
        \ 'vue'
        \ ]
" Use tern_for_vim
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Rust-deoplete plugin.
let g:deoplete#sources#rust#racer_binary = '~/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src/'

" Deoplete-dart plugin.
"let g:deoplete#sources#dart#dart_sdk_path = '/home/sander/flutter/bin/cache/dart-sdk'

" PHPCD plugin
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']

" Command to move along tabs Konsole-style.
map <A-Right> gt
map <A-Left> gT

" Emmet completion.
map <c-e> <c-y>,

" Dartlang settings.
let dart_html_in_string=v:true
let dart_style_guide = 2
let dart_format_on_save = 1

" PHPDOC syntax highlighting
function! PhpSyntaxOverride()
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup PhpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END
