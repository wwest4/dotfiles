" turns on syntax highlighting
syntax on

" turn on pathogen
execute pathogen#infect()

" enable filetype plugins for nerdcommenter
filetype plugin on

" preferred spacing
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType c setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType scheme setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=4 tabstop=4 expandtab

" invisibles
set listchars=tab:».,trail:▒

set shiftwidth=4
set tabstop=4
set expandtab

" no haxx if no modeline support
set modelines=0

" maps
map <leader>p :set paste!<CR>
map <leader>l :set list!<CR>
map <leader>b :call Pdb()<CR>

" themes/colors
color desert

" functions
function! Pdb()
    let trace = expand("import pdb; pdb.set_trace()")
    execute "normal o".trace
endfunction
