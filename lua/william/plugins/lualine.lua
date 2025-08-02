local status, lualine = pcall(require, "lualine")
if not status then
  return
end

local function get_current_theme()
  local theme_file = os.getenv("HOME") .. "/.current_theme"
  local file = io.open(theme_file, "r")
  if file then
    local theme = file:read("*l")
    file:close()
    return theme
  end
  return "auto" -- fallback
end

local function get_lualine_theme()
  local theme = get_current_theme()
  if theme == "catppuccin-mocha" or theme == "catppuccin-latte" or theme == "catppuccin-frappe" or theme == "catppuccin-macchiato" then
    return "catppuccin"
  end
  return theme
end

lualine.setup({
  options = {
    theme = get_lualine_theme(),
  }
})
