return {
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          -- Увімкнути для всіх сумісних мов
          enable_close = true,          -- Автоматично закривати теги
          enable_rename = true,         -- Синхронно перейменовувати відкриваючий і закриваючий теги
          enable_close_on_slash = true, -- Закривати тег при введенні />
        },
      })
    end,
  }
}
