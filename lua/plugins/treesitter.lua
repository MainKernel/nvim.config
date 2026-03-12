return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Захищений виклик. Якщо модуль не знайдено, Nvim не впаде з помилкою.
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return -- Просто виходимо і чекаємо, поки lazy.nvim його докачає
      end

      configs.setup({
        ensure_installed = { 
          "c", 
          "cpp", 
          "lua", 
          "vim", 
          "vimdoc", 
          "bash",
          "markdown",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  }
}
