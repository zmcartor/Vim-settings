set nocompatible
set autoindent
set visualbell
set number
set ruler
syntax on

" Whitespace stuff
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Command-T configuration
let g:CommandTMaxHeight=20

" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=79
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color solarized

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
set guioptions=aAce
noremap <C-P> ^[:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
set gfn=Monaco:h14
" makes ,w split windows vertically
 nnoremap <leader>w <C-w>v<C-w>l

" " split window navigation
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l
"one less key to type.
nnoremap ; : 

"ESC is PITA sometimes"
inoremap jk <ESC>
"set <leader> p to do syntax check"
map <Leader>p :!php -l %<CR>
" Show syntax highlighting groups for word under cursor
"" nmap <C-S-P> :call <SID>SynStack()<CR>
 ""function! <SID>SynStack()
  "" if !exists("*synstack")
   ""    return
    ""     endif
     ""      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val,"name")')
      ""     endfunc
" Folding and unfolding
  let g:user_zen_expandabbr_key = '<c-z>'


  " Bubble single lines
   nmap <C-Up> ddkP
   nmap <C-Down> ddp
   " Bubble multiple lines
   vmap <C-Up> xkP`[V`]
   vmap <C-Down> xp`[V`]

   " Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    ""SyntasticEnable php
    ""SyntasticEnable javascript
    ""SyntasticEnable ruby
	let g:syntastic_enable_signs=1
    let g:syntastic_auto_loc_list=1
   let g:syntastic_quiet_warnings=1
