" vim configuration file
" ---------------------------------------------------------------------

" Pathogen {{{
call pathogen#infect()   " pathogen loader
call pathogen#helptags()
call pathogen#infect('bundle/{}')
" }}}

set nocompatible         
set laststatus=2         " Always show the status line

set title                " Set the terminal title
set visualbell           " Disable beeps
set directory=~/.vim/tmp " Keep swap files in one location

set nu                   " Displays line numbers
set tabstop=2            " Set tabs length to 2
set shiftwidth=2
set encoding=utf-8       " Use UTF-8 Encoding

" Colorscheme {{{
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized
set background=dark
" }}}

" Powerline {{{
let g:Powerline_symbols = 'fancy'
set t_Co=256              "Explicitly tell vim to use 256 colors

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" }}}

syntax enable            " Enables Syntax Highlighting
filetype on
filetype plugin on 
filetype indent on

" Twig Syntax Highlighting {{{
au BufRead,BufNewFile *.twig setfiletype htmldjango
" }}}

" Pagodabox Boxfile {{{
au BufRead,BufNewFile Boxfile setfiletype yaml
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
au FileType gitcommit set expandtab shiftwidth=2 softtabstop=2
" }}}

" {{{ Automatically remove all trailing whitespace
autocmd FileType c,cpp,java,php,ebuild,gitcommit autocmd BufWritePre :%s/\s\+$//e
" }}}

" vim:foldmethod=marker:foldlevel=0
