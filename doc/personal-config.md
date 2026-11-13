# Personal configuration

## Weekly plugin updates

On the first interactive launch after seven days, plugins managed by `vim.pack`
are updated automatically, without a confirmation buffer. The first attempt runs
three seconds after attaching the UI. Existing version constraints and
`PackChanged` build hooks still apply. Restart Neovim to load the updated code;
check `:messages` for update or build failures.

The last attempt is recorded in `stdpath('state')/pack-update-attempt`. Failed
attempts also count toward the seven-day interval so opening Neovim offline does
not repeatedly trigger updates. Use `:PackUpdate` or `<leader>pu` to retry manually.
Headless sessions do not trigger automatic updates. Mason tools are not included.

To disable automatic updates, set `vim.g.weekly_package_updates = false` in
`lua/custom/init.lua` before requiring `custom.package_updates`.
