local lsp_status = require('lsp-status')
local lsp_installer = require('nvim-lsp-installer')
local lsp_installer_servers = require('nvim-lsp-installer.servers')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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



---------------------------------
-- Install & setup language servers
---------------------------------
lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

local function optionally_install_and_setup_servers()
  -- Now we're going to hardcode the installations for each LSPs
  -- NOTE for rust we're using https://github.com/simrat39/rust-tools.nvim which
  -- will configure lsp server automatically so we cannot set it up manually here
  -- since it'll cause conflict.
  local lsp_servers = {
    'intelephense', -- php
    'sumneko_lua',
    'tsserver', -- typescript
    'dockerls',
    'yamlls',
    'clangd', -- C lang
  }

  for _, lsp_server in pairs(lsp_servers) do
    local server_available, requested_server = lsp_installer_servers.get_server(lsp_server)

    if server_available then
      requested_server:on_ready(function ()
        local opts = {} -- Assumes empty option for each lsp as of now

        requested_server:setup(opts)
      end)

      if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
      end
    end
  end
end

optionally_install_and_setup_servers()

-- Rust
-- Setup rust tool
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
