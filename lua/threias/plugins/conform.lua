return { -- autoformat
  'stevearc/conform.nvim',
  event = { 'bufwritepre' },
  cmd = { 'CONFORMINFO' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. you can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        --
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua', stop_after_first = true },
      -- conform can also run multiple formatters sequentially
      python = { 'isort', 'black', stop_after_first = true },
      go = { 'gofumpt', stop_after_first = true },
      php = { 'php-cs-fixer', stop_after_first = true },
      --
      -- you can use 'stop_after_first' to run the first available formatter from the list
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
