; edited copy of ~/.local/share/nvim/lazy/nvim-treesitter/queries/gitcommit/highlights.scm
;
; Changes:
; - Removed the highlight rule for subject overflow

(comment) @comment

(generated_comment) @comment

(title) @markup.heading

; (text) @none
(branch) @markup.link

(change) @keyword

(filepath) @string.special.url

(arrow) @punctuation.delimiter

(subject) @markup.heading @spell

(subject
  (subject_prefix) @function @nospell)

(prefix
  (type) @keyword @nospell)

(prefix
  (scope) @variable.parameter @nospell)

(prefix
  [
    "("
    ")"
    ":"
  ] @punctuation.delimiter)

(prefix
  "!" @punctuation.special)

(message) @spell

(trailer
  (token) @label)

; (trailer (value) @none)
(breaking_change
  (token) @comment.error)

(breaking_change
  (value) @none @spell)

(scissor) @comment