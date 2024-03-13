local utils = {}

--- Sets all relevant properties for setting the indent width.
---@param width integer: The indent width to set
---@param opts? table: Options for setting the indent width
---@field global boolean: Whether to set the indent width globally using vim.opt rather than vim.opt_local
utils.indent_width = function(width, opts)
    opts = opts or {}
    opts.global = opts.global or false

    local opt = vim.opt_local
    if opts.global then
        opt = vim.opt
    end

    opt.tabstop = width
    opt.softtabstop = width
    opt.shiftwidth = width
end

return utils
