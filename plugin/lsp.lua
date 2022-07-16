local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
   return
end

local lsp_signature_ok, lsp_signature = pcall(require, "lsp_signature")
if not lsp_signature_ok then
   return
end

local cwd = vim.loop.cwd

local on_attach = function(client, bufnr)

  lsp_signature.on_attach({
    bind = true,
    floating_window = false,
    handler_opts = {
      border = "single"
    }
  }, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = {
    prefix = '',
    indent = 2,
    format = function(diagnostic) return string.format('// %s', diagnostic.message) end,
  },
  signs = true,
  severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
vim.lsp.handlers.hover,
{ border = "single" }
)
 
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true 
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "detail",
        "documentation",
        "additionalTextEdits",
    },
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Don't forget to install the server language via npm
-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
}) 

-- npm i -g vscode-langservers-extracted
lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
})

-- npm install -g emmet-ls
lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
})

-- npm i -g vscode-langservers-extracted
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
})
 
-- npm install -g vls
lspconfig.vuels.setup ({
  capabilities = capabilities,
  on_attach = on_attach, 
  root_dir = cwd, 
})

-- npm install -g intelephense
lspconfig.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
  root_dir = cwd, 
})
 