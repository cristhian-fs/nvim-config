return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      workspaces = {
        {
          name = "second-brain",
          path = "~/Documents/docs/second-brain/",
        },
      },
      notes_subdir = "notes",

      daily_notes = {
        folder = "inbox",
        date_format = "%Y-%m-%d",
        template = "Daily note",
				skip_weekends = false
      },

      templates = {
        folder = "../templates",
      },
      completion = {
        nvim_cmp = true,
      },
      note_id_func = function(title)
        if title then
          return title
        end
        return tostring(os.time())
      end,
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && pnpm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
