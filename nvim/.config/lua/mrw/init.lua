-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use <Space> as the leader key
vim.g.mapleader = " "

-- Load a module, and don't stop execution if it throws an error.
local function safeRequire(module)
    local success, loadedModule = pcall(require, module)
    if success then
        return loadedModule
    end
    vim.notify("Error loading " .. module .. "\n\n")
end

safeRequire("mrw.lazy")
safeRequire("mrw.opts")
safeRequire("mrw.keymaps")
safeRequire("mrw.filetypes")
safeRequire("mrw.autocmds")
