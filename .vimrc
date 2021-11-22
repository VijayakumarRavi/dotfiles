" ============ "
" ===Basics=== "
" ============ "
syntax on
set noerrorbells 
set belloff=all
set expandtab 
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set autoindent
set laststatus=2
set encoding=UTF-8
set t_Co=256 
set undofile                      " Enable undo after reopening
set undodir='/tmp'                " Location to save the undo file

filetype plugin indent on

set clipboard+=unnamedplus
let windows = has('win32') || has('win64')
if windows
  set clipboard=unnamed
endif
let g:GuiInternalClipboard=1
set autoread autowrite

" formatting
set noexpandtab " http://lea.verou.me/2012/01/why-tabs-are-clearly-superior/
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent smartindent
set encoding=utf-8 nobomb
set whichwrap+=<,>,[,]
set virtualedit=block

" completion
set wildmenu wildmode=longest,full
set wildignore+=.hg,.git,.bzr,.svn " Version control
set wildignore+=*.aux,*.out,*.toc  " LaTeX
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.webp,*.otf,*.ttf,*.eot,*.woff
set wildignore+=*.luac,*.pyc,*.rbc,*.class,classes,*.min.*
set wildignore+=*.annot,*.cmi,*.cmo,*.cmt,*.cmti,*.cmx,*.dep " OCaml
set wildignore+=*.o,*.so,*.dylib,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.spl,*.sw?
set wildignore+=.DS_Store,Thumbs.db
set wildignore+=target,node_modules,build,dist,venv
set wildignore+=.cabal-sandbox,.hpc,.stack-work,__pycache__
set wildignore+=platforms,plugins



" Enable true colors
if exists('+termguicolors')
  " Necessary when using tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" File-types
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.txt set filetype=text

" Tabs
set sw=2 ts=2 sts=2 " Default
autocmd FileType html :setlocal sw=2 ts=2 sts=2
autocmd FileType ruby :setlocal sw=2 ts=2 sts=2
autocmd FileType javascript :setlocal sw=2 ts=2 sts=2
autocmd FileType xml :setlocal sw=2 ts=2 sts=2
autocmd FileType python :setlocal sw=4 ts=4 sts=4
autocmd FileType go :setlocal sw=4 ts=4 sts=4

" Make vertical separator pretty
highlight VertSplit cterm=NONE
set fillchars+=vert:\▏

" Get rid of unnecessary highlight for spelling
highlight clear SpellBad

" ============== "
" ===Mappings=== "
" ============== "
let mapleader = " "

" Pane navigation
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" For vim-terminal
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>
tnoremap <C-b> <C-\><C-n>

" Copy to system clipboard
noremap <leader>c "*yy<cr>

" Paste without indent
noremap<leader>v "+p<cr>

" fzf.vim
noremap <leader>p :Files<cr>
noremap <leader>g :GFiles<cr>
noremap <leader>b :Buffers<cr>
noremap <leader>f :Ag<cr>

" nerdtree
noremap <leader>e :NERDTreeToggle<cr>

" Custom cmd shortcuts
noremap <leader>/ :BTerm<cr>
noremap <leader>= <C-W><C-=>
noremap <leader>n gt
noremap <leader>N gT

" ============="
" ===Plugins==="
" ============="
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ggreer/the_silver_searcher'
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'tpope/vim-fugitive'
    Plug 'preservim/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'

    " colorschemes
    Plug 'srcery-colors/srcery-vim'
    Plug 'pacokwon/onedarkhc.vim'
    Plug 'bluz71/vim-moonfly-colors'
    Plug 'sainnhe/sonokai'
    Plug 'joshdick/onedark.vim'
    Plug 'yassinebridi/vim-purpura'
    Plug 'lifepillar/vim-wwdc16-theme'
    Plug 'tckmn/hotdog.vim'
    Plug 'rakr/vim-one'
    Plug 'olivertaylor/vacme'
    Plug 'julien/vim-colors-green'
    Plug 'morhetz/gruvbox'

    " Rust
    Plug 'rust-lang/rust.vim'
		Plug 'rust-lang/rls'
		Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Prettifier
    Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript'] }

call plug#end()

if $MODE == 'light'
  set background=light
else
  set background=dark
endif

let g:onedark_transparent_bg=1
colorscheme onedark
let g:airline_theme='onedark'

" Must come after colorscheme command
" Ensure the any colorscheme has transparent bg
hi Normal guibg=NONE ctermbg=NONE

" ============="
" PluginConfigs"
" ============="

" nerdtree
"let NERDTreeShowHidden = 1
let NERDTreeMinimalUI=1
autocmd BufEnter * if tabpagenr('$') == 1 
      \ && winnr('$') == 1 
      \ && exists('b:NERDTree') 
      \ && b:NERDTree.isTabTree()
      \ | quit | endif

" vim-nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

let g:NERDTreeSyntaxEnabledExtensions = ['rb', 'ruby']

" vim-devicons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jsx'] = 'ﰆ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = ''

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*vimrc.*'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.gitignore'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['package.lock.json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['node_modules'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['webpack\.'] = 'ﰩ'

let g:DevIconsEnableFoldersOpenClose = 1

" vim-airlines
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''

" fzf.vim
let g:fzf_colors= {
      \  'border': ['fg', 'Type' ],
      \  'gutter': ['fg', 'Type' ] }

" vim-prettier
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#print_width = '300'

" ============="
" ==CustomCmds="
" ============="

" Absolute path of open file to clipboard
function! Cwf()
    let @+=expand('%:p')
endfunction
command! Cwf call Cwf()

" Print working file_path
function! Pfp()
    echo expand('%')
endfunction
command! Pfp call Pfp()

" Relative path of open file to clipboard
function! Cwfr()
    let @+=expand('%')
endfunction
command! Cwfr call Cwfr()

" ex) :Tag h1
function! Tag(name)
    let @"="<" . a:name . "></" . a:name . ">"
    normal! pbbl
    startinsert
endfunction
command! -nargs=1 T call Tag(<f-args>)

" ex) :Jtag HelloWorld
function! Jtag(name)
    let @"="<" . a:name . " />"
    normal! pb
    startinsert
endfunction
command! -nargs=1 J call Jtag(<f-args>)

" Open up nerdtree and a bottom terminal
function In()
  execute "below term++rows=15"
  execute "NERDTreeToggle"
  execute "wincmd l"
endfunction
command! In call In()

" Open up a bottom terminal
function BTerm()
  execute "below term++rows=15"
endfunction
command! BTerm call BTerm()

function GColor()
  execute "echo synIDattr(synIDtrans(synID(line(\".\"), col(\".\"), 1)), \"fg#\")"
endfunction
command! GColor call GColor()

function F()
  execute "NERDTreeFind"
endfunction
command! F call F()

function LineUp()
  " There be a whitespace at the end of next line
  normal! ^dg_k$A 
  normal! pjdd
endfunction
command! LU call LineUp()

" commenting_blocks_of_code
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '//  '
  autocmd FileType bash,ruby,python let b:comment_leader = '#  '
  autocmd FileType conf,fstab,sh    let b:comment_leader = '#  '
  autocmd FileType tex              let b:comment_leader = '%  '
  autocmd FileType mail             let b:comment_leader = '>  '
  autocmd FileType vim              let b:comment_leader = '"  '
  autocmd FileType lua              let b:comment_leader = '--  '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


"  Remember cursor position --------
" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" | execute("normal `\"") | endif


" Misc
" https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function s:MkNonExDir(file, buf)
	if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
		let dir=fnamemodify(a:file, ':h')
		if !isdirectory(dir)
			call mkdir(dir, 'p')
		endif
	endif
endfunction
augroup BWCCreateDir
	autocmd!
	autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
