; Delimiter groups for rainbow-delimiters.nvim
; TODO: pull request to upstream

(group
  "(" @delimiter
  ")" @delimiter @sentinel) @container

(block
  "{" @delimiter
  "}" @delimiter @sentinel) @container

(content
  "[" @delimiter
  "]" @delimiter @sentinel) @container

(math
  "$" @delimiter
  "$" @delimiter @sentinel) @container
