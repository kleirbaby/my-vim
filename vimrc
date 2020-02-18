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

" install vim-plug if need

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plug list

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sensible'

" YCM
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
call plug#end()
