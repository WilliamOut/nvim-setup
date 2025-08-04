local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = false
opt.number = true

--cursor 
opt.guicursor = "n-v-c-sm:ver25,i-ci-ve:ver25,r-cr-o:ver25"
-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

-- tildes invisíveis no fim do buffer
opt.fillchars:append({ eob = " " })

-- lateral da esquerda
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- palavras com hífen como uma só
opt.iskeyword:append("-")

