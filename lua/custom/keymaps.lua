vim.api.nvim_create_user_command('PackUpdate', function() vim.pack.update() end, {})
vim.keymap.set('n', '<leader>pu', '<cmd>lua vim.pack.update()<CR>', { desc = '[P]ack [U]pdate' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function(args)
    vim.keymap.set('n', 'gK', function() vim.cmd('Man 3 ' .. vim.fn.expand '<cword>') end, { buffer = args.buf, desc = 'Man Page (libc)' })
  end,
})
