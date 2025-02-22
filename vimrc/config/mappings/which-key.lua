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

wk.add({
  ---------------------------------
  -- Git
  ---------------------------------
  { "<leader>g", group = "Git" },
  { "<leader>gc", cmd_str("Git commit"), desc = "Git Commit", mode = "n" },
  { "<leader>gw", cmd_str("Git write"), desc = "Git Write", mode = "n" },
  { "<leader>gb", cmd_str("Git blame"), desc = "Git Blame", mode = "n" },
  { "<leader>gs", cmd_str("Git status"), desc = "Git Status", mode = "n" },

  ---------------------------------
  -- File
  ---------------------------------
  { "<leader>f", group = "File" },
  { "<leader>ft", cmd_str("lua vim.fn.call('NERDTreeToggleInCurrentDirectory', {})"), desc = "Toggle Nerd Tree", mode = "n" },
  { "<leader>ff", cmd_str("NERDTreeFind"), desc = "Find Current Buffer", mode = "n" },
  { "<leader>fp", cmd_str("let @+ = expand('%')"), desc = "Copy Filepath to Clipboard", mode = "n" },

  ---------------------------------
  -- IDE
  ---------------------------------
  { "<leader>i", group = "IDE" },
  { "<leader>ir", group = "Refactor" },
  { "<leader>irr", vim.lsp.buf.rename, desc = "Rename Symbol", mode = "n" },
  { "<leader>irf", require("spectre").open_visual, desc = "Find & Replace in All Files", mode = "n" },

  { "<leader>ig", group = "Find" },
  { "<leader>igr", vim.lsp.buf.references, desc = "Find References", mode = "n" },
  { "<leader>igi", vim.lsp.buf.implementation, desc = "Find Implementation", mode = "n" },
  { "<leader>igd", vim.lsp.buf.definition, desc = "Find Definition", mode = "n" },
  { "<leader>igD", vim.lsp.buf.declaration, desc = "Find Declaration", mode = "n" },

  { "<leader>id", group = "Diagnostic" },
  { "<leader>idn", vim.diagnostic.goto_next, desc = "Next Diagnostic", mode = "n" },
  { "<leader>idp", vim.diagnostic.goto_prev, desc = "Previous Diagnostic", mode = "n" },

  ---------------------------------
  -- Language
  ---------------------------------
  { "<leader>l", group = "Language" },
  { "<leader>lp", group = "PHP" },
  { "<leader>lpb", cmd_str("call phpactor#ClassExpand()"), desc = "Expand Class", mode = "n" },
  { "<leader>lpc", cmd_str("call phpactor#CopyFile()"), desc = "Copy File", mode = "n" },
  { "<leader>lpd", cmd_str("call phpactor#GotoDefinition()"), desc = "Go To Definition", mode = "n" },
  { "<leader>lpe", cmd_str("call phpactor#ExtractMethod()"), desc = "Extract Method", mode = "n" },
  { "<leader>lpf", cmd_str("call phpactor#FindReferences()"), desc = "Find References", mode = "n" },
  { "<leader>lpk", cmd_str("call phpactor#ContextMenu()"), desc = "Menu", mode = "n" },
  { "<leader>lph", cmd_str("call phpactor#Hover()"), desc = "Hover", mode = "n" },
  { "<leader>lpi", cmd_str("call phpactor#ImportMissingClasses()"), desc = "Import Missing Classes", mode = "n" },
  { "<leader>lpl", cmd_str("call phpactor#ClassNew()"), desc = "New Class", mode = "n" },
  { "<leader>lpm", cmd_str("call phpactor#MoveFile()"), desc = "Move File", mode = "n" },
  { "<leader>lpn", cmd_str("call phpactor#Navigate()"), desc = "Navigate", mode = "n" },
  { "<leader>lpt", cmd_str("call phpactor#Transform()"), desc = "Complete Implementation", mode = "n" },
  { "<leader>lpu", cmd_str("call phpactor#UseAdd()"), desc = "Import Class/Trait Under Cursor", mode = "n" },

  { "<leader>lr", group = "Rust" },
  { "<leader>lrh", require("rust-tools").inlay_hints.set, desc = "Show Inlay Hints", mode = "n" },
})
