-- Custom LÖVE plugin integration
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  {
    src = gh 'S1M0N38/love2d.nvim',
    version = vim.version.range '2.*',
  },
}

-- Create an autocommand that checks for a LÖVE project structure
local augroup = vim.api.nvim_create_augroup('Love2dConfig', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  group = augroup,
  callback = function(args)
    -- Only initialize if main.lua exists in the current project root
    if vim.fn.filereadable 'main.lua' == 1 then
      local ok, love2d = pcall(require, 'love2d')
      if ok then
        love2d.setup {
          path_to_love_bin = '~/Applications/love.app/Contents/MacOS/love',
        }

        -- Set buffer-local keymaps so they only apply to this project
        vim.keymap.set('n', '<leader>vv', '<cmd>LoveRun<CR>', { buffer = args.buf, desc = 'Run LÖVE', silent = true })
        vim.keymap.set('n', '<leader>vs', '<cmd>LoveStop<CR>', { buffer = args.buf, desc = 'Stop LÖVE', silent = true })
      end
    end
  end,
})
