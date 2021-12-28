let g:airline_theme="light" 
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1    " enable tabline
let g:airline#extensions#tabline#buffer_nr_show=1    " 显示buffer行号
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_section_x = '%{ScrollStatus()}'
let g:airline_section_y = airline#section#create_right(['filetype'])
let g:airline_section_z = airline#section#create([
            \ '%#__accent_bold#%3l%#__restore__#/%L', ' ',
            \ '%#__accent_bold#%3v%#__restore__#/%3{virtcol("$") - 1}',
            \ ])
