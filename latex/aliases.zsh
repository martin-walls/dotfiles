#  ┌───────────────┐
#  │ LaTeX Aliases │
#  └───────────────┘
alias latexcompile='latexmk -xelatex -shell-escape -verbose -file-line-error -interaction=nonstopmode -pvc -pvctimeout'
alias latexclean='latexmk -c'
alias latexwc='texcount -inc -total -sum'
