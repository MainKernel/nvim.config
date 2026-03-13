-- Lazy download
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Синхронізація системного буфера обміну з Neovim
vim.opt.clipboard = "unnamedplus"

-- cheatsheet
vim.keymap.set('n', '<leader>?', ':vsplit ~/.config/nvim/cheatsheet.md<CR>', { desc = "Nvim cheatsheet" })

require("lazy").setup("plugins")

-- ==========================================
-- Автозбереження файлів
-- ==========================================
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "VimLeavePre" }, {
  desc = "Автоматично зберігати файл при закритті або втраті фокусу",
  callback = function()
    -- Перевіряємо, чи файл змінено, чи він не "тільки для читання" і чи має ім'я
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.cmd("silent! w")
    end
  end,
})

-- Додатково: змушує Nvim зберігати файли перед виконанням деяких команд (наприклад, перед збіркою)
vim.opt.autowriteall = true

-- ================================================================================================
-- 			Створення автоматичних шаблонів для різних типів файлів
-- ================================================================================================

-- Якщо створюється новий порожній файл з іменем 'Makefile', автоматично заповнити його шаблоном
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "Makefile",
  command = "0r ~/.config/nvim/templates/Makefile.c",
})
-- =================================================================================================
--                                  Зовнішній вигляд та інтерфейс
-- =================================================================================================
vim.opt.number = true         -- Показувати абсолютний номер на поточному рядку
vim.opt.relativenumber = true -- Показувати відносні номери для всіх інших рядків

-- Бонус: завжди показувати колонку зліва від цифр (SignColumn)
-- Це потрібно, щоб текст не "стрибав" вправо-вліво, коли там з'являються іконки помилок (LSP) або Git
vim.opt.signcolumn = "yes"
