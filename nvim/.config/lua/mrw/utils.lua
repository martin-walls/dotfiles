local M = {}

-- Automatically applies the "unique = true" option to the mapping.
-- The unique option can be set manually to override this.
--
-- Using this wrapper function to create keymaps will automatically throw an error
-- if the same keymapping is defined twice. This will help catch bugs early!
M.mapUnique = function(modes, lhs, rhs, opts)
    if not opts then
        opts = {}
    end
    if opts.unique == nil then
        opts.unique = true
    end

    -- using pcall makes the error messages shorter by not showing the whole trace
    pcall(vim.keymap.set, modes, lhs, rhs, opts)
end

return M
