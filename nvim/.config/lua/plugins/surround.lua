return {
    "kylechui/nvim-surround",
    opts = {
        keymaps = {
            normal = "<leader>s",
            -- Surround the entire current line
            normal_cur = "<leader>ss",
            -- Add the surrounding delimiters on a new line above/below
            normal_line = "<leader>S",
            -- Surround the entire current line with delimiters also on new lines
            normal_cur_line = "<leader>SS",
            visual = "<leader>s",
            -- Surround the entire current line
            visual_line = "<leader>S",
        },
    },
}
