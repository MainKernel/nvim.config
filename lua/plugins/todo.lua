-- TODO: some text
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" }, -- Плагін "прокинеться", коли відкриєш файл з кодом
    opts = {
      -- Дефолтні кольори та іконки вже налаштовані чудово,
      -- тому залишаємо блок налаштувань базовим.
    },
    config = function(_, opts)
      require("todo-comments").setup(opts)

      -- Гарячі клавіші для швидкого стрибання між TODO у відкритому файлі
      vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Наступний TODO коментар" })
      vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Попередній TODO коментар" })
      
      -- Інтеграція з Telescope: знайти всі TODO, FIXME, HACK по всьому проєкту
      vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Пошук TODO/FIXME" })
    end
  }
}
