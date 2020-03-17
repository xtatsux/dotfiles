" .vimrc
" created by tatsu
" created 2009/5/24
" updated 2012/7/20

"Basic "{{{1

"Color "{{{2
" colorscheme
syntax enable
"set background=dark
colorscheme hybrid




"Encoding "{{{2
" set enc=utf-8
set fenc=utf-8
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin



"Character "{{{2
"tab-character visible
set lcs=tab:>.,eol:$,trail:_,extends:\




"Filetype "{{{2
"Type of file indent configure
autocmd FileType c,cpp,perl set cindent
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
filetype plugin indent on




"Option "{{{2
set backspace=indent,eol,start
set autoindent
set autochdir
set incsearch
set list
set number
set showmatch
set smartcase
set smartindent
set smarttab
set whichwrap=b,s,h,l,<,>,[,]
set nobackup
set nowrapscan
set showcmd
set showmode
set title
set titlestring=Vim:\ %f\ %h%r%m
set wildmenu
set viminfo=<50,'10,h,r/a,n~/.viminfo
set ruler
set nocompatible
set tabstop=5
set iminsert=0
set imsearch=-1
set clipboard=unnamed


" ツールバーを削除
set guioptions-=T
"メニューを削除
set guioptions-=m







"Plugin Section "{{{1






"[unused]qfixhown "{{{2
"if has('win32') || has('win64')
"	set rtp+=C:\home\tatsu\vimfiles\qfixapp
"	let howm_dir = 'C:\Users\tatsuya-takahashi\Box\hown'
"elseif has('mac')
"	set rtp+=~/.vim/qfixapp
"	let howm_dir = '~/Dropbox/hown/'
"endif
"let QFixHown_Key = 'g'
"let howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
"let howm_fileencoding = 'utf-8'
"let howm_fileformat = 'unix'




"Ku shortcut "{{{2
map <Space> [Space]

map [Space]kb :Ku<Space>buffer<Return>
map [Space]kf :Ku<Space>file<Return>




"Memolist "{{{2
map [Space]mn :MemoNew<CR>
map [Space]ml :MemoList<CR>
map [Space]mg :MemoGrep<CR>

if has('win32') || has('win64')
	   let g:memolist_path = "C:\\Users\\tatsuya-takahashi\\Box Sync\\memo"
elseif has('mac')
	   let g:memolist_path = "/Users/tatsuya-takahashi/Box Sync/memo"
endif

let g:memolist_memo_suffix = "txt"
let g:memolist_qfixgrep = 1




"eskk "{{{2
if has('vim_starting')
  let g:eskk#directory = "~/.eskk"
  let g:eskk#dictionary = "~/Library/Application\ Support/AquaSKK/skk-jisyo.utf8"
  if has('mac')
    let g:eskk#large_dictionary = {
            'path': "~/SKK-JISYO.L",
            'sorted': 0,
            'encoding': 'euc-jp',
        }
  endif
endif

let g:eskk#egg_like_newline = 1



"Bundle Settings "{{{2
set nocompatible
filetype off

if has("win32") || has("win64")
  set rtp+=C:\home\tatsu\vimfiles\vundle.git\
  call vundle#rc('C:\home\tatsu\vimfiles\bundle')
else
  set rtp+=~/.vim/vundle.git/
  call vundle#rc()
endif

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-ref'
Bundle 'thinca/vim-quickrun'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'lambdalisue/vim-python-virtualenv'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'motemen/git-vim'
Bundle 'glidenote/memolist.vim'
Bundle 'tyru/eskk.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'itchyny/calendar.vim'

filetype plugin indent on




"calendar.vim Settings"{{{2
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1




"KeyMap "{{{1
"buffer toggle
map <silent>    <F2>    :bp<Return>
map <silent>    <F3>    :bn<Return>




"tab "{{{2

nnoremap <C-t> <Nop>

noremap <silent>    <C-t>n :tabnew<Return>
noremap <silent>    T     gT
noremap <silent> t gt




"skk "{{{2
map <silent> <C-j> i<C-j><Right>

"jump Section "{{{2
vnoremap <silent> ]]  :<C-u>call <SID>JumpSectionV(']]')<Return>
vnoremap <silent> ][  :<C-u>call <SID>JumpSectionV('][')<Return>
vnoremap <silent> [[  :<C-u>call <SID>JumpSectionV('[[')<Return>
vnoremap <silent> []  :<C-u>call <SID>JumpSectionV('[]')<Return>
onoremap <silent> ]]  :<C-u>call <SID>JumpSectionO(']]')<Return>
onoremap <silent> ][  :<C-u>call <SID>JumpSectionO('][')<Return>
onoremap <silent> [[  :<C-u>call <SID>JumpSectionO('[[')<Return>
onoremap <silent> []  :<C-u>call <SID>JumpSectionO('[]')<Return>

"NERD Tree "{{{2
nmap <Leader>n :NERDTreeToggle<CR>


" Misc.  "{{{2

nnoremap <C-h>  :h<Space>
nnoremap <C-o>  :e<Space>
nnoremap <C-w>.  :e .<Return>

noremap q <Nop>
noremap qa :quitall<Return>
noremap q :quit<Return>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

noremap ; :
noremap : ;






"Utilty "{{{1




"Automatic Update "{{{2
"if no operation unless 500msec , execute automatic update
autocmd CursorHold * call AutoUp()
autocmd CursorHoldI * call AutoUp()
set updatetime=500

function! AutoUp()
  if expand('%') != '' && !&readonly && &buftype == ''
    silent update
  endif
endfunction
"autowrite
set autowriteall

if !exists('s:loaded_my_vimrc')
  let s:loaded_my_vimrc = 1
endif

set secure

" Jump sections  "{{{2

" for normal mode.  a:pattern is '/regexp' or '?regexp'.
function! s:JumpSectionN(pattern)
  let pattern = strpart(a:pattern, '1')
  if strpart(a:pattern, 0, 1) == '/'
    let flags = 'W'
  else
    let flags = 'Wb'
  endif

  mark '
  let i = 0
  while i < v:count1
    if search(pattern, flags) == 0
      if stridx(flags, 'b') != -1
        normal! gg
      else
        normal! G
      endif
      break
    endif
    let i = i + 1
  endwhile
endfunction


" for visual mode.  a:motion is '[[', '[]', ']]' or ']['.
function! s:JumpSectionV(motion)
  execute 'normal!' "gv\<Esc>"
  execute 'normal' v:count1 . a:motion
  let line = line('.')
  let col = col('.')

  normal! gv
  call cursor(line, col)
endfunction


" for operator-pending mode.  a:motion is '[[', '[]', ']]' or ']['.
function! s:JumpSectionO(motion)
  execute 'normal' v:count1 . a:motion
endfunction

" create directory automatically
augroup vimrc-auto-mkdir
    autocmd!
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
    function! s:auto_mkdir(dir, force)
        if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endfunction
augroup END








"__END__ "{{{1
" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker commentstring="%s
