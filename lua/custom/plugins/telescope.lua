return {
    {
	'nvim-telescope/telescope.nvim', version = '*',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    -- optional but recommended
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config =  function()
	    --Keymaps for basic fuzzy finding
	    vim.keymap.set("n", "<space>ff", require('telescope.builtin').find_files)
	    vim.keymap.set("n", "<space>fs", require('telescope.builtin').grep_string)
	    vim.keymap.set("n", "<space>fb", require('telescope.builtin').buffers)
	    -- Keymap to access all help tags via telescope
	    vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
	    --Keymap to access the nvim config files via telescope
	    vim.keymap.set("n", "<space>ec", function()
		require('telescope.builtin').find_files {
		    cwd = vim.fn.stdpath('config')
		}
		end
	    )
	    -- Keymap to access the plugin files inside lazy via telescope
	    vim.keymap.set("n", "<space>ep", function()
		require('telescope.builtin').find_files {
		    cwd = vim.fn.joinpath(vim.fn.stdpath('data'), "lazy")
		}
		end
	    )
	    -- Telescope setup
	require('telescope').setup{
	    defaults = {
		path_display = "filename_first",
		mappings = {
		    i = {
			["<C-c>"] = function()
			    vim.cmd("stopinsert")
			end,
		    },
		    n = {
			["<C-c>"] = require('telescope.actions').close,
		    },
		},
	    },
	    mappings = {
	    },
	    pickers = {
		find_files = {
		    theme = 'ivy',
		}
	    },
	    extensions = {
	    }
	}
	end,
    }
}
