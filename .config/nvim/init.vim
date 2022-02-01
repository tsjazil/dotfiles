let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

"float terminal

" Configuration example
let g:floaterm_keymap_new    = '<F3>'
"let g:floaterm_keymap_prev   = ''
"let g:floaterm_keymap_next   = ''
let g:floaterm_keymap_toggle = '<F5>'
autocmd Filetype c nnoremap <F7> :FloatermNew --autoclose=0 gcc % -o %< && ./%< <Return>


"auto save in vim

"let g:auto_save = 1  " enable AutoSave on Vim startup


"codelinting
let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}


set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'navarasu/onedark.nvim'
Plug 'dracula/vim'
Plug 'junegunn/goyo.vim'
Plug 'dense-analysis/ale'
Plug 'jreybert/vimagit'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'itchyny/lightline.vim'                       " Lightline statusbar
Plug 'mhinz/vim-startify'
Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'lukesmithxyz/vimling'
Plug 'voldikss/vim-floaterm'
Plug 'vimwiki/vimwiki'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug '907th/vim-auto-save'
"Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'


Plug 'ap/vim-css-color'
call plug#end()
""""""
highlight LineNr           ctermfg=4    ctermbg=none    cterm=none
highlight LineNr ctermfg=8
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=italic
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none

highlight CursorLine cterm=NONE ctermbg=NONE

"""""""
set ignorecase
set smartcase
set cursorline
set title
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd

"remapping


" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" vimling:
	nm <leader><leader>d :call ToggleDeadKeys()<CR>
	imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader><leader>i :call ToggleIPA()<CR>
	imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader><leader>q :call ToggleProse()<CR>

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "<c-r>%"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=dark
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

" remaping for Visual mode
 :nnoremap Q <c-v>

 " When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }
colorscheme catppuccin
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
" The lightline.vim theme
" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'catppuccin',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"Java Dev treesitter

"let g:nvim-treesitter ={
  "ensure_installed = "maintained",
  "highlight = {
    "enable = true,
  "},
"}




"startify


" STARTIFY {{{

let g:startify_files_number = 10
let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 0
let g:startify_padding_left = 4
let g:startify_session_autoload = 0
let g:startify_session_dir = '~/.vim/session'
" let g:startify_custom_header =
"             \ startify#pad(split(system('figlet -f chunky technicaldc'), '\n'))

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   BOOKMARKS:']      },
          \ { 'type': 'files',     'header': ['   RECENTS:']            },
          \ { 'type': 'dir',       'header': ['   CURRENT DIRECTORY: '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   SESSIONS:']       },
          \ { 'type': 'commands',  'header': ['   COMMANDS:']       },
          \ ]

let g:startify_bookmarks = [
		\ { 'f': '~/.filetype.vimrc' },
		\ { 'g': '~/github_token.md' },
		\ { 'v': '~/.vimrc' },
		\ { 'w': '~/vimwiki/index.wiki' },
		\ { 'z': '~/.zshrc' },
		\]

let g:startify_custom_header = [ "",
	\ "",
	\ "	███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗		",
	\ "	████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║      ",
	\ "	██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║      ",
	\ "	██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║      ",
	\ "	██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║		",
	\ "	╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝		",
	\ "",
	\ ]

let g:startify_custom_footer = ''

highlight StartifyBracket ctermfg=Green
highlight StartifySlash ctermfg=Green
highlight StartifyFile ctermfg=Yellow
highlight StartifySection cterm=Bold ctermfg=Red
highlight StartifySpecial ctermfg=Blue




" Function for toggling the bottom statusbar:
let s:hidden_all = 1
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>



" Automatically closing braces
inoremap {<CR> {<CR>}<Esc>ko<tab>
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

let s:pairs={
           \'<': '>',
           \'{': '}',
           \'[': ']',
           \'(': ')',
           \'«': '»',
           \'„': '“',
           \'“': '”',
           \'‘': '’',
       \}
 call map(copy(s:pairs), 'extend(s:pairs, {v:val : v:key}, "keep")')
 function! InsertPair(left, ...)
    let rlist=reverse(map(split(a:left, '\zs'), 'get(s:pairs, v:val, v:val)'))
   let opts=get(a:000, 0, {})
   let start   = get(opts, 'start',   '')
   let lmiddle = get(opts, 'lmiddle', '')
   let rmiddle = get(opts, 'rmiddle', '')
   let end     = get(opts, 'end',     '')
   let prefix  = get(opts, 'prefix',  '')
   let start.=prefix
   let rmiddle.=prefix
   let left=start.a:left.lmiddle
   let right=rmiddle.join(rlist, '').end
   let moves=repeat("\<Left>", len(split(right, '\zs')))
    return left.right.moves
    endfunction
noremap! <expr> {   InsertPair('{')
noremap! <expr>  [  InsertPair('[')
noremap! <expr>  (  InsertPair('(')
noremap! <expr>   < InsertPair('<')
noremap! <expr>   "q InsertPair('"')
noremap! <expr>   'q InsertPair("'")

"newly built misc
autocmd Filetype java inoremap ja;; import java.io.*;<Return>import java.util.*;<Return><Return>public class {<Enter><Enter><Tab>}<Up><Up><Left><Left><Space>

autocmd Filetype java inoremap sysp;; System.out.println("");<Left><Left><Left>

autocmd Filetype java inoremap pubst; public static void main(String[] args){<Enter>
