vim.opt.wrap = true

vim.opt.titlestring = "‭ﭨ %t%m"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Increase width of fold markers in the margin
vim.opt.foldcolumn = "4"

vim.opt_local.spell = true

-- AutoSave tex files
local autoSaveGroup = vim.api.nvim_create_augroup("TexAutoSaveOnWrite", { clear = true })
vim.api.nvim_create_autocmd({ "TextChangedI", "TextChanged", "InsertLeave", "BufLeave" }, {
    pattern = { "*.tex", "*.bib" },
    group = autoSaveGroup,
    callback = function(args)
        local buf = args.buf
        -- Check that buffer isn't readonly and that the file is readable
        if vim.fn.getbufvar(buf, "&modifiable") == 1 and
            vim.fn.filereadable(vim.api.nvim_buf_get_name(buf)) then
            vim.cmd("silent! write")
        end
    end
})

-- Global function to insert supo work template into file
function SupoWorkTemplate()
    vim.cmd("0r " .. vim.fn.stdpath('config') .. "/templates/supotemplate.tex")
end
