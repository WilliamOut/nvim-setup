local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return  
end

treesitter.setup({
    highlight = {
        enable = true
    },
    ident = {
        enable = true
    },
    autotag = {
        enable = true
    },
    ensure_installed = {
        "json",
        "cpp",
        "c",
        "dockerfile",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "bash",
        "lua",
        "vim",
        "gitignore",
        "php"
    },
    auto_install = true,
})