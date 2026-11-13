-- Limit automatic update attempts to once every seven days, including offline failures.
local interval = 7 * 24 * 60 * 60
local stamp = vim.fs.joinpath(vim.fn.stdpath 'state', 'pack-update-attempt')

vim.api.nvim_create_autocmd('UIEnter', {
  group = vim.api.nvim_create_augroup('custom-weekly-package-updates', { clear = true }),
  once = true,
  callback = function()
    vim.defer_fn(function()
      if vim.g.weekly_package_updates == false then return end

      local last_attempt = 0
      if vim.fn.filereadable(stamp) == 1 then last_attempt = tonumber(vim.fn.readfile(stamp)[1]) or 0 end
      local now = os.time()
      if now - last_attempt < interval then return end

      local ok, err = pcall(function()
        vim.fn.mkdir(vim.fn.fnamemodify(stamp, ':h'), 'p')
        if vim.fn.writefile({ tostring(now) }, stamp) ~= 0 then error 'Could not record package update attempt' end
        vim.notify 'Running weekly plugin updates…'
        vim.pack.update(nil, { force = true })
        vim.notify 'Weekly plugin update attempt finished. See :messages for results; restart Neovim to load updated plugins.'
      end)
      if not ok then vim.notify('Weekly plugin update failed: ' .. tostring(err), vim.log.levels.ERROR) end
    end, 3000)
  end,
})
