-- Allow typos when saving and quitting
local wq = function()
  vim.cmd 'wq'
end

local w = function()
  vim.cmd 'w'
end

local q = function()
  vim.cmd 'q'
end

vim.api.nvim_create_user_command('WQ', wq, {})
vim.api.nvim_create_user_command('Wq', wq, {})
vim.api.nvim_create_user_command('W', w, {})
vim.api.nvim_create_user_command('Q', q, {})

return {}
