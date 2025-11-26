-- Load .vimrc
vim.cmd([[runtime .vimrc]])
local nvim_version = vim.version()

if vim.version.gt(nvim_version, { 0, 11, 0 }) then
  vim.lsp.config.typescript = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript" } -- { "js", "ts", "jsx", "tsx" }
  }
  vim.lsp.enable({
    'typescript',
  })
end

-- https://nvim-mini.org/mini.nvim/readmes/mini-snippets.html#quickstart
-- local gen_loader = require('mini.snippets').gen_loader
-- require('mini.snippets').setup({
--  snippets = {
--    -- Load custom file with global snippets first (adjust for Windows)
--    gen_loader.from_file('~/.config/nvim/snippets/global.json'),
--
--    -- Load snippets based on current language by reading files from
--    -- "snippets/" subdirectories from 'runtimepath' directories.
--    gen_loader.from_lang(),
--  },
-- })
