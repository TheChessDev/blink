# 🔁 blink.nvim

A minimal Neovim plugin for quickly marking and jumping between files — inspired by Vim's built-in marks and [Harpoon](https://github.com/ThePrimeagen/harpoon).

## ✨ Features

- Mark/unmark files with minimal keystrokes
- Loop forward/backward through marked files (`<leader>bn` / `<leader>bb`)
- Fuzzy find and jump to marks using Telescope

## 📦 Installation (with lazy.nvim)

```lua
{
  "TheChessDev/blink",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local blink = require("blink")
    require("telescope").load_extension("blink")

    vim.keymap.set("n", "<leader>bm", blink.mark_current_file, { desc = "Blink: Mark current file" })
    vim.keymap.set("n", "<leader>bu", blink.unmark_current_file, { desc = "Blink: Unmark current file" })
    vim.keymap.set("n", "<leader>bn", blink.blink_forward, { desc = "Blink: Next mark" })
    vim.keymap.set("n", "<leader>bb", blink.blink_back, { desc = "Blink: Previous mark" })
    vim.keymap.set("n", "<leader>bl", function()
      require("blink.ui").open()
    end, { desc = "Blink: List marks in Telescope" })
  end,
}
```
