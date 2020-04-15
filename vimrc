" basic setting

set nu
set showmode
set showcmd
set encoding=utf-8
set autoindent
set ts=4
set ruler
set showmatch
set smartcase
set mouse=a

" install vim-plug if need

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 插件管理器

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sensible'

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 自动生成ctags文件
Plug 'ludovicchabant/vim-gutentags'

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 代码补全
function! BuildYCM(info)
" info is a dictionary with 3 fields   
" - name:   name of the plugin
" - status: 'installed', 'updated', or 'unchanged'
" - force:  set on PlugInstall! or PlugUpdate!
if a:info.status == 'installed' || a:info.force
	!./install.py
endif
endfunction

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" NERDTree，文件浏览器
Plug 'preservim/nerdtree'
map <F2> :NERDTreeToggle<CR>
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""
call plug#end()
