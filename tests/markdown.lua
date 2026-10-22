-- Run: nvim --headless -c 'luafile tests/markdown.lua'
vim.cmd('edit README.md')
vim.api.nvim_buf_set_lines(0, 0, -1, false, { '```lua', 'print(1)', '```' })
local parser = vim.treesitter.get_parser(0, 'markdown')
assert(parser:parse(true))
assert(parser:children().lua, 'Fenced Lua block was not parsed')
assert(vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()])
print('Markdown highlighting and fenced-code parsing passed')
vim.cmd('qa!')
