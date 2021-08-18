local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')



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
lspinstall.setup()

local function optionally_install_servers()
  -- Now we're going to hardcode the installations for each LSPs
  local languages = {
    'rust',
    'php',
    'python',
    'lua',
    'typescript',
    'dockerfile',
    'json',
    'yaml',
  }

  for _, server_language in pairs(languages) do
    if not lspinstall.is_server_installed(server_language) then
      lspinstall.install_server(server_language)
    end
  end
end

local function setup_servers()
  local servers = lspinstall.installed_servers()

  for _, server in pairs(servers) do
    lspconfig[server].setup{}
  end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
lspinstall.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd('bufdo e') -- this triggers the FileType autocmd that starts the server
end

optionally_install_servers()
setup_servers()



---------------------------------
-- Neovim autocompletion setup
---------------------------------
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-n>'
  elseif check_back_space() then
    return t '<Tab>'
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t '<C-p>'
  else
    return t '<S-Tab>'
  end
end

-- TODO: Maybe move to mappings.vim
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

local noremap_opt = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', noremap_opt)
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', noremap_opt)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', noremap_opt)
