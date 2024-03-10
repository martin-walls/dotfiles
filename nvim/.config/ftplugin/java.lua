local map = require("mrw.utils").mapUnique

-- Run the Javadoc code action if available
map("n", "<leader>jd", function()
    vim.lsp.buf.code_action({
        filter = function(code_action)
            if string.match(code_action.title, "Javadoc") then
                return true
            else
                return false
            end
        end,
        apply = true,
    }, { desc = "Add Javadoc" })
end)
