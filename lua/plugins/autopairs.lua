return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- Завантажуємо лише коли починаємо вводити текст
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true, -- Дозволяємо плагіну використовувати Treesitter для розуміння контексту
      })

      -- Інтеграція з nvim-cmp (автоматично додає дужки після вибору функції з меню)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local status_ok, cmp = pcall(require, "cmp")
      if status_ok then
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  }
}
