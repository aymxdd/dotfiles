local telescope = require('telescope')

telescope.setup({ file_ignore_patterns = { "node%_modules/.*", "go.sum" } })
telescope.load_extension("live_grep_args")

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
        telescope.extensions.live_grep_args.live_grep_args()
    else
        builtin.resume()
    end
end, {})

vim.keymap.set('n', '<Space>fh', function ()
    builtin.help_tags()
end, {})
