return {
  {
    "williamboman/mason.nvim",
    config = function()
      require 'mason'.setup()
    end
  },
  {
    "williamboman/mason-lspconfig",
    opts = {
      ensure_installed = { "tsserver", "lua_ls", "angularls" },
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require 'lspconfig'.tsserver.setup{}
      require 'lspconfig'.lua_ls.setup{}
      require 'lspconfig'.angularls.setup{ root_dir = require'lspconfig'.util.root_pattern("angular.json", "playwright.config.ts", ".git") }
      vim.keymap.set('n', 'K', vim.lsp.buf.hover)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    end
  }
}

