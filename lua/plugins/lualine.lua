return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Плагін для іконок
    config = function()
      require("lualine").setup({
        options = {
          -- Беремо кольори з нашої теми Tokyonight
          theme = "kanagawa", 
          -- Робимо дизайн трохи мінімалістичнішим
          component_separators = '|',
          section_separators = '',
          globalstatus = true, -- Одна статус-стрічка на всі вікна (дуже зручно)
        },
      })
    end,
  }
}
