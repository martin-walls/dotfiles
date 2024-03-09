--  ┌─────────────────────────────────┐
--  │ Auto-save when leaving a buffer │
--  └─────────────────────────────────┘
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = vim.api.nvim_create_augroup("SetUpBufferAutoSave", { clear = true }),
    callback = function(args)
        local bufnr = args.buf
        -- Create buffer-local autocmd to autosave
        vim.api.nvim_create_autocmd({ "BufLeave" }, {
            group = vim.api.nvim_create_augroup("AutoSaveBuffer", { clear = true }),
            buffer = bufnr,
            callback = function()
                -- Check that buffer isn't readonly and that the file is readable
                if vim.fn.getbufvar(bufnr, "&modifiable") == 1 and
                    vim.fn.filereadable(vim.api.nvim_buf_get_name(bufnr)) then
                    -- Run the `write` cmd for the specific buffer to save
                    vim.api.nvim_buf_call(bufnr, function()
                        vim.cmd("silent! write")
                    end)
                end
            end
        })
    end
})
