return { 
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Плагін завантажиться лише тоді, коли ти перейдеш у режим вводу (Insert mode)
    dependencies = {
      -- Джерела автодоповнення
      "hrsh7th/cmp-nvim-lsp", -- Отримує підказки від нашого LSP (clangd, lua_ls)
      "hrsh7th/cmp-buffer",   -- Пропонує слова, які вже є у відкритих буферах
      "hrsh7th/cmp-path",     -- Допомагає дописувати шляхи до файлів (зручно для #include)
      
      -- Рушій сніпетів (обов'язковий компонент)
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip", -- Міст між LuaSnip та nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        -- Вказуємо, який рушій сніпетів використовувати
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        -- Налаштування гарячих клавіш для віконця автодоповнення
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Прокрутити документацію вгору
          ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Прокрутити документацію вниз
          ['<C-Space>'] = cmp.mapping.complete(),  -- Примусово викликати меню підказок
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Підтвердити вибір через Enter
          
          -- Використовуємо Tab для переміщення по списку або переходу по полях сніпета
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        
        -- Порядок джерел (пріоритетність)
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- Найвищий пріоритет для розумних підказок коду
          { name = 'luasnip' },  -- Далі йдуть сніпети
        }, {
          { name = 'buffer' },   -- Якщо попередні не дали результату, шукаємо у тексті
          { name = 'path' },
        })
      })
    end,
  }
}
