-- nomodeline

-- Modelines are a security threat
-- See https://github.com/numirias/security/blob/master/doc/2019-06-04_ace-vim-neovim.md
vim.opt.modelines = 0
vim.opt.modeline = false

-- Do not enable per-directory .vimrc files
vim.opt.exrc = false
-- and disable unsafe commands in them (just in case)
vim.opt.secure = true

return {}
