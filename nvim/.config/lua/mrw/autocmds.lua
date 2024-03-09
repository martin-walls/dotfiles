-- When yanking text, briefly highlight the section of text that was yanked.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight the text that was yanked",
    group = vim.api.nvim_create_augroup("HighlightAfterYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Auto-save files when leaving a buffer
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
                if
                    vim.fn.getbufvar(bufnr, "&modifiable") == 1
                    and vim.fn.filereadable(vim.api.nvim_buf_get_name(bufnr))
                then
                    -- Run the `write` cmd for the specific buffer to save
                    vim.api.nvim_buf_call(bufnr, function()
                        vim.cmd("silent! write")
                    end)
                end
            end,
        })
    end,
})

local devicons = require("nvim-web-devicons")

-- When we open a buffer, get icon corresponding to the filetype, and
-- set the titlestring accordingly.
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = vim.api.nvim_create_augroup("SetTitleString", { clear = true }),
    callback = function(args)
        local buf = args.buf
        local name = vim.api.nvim_buf_get_name(buf)
        local basename = vim.fs.basename(name)
        local filetype = vim.fn.getbufvar(buf, "&filetype")
        local icon = devicons.get_icon(basename, filetype, { default = true })
        vim.opt.titlestring = icon .. " %t%m"
    end,
})
