" turns on syntax highlighting
syntax on

" turn on pathogen
execute pathogen#infect()

" enable filetype plugins for nerdcommenter
filetype plugin on

" preferred spacing
set shiftwidth=2
set tabstop=2
set expandtab

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType cucumber setlocal shiftwidth=2 tabstop=2 expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType c setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript,javascriptreact,javascript.jsx setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType scheme setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType tf setlocal shiftwidth=2 tabstop=2 expandtab

" js auto formatting
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#print_width = '80'
let g:prettier#config#tab_width = '2'
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#jsx_single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'

" invisibles
set listchars=tab:».,trail:▒

" no haxx if no modeline support
set modelines=0

" maps
map <leader>p :set paste!<CR>
map <leader>l :set list!<CR>
map <leader>b :call Pdb()<CR>
map <leader>a :AIEdit Take hints from context or comment, and modify the code accordingly.<CR>
map <leader>ac :AIChat<CR>
map <leader>ai :AIEdit If this is a code block, then tidy, make it idiomatic, and make it lint-free. Avoid trailing whitespace.<CR>
map <leader>as :AIEdit Fix grammar and spelling; retain leading spacing.<CR>

" themes/colors
color desert

" functions
function! Pdb()
    let trace = expand("import pdb; pdb.set_trace()")
    execute "normal o".trace
endfunction

" terraform indentation
let g:terraform_align = 1
map <leader>= :EasyAlign=<CR>

" ycm needs to use the homebrew clang
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

"set list!

" vim-go language server settings
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'

" This prompt instructs model to work with syntax highlighting
let s:initial_chat_prompt =<< trim END
>>> system

You are a general assistant with a specialization in Hashicorp products, python3, Golang, Ansible, Prometheus, React (ECMA), and Markdown.
If you attach a code block add syntax type after ``` to enable syntax highlighting.
If you see a TODO: item, substitute an implementation if you can.
END

" :AIChat
" - options: openai config (see https://platform.openai.com/docs/api-reference/chat)
" - options.initial_prompt: prompt prepended to every chat request (list of lines or string)
" - options.request_timeout: request timeout in seconds
" - options.enable_auth: enable authorization using openai key
" - options.selection_boundary: seleciton prompt wrapper (eliminates empty responses, see #20)
" - ui.populate_options: put [chat-options] to the chat header
" - ui.open_chat_command: preset (preset_below, preset_tab, preset_right) or a custom command
" - ui.scratch_buffer_keep_open: re-use scratch buffer within the vim session
" - ui.paste_mode: use paste mode (see more info in the Notes below)

" Notes:
" ui.paste_mode
" - if disabled code indentation will work but AI doesn't always respond with a code block
"   therefore it could be messed up
" - find out more in vim's help `:help paste`
" options.max_tokens
" - note that prompt + max_tokens must be less than model's token limit, see #42, #46
" - setting max tokens to 0 will exclude it from the OpenAI API request parameters, it is
"   unclear/undocumented what it exactly does, but it seems to resolve issues when the model
"   hits token limit, which respond with `OpenAI: HTTPError 400`
let g:vim_ai_chat = {
\  "engine": "complete",
\  "options": {
\    "enable_auth": 1,
\    "endpoint_url": "https://api.openai.com/v1/chat/completions",
\    "initial_prompt": s:initial_chat_prompt,
\    "model": "GPT-4o",
\    "max_tokens": 4096,
\    "request_timeout": 15,
\    "selection_boundary": "#####",
\    "temperature": 0.15,
\    "open_chat_command": "preset_below",
\    "code_syntax_enabled": 1,
\    "populate_options": 0,
\    "scratch_buffer_keep_open": 0,
\  },
\  "ui": {
\    "paste_mode": 1,
\  },
\}
