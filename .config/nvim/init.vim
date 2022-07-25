" Vim-Plug          

"Plugin Section
call plug#begin()

"Theme
Plug 'folke/tokyonight.nvim'
"Language server (?)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python', 'coc-sh', 'coc-go', 'coc-rls', 'coc-yaml', 'coc-json']
"File explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/plenary.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()


""Config Section

"Theme
colorscheme tokyonight 

"File explorer
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"Integrated Terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

set number

" Cool Primeagen ripoffs 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set hidden
set noerrorbells
set scrolloff=8
set signcolumn=yes
set colorcolumn=80


" Telescope open
noremap <F2> :Telescope find_files<CR>
noremap <F3> :Ex<CR>
noremap <F4> :Telescope<CR>


" Switching between open buffers
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>


" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,     
    },
    incremental_selection = {
        enable = true,
    },
}
EOF
