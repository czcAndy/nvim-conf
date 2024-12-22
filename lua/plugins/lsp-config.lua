return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup({
				automatic_setup = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",

		config = function()
			local lspconf = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconf.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconf.clangd.setup({})
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>Gd", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, {})
		end,
	},
}
