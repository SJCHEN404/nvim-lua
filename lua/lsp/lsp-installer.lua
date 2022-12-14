local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("nvim-lsp-installer don't exists")
    return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }

  if server.name == "clangd" then
    local clangd_opts = require("lsp.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  -- if server.name == "jsonls" then
  --   local jsonls_opts = require("user.lsp.settings.jsonls")
  --   opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  -- end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end


    -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
