" Ynigo Reyes
" This .vimrc includes plugins for basic Web development and my own shortcuts

" I am tired of seeing a Python 3 deprecation warning
if has('python3')
  silent! python3 1
endif

call plug#begin('~/.vim/plugged')
  " Other Stuff

  Plug 'sjl/badwolf'
  Plug 'tomtom/tcomment_vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-surround'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'bronson/vim-trailing-whitespace'
  autocmd BufWritePost * :FixWhitespace

  " More File Specifics"
  :filetype plugin on

  " JavaScript "
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --tern-completer' }

  " TypeScripts "
    Plug 'leafgarland/typescript-vim'
    Plug 'quramy/tsuquyomi'
    Plug 'ianks/vim-tsx'

  " React "
    Plug 'mattn/emmet-vim'
    let g:user_emmet_settings = {
      \  'javascript.jsx' : {
      \      'extends': 'jsx',
      \      'quote_char': "'",
      \  },
      \  'typescript.tsx' : {
      \      'extends': 'jsx',
      \      'quote_char': "'",
      \  },
      \}


  " C/C+ "
    Plug 'rip-rip/clang_complete'

    " This probably will not work anywhere else
    " You can fix this probably by curling a download and putting it in
    " usr/lib. You can grab this through (linux)brew
    let g:clang_library_path="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib"

    " Lets me use cmake and doxygen
      let  g:C_UseTool_cmake    = 'yes'
      let  g:C_UseTool_doxygen = 'yes'

  " Makefile (must use 'makefile' in vim)
    autocmd BufRead,BufNewFile makefile set noexpandtab
    autocmd BufRead,BufNewFile makefile set tabstop=4


call plug#end()

" Configs for NERDTree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
map <C-b> :NERDTreeToggle<CR>

" Editor
set backspace=indent,eol,start
set path+=**
set wildmenu
set expandtab
set relativenumber
set tabstop=2
set softtabstop=2
set shiftwidth=2
set showmatch
set autoindent
set fileformat=unix
set number
set ruler
set nowrap

syntax enable
set updatetime=4000
set nocompatible

set encoding=utf-8

" KeyMaps - Normal Mode
  " Switch windows use h-f
  :nnoremap hf <c-w><c-w>
  " Use Double Space to save your work
  :nnoremap <Space><Space> :w<kEnter>
  " Use Crtl+J or K to Flip lines
  :nnoremap <c-j> ddp
  :nnoremap <c-k> dd<Up><Up>p
  " Use Shift+J or K to copy lines up or down
  :nnoremap <Space-j> yyp
  :nnoremap <Space-k> yy<Up>p
  " MultiCursor Keymappings Ctrl+v to select and Shift+I to edit it
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_start_word_key = '<C-v>'
  let g:multi_cursor_next_key = '<C-v>'
  let g:multi_cursor_quit_key = '<Esc>'
  " Tabbing
  :nnoremap <Tab> v<s->>
  :nnoremap <s-Tab> v<s-<>

" KeyMaps - Insert Mode
  :imap jj <Esc>
  " Auto Closing quotes and such
  :imap { {}<Left>
  :imap ( ()<Left>
  :inoremap ' ''<Left>
  :inoremap " ""<Left>
  :inoremap [ []<Left>

