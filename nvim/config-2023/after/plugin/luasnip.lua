local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")

luasnip.setup({
    enable_autosnippets = true,
    update_events = "TextChanged,TextChangedI",
    store_selection_keys = "<Tab>",
    region_check_events = "CursorMoved",
})

cmp.setup({

  mapping = {

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
})

-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/luasnip/"})

vim.keymap.set("n", "<leader>L", "<Cmd>lua require('luasnip.loaders.from_lua').load({paths = '~/.config/nvim/luasnip/'})<CR>")
