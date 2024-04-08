return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig",
    opts = {
      ensure_installed = { "tsserver", "lua_ls", "angularls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig").tsserver.setup({
        capabilities = capabilities,
      })
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
      })
      require("lspconfig").angularls.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig").util.root_pattern("angular.json", "playwright.config.ts", ".git"),
      })

      -- To instead override globally
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      local border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      }
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", ':Telescope lsp_references<CR>')
    end,
  },
}
