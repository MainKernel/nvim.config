return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Плагін завантажиться у фоні після старту Nvim, щоб не уповільнювати запуск
    opts = {
      -- Дефолтні налаштування вже дуже хороші, але тут можна налаштувати затримку
      delay = 300, -- Час у мілісекундах до появи підказки (за замовчуванням 500)
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      -- Тут ми можемо дати назви "групам" клавіш, щоб меню виглядало логічно
      -- Наприклад, ми знаємо, що всі команди Telescope починаються з <leader>f
      wk.add({
        { "<leader>f", group = "Пошук (Telescope)" },
        { "<leader>c", group = "Код (LSP)" },
        { "<leader>g", group = "Git" },
        { "<leader>b", group = "Буфери" },
	{ "<leader>q", group = "Сесії/Вихід" },
	{ "<leader>s", group = "Пошук (Search)"},
      })
    end,
  }
}
