" 设置
set number
set numberwidth=2
set tabstop=4
let mapleader="`"

" 欢迎猫
echo "welcom,master! >^.^<"

" 键盘映射
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" 校正字词
iabbrev 欧洋 欧阳
