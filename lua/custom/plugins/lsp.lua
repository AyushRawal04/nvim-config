return{
    {
	"neovim/nvim-lspconfig",
	dependencies = {
	    'saghen/blink.cmp',
	    {
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
		    library = {
			-- See the configuration section for more details
			-- Load luvit types when the `vim.uv` word is found
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		    },
		},
	    },
	},
	config = function()
	    local capabilities = require('blink.cmp').get_lsp_capabilities()
	    vim.lsp.config('*', {
		capabilities = capabilities
	})
	    vim.lsp.enable("lua_ls")
	    vim.lsp.enable("clangd")
	end,
    },
    vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = true,
    })
}
