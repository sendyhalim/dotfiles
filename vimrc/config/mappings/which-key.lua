local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

local function cmd_str(cmd)
  return string.format('<cmd>%s<cr>', cmd);
end

wk.register({
  g = {
    name  = 'Git',
    c =  {cmd_str('Git commit'), 'Git Commit'},
    w = {cmd_str('Git write'), 'Git Write'},
    b =  {cmd_str('Git blame'), 'Git Blame'},
    s = {cmd_str('Git status'), 'Git Status'}
  },
  f = {
    name = 'file', -- optional group name
    t = {cmd_str('call NERDTreeToggleInCurrentDirectory()'), 'Toggle Nerd Tree'},
    f = {cmd_str('NERDTreeFind'), 'Find current buffer'}
  },
  i = {
    name = 'IDE',
    r = {
      name = 'Refactor',
      r = { vim.lsp.buf.rename, 'Rename symbol'},
    },
  },
  l = {
    name = 'language',
    p = {
      name = 'php',
      b = {cmd_str('call phpactor#ClassExpand()'), 'ExpandClass'},
      c = {cmd_str('call phpactor#CopyFile()'), 'Copy file'},
      d = {cmd_str('call phpactor#GotoDefinition()'), 'Go to definition'},
      e = {cmd_str('call phpactor#mxtractMethod()'), 'Extract method'},
      f = {cmd_str('call phpactor#FindReferences()'), 'Find references'},
      k = {cmd_str('call phpactor#ContextMenu()'), 'Menu'},
      h = {cmd_str('call phpactor#Hover()'), 'Hover'},
      i = {cmd_str('call phpactor#ImportMissingClasses()'), 'Import missing classes'},
      l = {cmd_str('call phpactor#ClassNew()'), 'New class'},
      m = {cmd_str('call phpactor#MoveFile()'), 'Move file'},
      n = {cmd_str('call phpactor#Navigate()'), 'Navigate'},
      t = {cmd_str('call phpactor#Transform()'), 'Complete implementation'},
      u = {cmd_str('call phpactor#UseAdd()'), 'Import class/trait under cursor'},
    }
  }
}, { prefix = "<leader>" })
