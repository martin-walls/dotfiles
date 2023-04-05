local devicons = require("nvim-web-devicons")

-- When we open a buffer, get icon corresponding to the filetype, and
-- set the titlestring accordingly.
local titleGroup = vim.api.nvim_create_augroup("SetTitleString", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = titleGroup,
    callback = function (args)
        local buf = args.buf
        local name = vim.api.nvim_buf_get_name(buf)
        local basename = vim.fs.basename(name)
        local filetype = vim.fn.getbufvar(buf, "&filetype")
        local icon = devicons.get_icon(basename, filetype, { default = true })
        vim.opt.titlestring = icon.." %t%m"
    end
})

