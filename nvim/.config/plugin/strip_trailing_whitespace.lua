local augroup = vim.api.nvim_create_augroup("StripTrailingWhitespace", { clear = true })
-- Strip trailing whitespace when leaving a buffer or quitting.
-- Don't do on save, because auto-save saves every time we exit insert mode, that might get annoying
-- if we still want the whitespace cos we haven't finished.
vim.api.nvim_create_autocmd({ "BufLeave", "QuitPre" }, {
    group = augroup,
    callback = function (args)
        local buf = args.buf
        -- Check that buffer isn't readonly and that the file is readable
        if vim.fn.getbufvar(buf, "&modifiable") == 1 and
            vim.fn.filereadable(vim.api.nvim_buf_get_name(buf)) then
            vim.cmd("%s/\\s\\+$//e")
        end
    end
})
