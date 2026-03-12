return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 15, -- Висота термінала, коли він відкривається знизу
      open_mapping = [[<C-\>]], -- Головна гаряча клавіша: Ctrl + \
      hide_numbers = true, -- Ховаємо номери рядків у терміналі (вони там не потрібні)
      shade_terminals = true, -- Робить фон термінала трохи темнішим за код, щоб візуально відділити
      shading_factor = 2,
      start_in_insert = true, -- Одразу переходити в режим вводу при відкритті
      insert_mappings = true, -- Дозволити відкривати/закривати термінал прямо під час вводу
      persist_size = true, -- Запам'ятовувати розмір, якщо ти його зміниш мишкою або клавішами
      direction = "horizontal", -- Може бути "horizontal", "vertical" або "float" (плаваюче вікно по центру)
      close_on_exit = true, -- Автоматично закривати вікно, якщо процес у терміналі завершився (наприклад, ти написав exit)
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Важлива магія для зручності:
      -- За замовчуванням у Nvim дуже незручно виходити з режиму термінала назад у код.
      -- Ця функція дозволяє використовувати стандартні клавіші навігації вікнами (Ctrl+w + hjkl),
      -- щоб перестрибнути з термінала назад у вікно з кодом, не закриваючи сам термінал.
      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts) -- Esc виводить з режиму вводу термінала
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- Застосовуємо ці зручні клавіші ТІЛЬКИ коли відкрито вікно термінала
      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
  }
}
