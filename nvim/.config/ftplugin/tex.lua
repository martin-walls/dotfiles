vim.opt.foldmethod = "expr"

vim.opt.wrap = true

vim.opt.titlestring = "‭ﭨ %t%m"

-- Mappings
vim.keymap.set("v", "it", "xi\\textit{}<Esc>P")
vim.keymap.set("v", "em", "xi\\emph{}<Esc>P")
vim.keymap.set("v", "bf", "xi\\textbf{}<Esc>P")
vim.keymap.set("v", "tt", "xi\\texttt{}<Esc>P")
vim.keymap.set("v", "sc", "xi\\textsc{}<Esc>P")
vim.keymap.set("v", "mk", "xi$$<Esc>P")

-- AutoSave tex files 
local autoSaveGroup = vim.api.nvim_create_augroup("TexAutoSaveOnWrite", { clear = true })
vim.api.nvim_create_autocmd({ "TextChangedI" }, {
    pattern = {"*.tex", "*.bib"},
    group = autoSaveGroup,
    callback = function (args)
        local buf = args.buf
        -- Check that buffer isn't readonly and that the file is readable
        if vim.fn.getbufvar(buf, "&modifiable") == 1 and
            vim.fn.filereadable(vim.api.nvim_buf_get_name(buf)) then
            vim.cmd("silent! write")
        end
    end
})
