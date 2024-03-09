-- When yanking text, briefly highlight the section of text that was yanked.
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight the text that was yanked",
    group = vim.api.nvim_create_augroup("HighlightAfterYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end
})
