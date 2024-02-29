-- AutoSave typst files
local autoSaveGroup = vim.api.nvim_create_augroup("TypstAutoSaveOnWrite", { clear = true })
vim.api.nvim_create_autocmd({ "TextChangedI", "TextChanged", "InsertLeave", "BufLeave" }, {
    pattern = { "*.typ" },
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
