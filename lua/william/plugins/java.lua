local jdtls_status, jdtls = pcall(require, "jdtls")
if not jdtls_status then
  return
end

local home = os.getenv("HOME")

-- Define a raiz do projeto de forma mais simples e direta.
-- Ele usa o diretório atual do Neovim como a raiz do projeto,
-- o que é ideal para o seu caso, onde cada pasta em Documentos/
-- é um projeto separado.
local root_dir = vim.fn.getcwd()

-- Define o diretório do workspace do jdtls com base na raiz do projeto.
-- Isso garante que o jdtls use um workspace consistente para todo o projeto.
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":t")

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", home .. "/.local/share/nvim/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar",
    "-configuration", home .. "/.local/share/nvim/jdtls/config_linux",
    "-data", workspace_dir,
  },
  root_dir = root_dir, -- Usa a nova variável root_dir
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "org.junit.jupiter.api.Assumptions.*",
          "org.junit.jupiter.api.DynamicContainer.*",
          "org.junit.jupiter.api.DynamicTest.*"
        }
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        useBlocks = true,
      },
    },
  },
  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)