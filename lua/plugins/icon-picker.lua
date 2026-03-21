return {
  {
    "ziontee113/icon-picker.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "stevearc/dressing.nvim" -- Робить вікно вибору красивим і сучасним
    },
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })

      -- Гаряча клавіша для Normal mode (Пробіл + i)
      vim.keymap.set("n", "<leader>i", "<cmd>IconPickerNormal<cr>", { desc = "Вибрати іконку" })
      
      -- Гаряча клавіша для Insert mode (Ctrl + i) - вставляє іконку прямо під час друку!
      vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", { desc = "Вставити іконку" })
    end,
  }
}
