return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- Завантажуємо тільки коли відкриваємо реальні файли
    opts = {
      -- Дефолтні налаштування вже чудові, він зберігатиме сесії в ~/.local/state/nvim/sessions/
      dir = vim.fn.stdpath("state") .. "/sessions/",
      -- Що саме запам'ятовувати (буфери, вікна, вкладки, термінали)
      options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
    },
    config = function(_, opts)
      require("persistence").setup(opts)

      -- Налаштовуємо гарячі клавіші для керування сесіями
      -- s - Session
      vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Відновити сесію для цієї папки" })
      vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Відновити останню сесію взагалі" })
      vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Зупинити збереження сесії (при виході)" })
    end,
  }
}
