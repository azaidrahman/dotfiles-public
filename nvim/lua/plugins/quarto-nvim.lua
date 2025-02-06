return {
  {
    'quarto-dev/quarto-nvim',
    dependencies = {
      'jmbuhr/otter.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      debug = false,
      closePreviewOnExit = true,
      lspFeatures = {
        enabled = true,
        chunks = 'curly',
        languages = { 'r', 'python', 'julia', 'bash', 'html' },
        diagnostics = {
          enabled = true,
          triggers = { 'BufWritePost' },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = false,
        default_method = 'molten', -- 'molten' or 'slime'
        ft_runners = { python = 'molten' }, -- filetype to runner, ie. `{ python = "molten" }`.
        -- Takes precedence over `default_method`
        never_run = { 'yaml' }, -- filetypes which are never sent to a code runner
      },
    },
  },
}
