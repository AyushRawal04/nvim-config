vim.keymap.set("n", "<space>pv", vim.cmd.Ex)
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("i", "<C-H>", "<C-w>")
vim.keymap.set("n", "<space>nh", vim.cmd.noh)
vim.keymap.set('t', '<C-b>', [[<C-\><C-n>]], { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<space>cd', function()
  -- 1. Grab the full, absolute path of the current buffer
  local current_file = vim.api.nvim_buf_get_name(0)

  -- 2. If it's an empty buffer or a special window, gracefully exit
  if current_file == "" then
    print("No active file path found in this buffer!")
    return
  end

  -- 3. Extract the directory name from the file path
  local current_buffer_dir = vim.fn.fnamemodify(current_file, ':p:h')
  
  -- 4. Force copy it to the external system clipboard
  vim.fn.setreg('+', current_buffer_dir)
  print("Buffer directory copied: " .. current_buffer_dir)
end, { desc = "Copy current buffer's directory to clipboard" })
