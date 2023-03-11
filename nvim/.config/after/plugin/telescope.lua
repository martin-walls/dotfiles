local builtin = require('telescope.builtin')
-- Search all files in project
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- Search all files in the git repo
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Grep for a search string
vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
