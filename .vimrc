" Ynigo Reyes
" This .vimrc includes plugins for basic Web development and my own shortcuts

syntax on
set number
set ruler
set background=dark
set nowrap

call plug#begin('~/.vim/plugged')
  " Other Stuff

  Plug 'sjl/badwolf'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'

  " ### JavaScript
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    
    " ## Formating
      let g:javascript_plugin_flow = 1
      autocmd FileType javascript set formatprg=prettier\ --stdin
      " Code Folding
      augroup javascript_folding
        au!
        au FileType javascript setlocal foldmethod=syntax
      augroup END
      autocmd BufWritePre *.js :normal gggqG
      " Use Tab for autocomplete
      inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " HTML/CSS
    Plug 'mattn/emmet-vim'

      let g:user_emmet_install_global = 0
      autocmd FileType html,css EmmetInstall

  " C/C+
    Plug 'rip-rip/clang_complete'
    
    " This probably will not work anywhere else
    " You can fix this probably by curling a download and putting it in
    " usr/lib
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
set colorcolumn=80
set softtabstop=2
set shiftwidth=2
set showmatch
set autoindent
set smartindent
set fileformat=unix
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
  

" KeyMaps - Insert Mode
  :imap jj <Esc>
