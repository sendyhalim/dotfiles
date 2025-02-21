local lsp_status = require('lsp-status')
local lsp_installer = require('mason')
local mason = require('mason')
local mason_lsp_config = require('mason-lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- The following example advertise capabilities to `clangd`.
require('lspconfig').clangd.setup {
  capabilities = capabilities,
}


-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'



---------------------------------
-- Neovim autocompletion setup
---------------------------------
local cmp = require 'cmp'
local has_any_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'buffer' },
    { name = 'path' },
  },
}


---------------------------------
-- Register lsp status
---------------------------------
lsp_status.register_progress()
lsp_status.config({
  status_symbol = '🔮',
  component_separator = ' • ',
  indicator_separator = ' ',
  indicator_ok = '🏖',
  indicator_info = '📗',
  indicator_warnings = '📙',
  indicator_errors = '📕',
  indicator_hint = '💡'
})

local lsp_servers = {
  'clangd', -- C lang
  'dockerls',
  'intelephense', -- php
  'lua_ls',
  'rust_analyzer',
  'yamlls',
  -- 'vuels', -- Vue language server
}

mason.setup()
mason_lsp_config.setup {
  ensure_installed = lsp_servers,
  automatic_installation = true
}

require('lspconfig').clangd.setup {}
require('lspconfig').dockerls.setup {}
require('lspconfig').intelephense.setup {}
require('lspconfig').lua_ls.setup {}
require('lspconfig').rust_analyzer.setup {}
require('lspconfig').yamlls.setup {}
-- require('lspconfig').vuels.setup {}

-- Rust
-- Setup rust tool, you need to install rust-analyzer manually
-------------------------------------------------------
local rustTools = require('rust-tools')

rustTools.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
-------------------------------------------------------

-- TODO: Maybe move to mappings.vim
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

local noremap_opt = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', noremap_opt)
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', noremap_opt)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', noremap_opt)
vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', noremap_opt)

vim.api.nvim_set_keymap(
  'n',
  '[d',
  '<Cmd>lua vim.diagnostic.goto_prev()<CR>',
  noremap_opt
)

vim.api.nvim_set_keymap(
  'n',
  ']d',
  '<Cmd>lua vim.diagnostic.goto_next()<CR>',
  noremap_opt
)
