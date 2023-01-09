set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

call plug#begin()
	Plug 'dracula/vim'
	Plug 'preservim/nerdtree'
	Plug 'arcticicestudio/nord-vim' 
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme nord
