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
