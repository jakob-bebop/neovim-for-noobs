return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate<CR>',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {"lua", "python", "elixir", "heex", "eex", "angular", "typescript"}, -- only install parsers for elixir and heex
        -- ensure_installed = "all", -- install parsers for all supported languages
        highlight = {
          enable = true,
          disable = { },
        },
        indent = {
          enable = true,
          disable = { },
        },
      }
    end
  }
}
