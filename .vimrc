" basic setting

!mkdir ~/.vim/test
source ~/.vim/basic/basic.vim

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

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" NERDTree，文件浏览器
Plug 'preservim/nerdtree'
map <F2> :NERDTreeToggle<CR>
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 一个异步执行shell命令的工具
Plug 'skywind3000/asyncrun.vim'
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 代码检查工具
Plug 'dense-analysis/ale'

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 修改比较(git,svn)
Plug 'mhinz/vim-signify'
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 增加的CPP语法高亮
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 模糊搜索函数、文件...
Plug 'Yggdroot/LeaderF'
map <F3> :LeaderfFunction!<CR> 
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" 切换头文件和源文件
Plug 'vim-scripts/a.vim'
map <F4> :A<CR>
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
" gdb
"Plug 'vim-scripts/Conque-GDB'
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
Plug 'powerline/powerline'
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""BEGIN"""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""

call plug#end()
