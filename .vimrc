set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number
set autoindent
set autoread
set smartindent
set cindent
set nocompatible "required for vundle
set relativenumber
set ignorecase
set smartcase
set noswapfile
set hidden " so fuzzyfinder won't ask me to save file before jumping
set nowrap
set nobackup
set guifont=Monaco:h12
set background=dark
set laststatus=2
set formatoptions-=or
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set cryptmethod=blowfish
" splitting settings
set splitbelow
set splitright
let mapleader = "\<space>"
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" select the last changed text
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" allows yanking into system clipboard
set clipboard=unnamed

" remap movement to visual lines (word wrap)
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" hold shift for faster navigation (unbinds J, use :join instead)
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" move efficiently between splits
nmap <C-a>h <C-w>h
nmap <C-a>j <C-w>j
nmap <C-a>k <C-w>k
nmap <C-a>l <C-w>l

" move efficiently between tabs (combines nicely with the vimscript to to :bn
nmap <C-l> gt
nmap <C-h> gT

" unbind arrow keys for normal and visual mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" make it easy to src vimrc
nmap ,s :source ~/.vimrc<CR>
nmap ,v :e ~/.vimrc<CR>

" save folds when vim quits (this was commented out since it might break
" rails vim)
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

nnoremap <Leader>d$ :<C-u>%DeleteTrailingWhitespace<CR>
vnoremap <Leader>d$ :DeleteTrailingWhitespace<CR>
let g:DeleteTrailingWhitespace = 1
nnoremap <leader>v V`] "highlights the text that was just pasted
nnoremap <leader>w <C-w>v<C-w>l "opens a vertical split and switches to it
imap jk <Esc>
nmap <leader>ne :NERDTree<cr>
nmap <Leader>Q :q!<CR>
nmap <Leader>w :w<CR>
nmap <Leader><Tab> :Tab /=<cr>
" autoformat
noremap <F4> :Autoformat<CR><CR>
" map gT and gt to change buffers if there aren't any tabs
nn gt : exec tabpagenr('$') == 1 ? 'bn' : 'tabnext'<CR>
nn gT : exec tabpagenr('$') == 1 ? 'bp' : 'tabprevious'<CR>

" vundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:fuf_file_exclude = 'node_modules|\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.class$'

" plugins
Plugin 'airblade/vim-gitgutter'
Bundle 'Chiel92/vim-autoformat'
Bundle 'FuzzyFinder'
Bundle 'L9'
Bundle 'Lokaltog/vim-easymotion'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'godlygeek/tabular'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'slim-template/vim-slim'
Bundle 'qpkorr/vim-bufkill'
Bundle 'tmhedberg/matchit'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'djoshea/vim-autoread'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'Raimondi/delimitMate'

" Vim Indent Guides
" -----------------
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_enable_on_vim_startup = 1

" Easier bindings for rails vim
nmap <Leader>m :Emodel<Space>

" airline tabbar
" enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" show jstu the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"

" fast select aline buffers
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" map :bd to use bufkill semantics
nmap :bd :BD

syntax enable
filetype plugin indent on "required for vundle

"vim-slim
" vim.wikia.com/wiki/All_folds-open_when_opening_a_file
autocmd Syntax slim setlocal foldmethod=syntax
autocmd Syntax slim normal zR

"Bundle configurations
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'full'
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
nmap <Leader>p <Plug>yankstack_substitute_older_paste
nmap <Leader>P <Plug>yankstack_substitute_newer_paste
" annoying for syntastic java: have to add the path to bin/classes of all
" android projects
let androidDir = "~/src/Rocketmade/Android/"
let g:syntastic_java_javac_classpath=androidDir."*/libs/*.jar:".androidDir."*/*/libs/*.jar:".androidDir."*/bin/classes:".androidDir."*/*/bin/classes:~/Library/androidsdk/platforms/android-19/*.jar"

" EasyMotion configuration
nmap s <Plug>(easymotion-s)
map , <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"FuzzyFinder mappings
nnoremap <Leader>t :<C-u>FufFile **/<CR>
nnoremap <Leader>b :<C-u>FufBuffer **/<CR>

" color scheme for gui only
if has('gui_running')
    colorscheme ToyChest
endif

let g:fuf_file_exclude = '\v\~$'
\ . '|\.(o|png|PNG|JPG|class|CLASS|jpg|exe|bak|swp)$'
\ . '|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
\ . '|(^|[/\\])_site[/\\]'
\ . '|(^|[/\\])assets[/\\]'
\ . '|(^|[/\\])target[/\\]'
\ . '|(^|[/\\])node_modules[/\\]'
\ . '|(^|[/\\])plugins[/\\]'
\ . '|.*[/\\]$'

"function to strip trailing whitespace after save
fun! <SID>StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  let _s = @/
  %s/\s\+$//e
  let @/ = _s
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespace()

" script to turn * and # in visual mode to search for selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
let temp = @s
norm! gv"sy
let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
let @s = temp
endfunction

"Commands for different langauges
autocmd FileType javascript nnoremap <buffer> <Leader>c I//<esc>
autocmd FileType javascript setlocal nocindent

"syntax highlight cocoapods
au BufNewFile,BufRead *.podspec set filetype=ruby
au BufNewFile,BufRead Podfile set filetype=ruby
au BufNewFile,BufRead *.gradle set filetype=groovy

" save last cursor position
" autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \ exe "normal g`\"" |
"     \ endif

" allows creating a new file inside a new directory with :E
" command -nargs=1 E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
"

" allow different color text by ~~ text ~~
au BufRead,BufNewFile *.txt   syntax match StrikeoutMatch /\~\~.*\~\~/
hi def  StrikeoutColor   ctermbg=darkblue ctermfg=black    guibg=darkblue guifg=blue
hi link StrikeoutMatch StrikeoutColor

" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap ,m :!open -a "Google Chrome.app" %:p<CR>'

" vim-markdown to highlight code in fenced code blocks
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'java']
