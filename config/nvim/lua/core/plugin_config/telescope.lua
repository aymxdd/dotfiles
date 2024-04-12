require('telescope').setup({ file_ignore_patterns = { "node%_modules/.*" } })
local builtin = require('telescope.builtin')
local latest = 0

vim.keymap.set('n', '<c-p>', function ()
    latest = 0
    builtin.find_files()
end, {})

vim.keymap.set('n', '<Space><Space>', function ()
    latest = 0
    builtin.find_files()
end, {})

vim.keymap.set('n', '<Space>fg', function ()
    if latest == 0 then
        latest = 1
        builtin.live_grep()
    else
        builtin.resume()
    end
end, {})

vim.keymap.set('n', '<Space>fh', function ()
    builtin.help_tags()
end, {})
