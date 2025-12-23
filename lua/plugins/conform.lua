return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          require("conform").format()
        end,
      })
    end,
  },
}

