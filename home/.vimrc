" vim configuration file
" ---------------------------------------------------------------------
set nocompatible

if version >= 730 && version < 740
  " Prevent bad exit code on Mac OS X install
  " https://github.com/VundleVim/Vundle.vim/issues/167#issuecomment-55700048
  filetype on
endif

filetype off
com! -nargs=? Plugin
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle setup{{{
silent! call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
silent! call vundle#end()
" }}}

set laststatus=2         " Always show the status line

set title                " Set the terminal title
set visualbell           " Disable beeps
set directory=~/.vim/tmp " Keep swap files in one location

set nu                   " Displays line numbers
set tabstop=2            " Set tabs length to 2
set shiftwidth=2
set encoding=utf-8       " Use UTF-8 Encoding
syntax enable            " Enables Syntax Highlighting
filetype plugin indent on

" Colorscheme {{{
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set background=dark
" }}}

" vim-airline {{{
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#format = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
" }}}

" Twig Syntax Highlighting {{{
au BufRead,BufNewFile *.twig setfiletype htmldjango
" }}}

" Ruby syntax for additional files (i.e Capistrano) {{{
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby
" }}}

" JSON Syntax Highlighting {{{
autocmd BufNewFile,BufRead *.json set ft=json
augroup json_autocmd
	autocmd!
	autocmd FileType json set autoindent
	autocmd FileType json set formatoptions=tcq2l
	autocmd FileType json set textwidth=78 shiftwidth=2
	autocmd FileType json set softtabstop=2 tabstop=2
	autocmd FileType json set expandtab
	autocmd FileType json set foldmethod=syntax
augroup END
" }}}

" Git Commit Messages {{{
autocmd FileType gitcommit set expandtab shiftwidth=2 softtabstop=2
" }}}

" {{{ Automatically remove all trailing whitespace
autocmd FileType c,cpp,java,php,js,ebuild,gitcommit autocmd BufWritePre * :%s/\s\+$//e
" }}}

" vim:foldmethod=marker:foldlevel=0
