local vgit = require("vgit")

vgit.setup({
    settings = {
        live_blame = {
            enabled = false,
        },
        scene = {
            diff_preference = "split",
        },
    },
    keymaps = {
        ["n <leader>gd"] = function() vgit.project_diff_preview() end,
    },
})
