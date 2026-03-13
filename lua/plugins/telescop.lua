return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master", -- Рекомендується використовувати стабільну гілку
    dependencies = {
      "nvim-lua/plenary.nvim", -- Обов'язкова бібліотека з корисними функціями
      -- Це розширення робить пошук у рази швидшим, використовуючи компільований код на C
      { 
        "nvim-telescope/telescope-fzf-native.nvim", 
        build = "make" 
      }
    },
    config = function()
      local telescope = require("telescope")
      
      telescope.setup({
        defaults = {
          -- Ігноруємо непотрібні папки при пошуку
          file_ignore_patterns = { ".git/", "build/", "node_modules/" },
          
          -- Налаштування вигляду вікна пошуку
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
          },
          sorting_strategy = "ascending",
        }
      })
      
      -- Завантажуємо швидкий пошук fzf
      pcall(telescope.load_extension, "fzf")

      -- Налаштування гарячих клавіш
      local builtin = require('telescope.builtin')
      
      -- <leader>ff (Find Files) - пошук файлів за назвою
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      
      -- <leader>fg (Find Grep) - пошук тексту всередині всіх файлів проєкту
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
      
      -- <leader>fb (Find Buffers) - пошук серед відкритих буферів
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      
      -- <leader>fh (Find Help) - пошук по документації Neovim
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
    end,
  }
}
