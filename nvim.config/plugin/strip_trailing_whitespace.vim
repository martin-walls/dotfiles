" Automatically strip trailing whitespace from the
" ends of lines on saving
augroup StripTrailingWhitespace
  au!
  au BufWritePre * %s/\s\+$//e
augroup END
