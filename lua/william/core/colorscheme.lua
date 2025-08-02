local function get_current_theme()
  local theme_file = os.getenv("HOME") .. "/.current_theme"
  local file = io.open(theme_file, "r")
  if file then
    local theme = file:read("*l")
    file:close()
    return theme
  end
  return "default" -- fallback
end

local theme = get_current_theme()
local status, _ = pcall(vim.cmd, "colorscheme " .. theme)
if not status then
  print("Colorscheme '" .. theme .. "' not found! Usando 'default'.")
  pcall(vim.cmd, "colorscheme default")
end

-- Função para ler a cor de fundo do arquivo
local function get_bg_color()
  local bg_file = os.getenv("HOME") .. "/.current_bgcolor"
  local file = io.open(bg_file, "r")
  if file then
    local color = file:read("*l")
    file:close()
    return color
  end
  return "#24283B" -- fallback
end

-- Autocmd para aplicar a cor de fundo sempre que o colorscheme mudar
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local bg = get_bg_color()
    vim.cmd("highlight Normal guibg=" .. bg .. " ctermbg=NONE")
    vim.cmd("highlight NormalNC guibg=" .. bg .. " ctermbg=NONE")
    vim.cmd("highlight EndOfBuffer guibg=" .. bg .. " ctermbg=NONE")
    vim.cmd("highlight LineNr guibg=" .. bg .. " ctermbg=NONE")
    vim.cmd("highlight SignColumn guibg=" .. bg .. " ctermbg=NONE")
    vim.cmd("highlight VertSplit guibg=" .. bg .. " ctermbg=NONE")
    vim.cmd("highlight StatusLine guibg=" .. bg)
    vim.cmd("highlight StatusLineNC guibg=" .. bg)
    vim.cmd("highlight NvimTreeNormal guibg=" .. bg)
    vim.cmd("highlight NvimTreeNormalNC guibg=" .. bg)
    vim.cmd("highlight NvimTreeEndOfBuffer guibg=" .. bg)
  end,
})

-- Executa o autocmd manualmente após carregar o tema
vim.cmd("doautocmd ColorScheme")
