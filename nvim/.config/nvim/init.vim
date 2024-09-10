set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set mouse+=a
set scrolloff=8
set nohls
set guifont=Monaco:h32

set autoread
au CursorHold * checktime  
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-surround'

Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'tpope/vim-repeat'


" LSP Support
Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

let mapleader = " "
nnoremap <leader>x :!chmod +x %<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
vnoremap <leader>y "+y
nnoremap <leader>Y ggvG"+y
nnoremap <leader>q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>p "_dP
nnoremap <leader>l <C-^>
nnoremap <leader>g :G<CR>
nnoremap <leader>vr :sp $MYVIMRC<cr>
noremap <leader>dg :diffget<cr>
noremap <leader>dp :diffput<cr>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>pf :Files<CR>
noremap <C-p> :GFiles<CR>
nnoremap <C-Tab> :bn<CR>
nnoremap <C-W>/ :vnew<cr>
nnoremap <C-W>- :new<cr>

autocmd VimResized * :wincmd =
"autocmd BufReadPost fugitive://* set bufhidden=delete

"autocmd User fugitive \
"  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
"  \   nnoremap <buffer> .. :edit %:h<CR> |
"  \ endif

nnoremap <silent> - :e %:h<CR>

colorscheme codedark
set splitbelow
set splitright

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P


lua <<EOF
local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.setup()

EOF



"lua require('firenvim')
"
"
"
"

if exists('g:started_by_firenvim') && g:started_by_firenvim
  function! s:setup_firenvim() abort
    set filetype=markdown
    set noruler noshowcmd
    set laststatus=0 showtabline=0
    set lines=100
    set columns=100

  endfunction

  augroup firenvim
    autocmd!
    autocmd FileType text call s:setup_firenvim()
  augroup END
endif
