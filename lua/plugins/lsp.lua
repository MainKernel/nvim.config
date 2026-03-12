-- Language Server Configuration

return {
	{

		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "clangd", "lua_ls" },
			})


		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		-- C setup
		vim.lsp.config('clangd',{
			cmd = {'clangd'},
			-- filetypes used by lsp
			filetypes = { 'c', 'cpp', 'objc', 'objcpp'},
			-- files that indicates nvim that this is a root dir for the project
			root_markers = { 'compile_commands.json', '.git'},
			capabilities = capabilities,
		})

		vim.lsp.config('lua_ls', {
			cmd = { 'lua-language-server'},
			filetypes = { 'lua' },
			root_markers = { '.git' },
		})

		-- Enable lsp servers
		vim.lsp.enable('clangd')
		vim.lsp.enable('lua_ls')

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc = "Hover documentation"})
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {desc = "Rename symbol"})
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = "Code actios"})
	end,
}
}
