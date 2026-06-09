-- Custom LÖVE plugin integration for the upstream vim.pack-based config.

local function gh(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add {
  {
    src = gh 'S1M0N38/love2d.nvim',
    version = vim.version.range '2.*',
  },
}

local ok, love2d = pcall(require, 'love2d')
if ok then
  love2d.setup {
    path_to_love_bin = '~/Applications/love.app/Contents/MacOS/love',
  }
end

vim.keymap.set('n', '<leader>vv', '<cmd>LoveRun<CR>', { desc = 'Run LÖVE', silent = true })
vim.keymap.set('n', '<leader>vs', '<cmd>LoveStop<CR>', { desc = 'Stop LÖVE', silent = true })
