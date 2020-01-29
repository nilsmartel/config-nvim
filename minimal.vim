" Coc installed files are:
"
" https://github.com/weirongxu/coc-explorer
"
" :CocInstall coc-explorer
"
" https://github.com/fannheyward/coc-rust-analyzer
"
" :CocInstall coc-rust-analyzer
"
"
" Binaries required
"
"   # Rust Analyzer
"
"   git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
"   rustup component add rust-src
"   cargo xtask install --server
"
"   # fzy
"   brew install fzy

call plug#begin()
    " Git
    Plug 'tpope/vim-fugitive'

    " Formatting related
    Plug 'chiel92/vim-autoformat'
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'
    Plug 'rstacruz/vim-closer'
    Plug 'tpope/vim-surround'

    " Finding and Opening Files
    Plug 'cloudhead/neovim-fuzzy'

    " Usefull to see in realtime which parts a regex will hit
    Plug 'osyo-manga/vim-over'

    " Live editing
    Plug 'jpalardy/vim-slime'
    Plug 'mattn/webapi-vim'

    " Syntax and Themes
    Plug 'liuchengxu/space-vim-theme'
    Plug 'morhetz/gruvbox'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'arzg/vim-colors-xcode', { 'as': 'xcode' }
    Plug 'doums/darcula'

    " Status Bar
    Plug 'vim-airline/vim-airline'

    " Languager Server & linter
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'w0rp/ale'
    " Plug 'zxqfl/tabnine-vim'

    " Language agnostic
    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'petRUShka/vim-opencl'

    Plug 'vim-scripts/vim-auto-save'
call plug#end()

" Mappings for convinience
nmap ø :CocAction<CR>
nmap <space>e :CocCommand explorer<CR>
nmap <space>r :OverCommandLine<CR>%s/
nmap <space>e :CocCommand explorer<CR>
nmap <space>f :FuzzyOpen<cr>
nmap <space>f :FuzzyGrep<cr>

" Color Scheme
colorscheme darcula
" set background=dark " use the dark Color Scheme

" Plugin Specific
    " Get Slime to work
let g:slime_target = "tmux"

    " Proper use of Selection
autocmd InsertLeave, CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Language Agnostic sources
au FileType go source ~/.config/nvim/configs/go.vim
au FileType rust source ~/.config/nvim/configs/rust.vim
au FileType julia source ~/.config/nvim/configs/julia.vim

source ~/.config/nvim/configs/ale.vim

" let g:airline_theme = "palenight"