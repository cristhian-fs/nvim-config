return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gs", "<cmd>:tab Git<cr>", desc = "Git status" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
    { "<leader>gd", "<cmd>Git diff<cr>", desc = "Git diff" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
    { "<leader>gg", "<cmd>GBrowse<cr>", desc = "Git repo" },
  },
}
