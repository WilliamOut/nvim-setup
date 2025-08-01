local opt = vim.opt --for conciseness

-- line numbers
opt.relativenumber = false
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false


-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

--appearance 
opt.termguicolors = true
-- opt.background = "dark"
vim.g.nord_disable_background = true
-- remove fundo das áreas principais
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight LineNr guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])

opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitright = true

opt.iskeyword:append("-")


