return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Ті самі іконки
      "MunifTanjim/nui.nvim",        -- Бібліотека для красивих UI компонентів
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true, -- Автоматично закривати Nvim, якщо залишилося тільки дерево
        window = {
          width = 30,
          mappings = {
            -- Вимикаємо дію на пробіл всередині дерева, оскільки це наш <leader>
            ["<space>"] = "none", 
          },
        },
        filesystem = {
          filtered_items = {
            visible = true, -- Показувати приховані файли (наприклад, .gitignore)
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
      })

      -- Гаряча клавіша для відкриття/закриття панелі (<leader>e - Explorer)
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle File Explorer', silent = true })
    end,
  }
}
