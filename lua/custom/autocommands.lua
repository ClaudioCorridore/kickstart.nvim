-- Spell check for git commit messages
local spell_group = vim.api.nvim_create_augroup('kickstart-spellcheck', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = spell_group,
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
  end,
})

-- Set 2 spaces indentation for C / C++ files to match autoformat (clang-format)
local c_indent_group = vim.api.nvim_create_augroup('c-indentation', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = c_indent_group,
  pattern = { 'c', 'cpp' },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

