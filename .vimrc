" Ynigo Reyes
" This .vimrc includes plugins for basic Web development and my own shortcuts

" I am tired of seeing a Python 3 deprecation warning
if has('python3')
  silent! python3 1
endif

call plug#begin('~/.vim/plugged')
  " Other Stuff

  Plug 'sjl/badwolf'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'bling/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'terryma/vim-multiple-cursors'

  " ### JavaScript
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --tern-completer' }
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

    " YCM Defaults
      " Start autocompletion after 4 chars
      let g:ycm_min_num_of_chars_for_completion = 4
      let g:ycm_min_num_identifier_candidate_chars = 4
      let g:ycm_enable_diagnostic_highlighting = 0
      " Don't show YCM's preview window [ I find it really annoying ]
      set completeopt=preview
      let g:ycm_add_preview_to_completeopt = 0
      let g:ycm_server_python_interpreter='/usr/local/bin/python3'

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

  " ### TypeScripts
    Plug 'leafgarland/typescript-vim'
    Plug 'quramy/tsuquyomi'
    Plug 'ianks/vim-tsx'

  " HTML/CSS
    Plug 'mattn/emmet-vim'

      let g:user_emmet_install_global = 0
      autocmd FileType html,css EmmetInstall

  " C/C+
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
set smartindent
set fileformat=unix
set number
set ruler
set nowrap
syntax enable

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
  " MultiCursor Keymappings
  let g:multi_cursor_use_default_mapping=0
  let g:multi_cursor_start_word_key = '<C-d>'
  let g:multi_cursor_next_key = '<C-d>'
  let g:multi_cursor_quit_key = '<Esc>'

" KeyMaps - Insert Mode
  :imap jj <Esc>
