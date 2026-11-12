return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
      --Keymap for opening ClaudeCode
      vim.keymap.set("n", "<leader>cc", "<cmd>ClaudeCode<CR>")
    require("claude-code").setup()
  end
}
