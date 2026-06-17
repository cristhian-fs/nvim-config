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
          path = "~/Documents/vault/second-brain",
        },
      },
      notes_subdir = "notes",
      daily_notes = {
        folder = "inbox",
        date_format = "%Y-%m-%d",
        template = "Daily note",
        skip_weekends = false,
      },
      templates = {
        folder = "templates",
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
      ui = {
        enabled = false,
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    opts = {
      window = {
        width = 1.0, -- 100% da janela
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("render-markdown").setup {
        code = {
          conceal_delimiters = false,
        },
        dash = {
          enabled = false,
        },
        checkbox = {
          enabled = false,
          right_pad = 0,
        },
        link = {
          enabled = false,
        },
        win_options = {
          conceallevel = {
            rendered = 0,
          },
        },
      }
    end,
  },
  { "iamcco/markdown-preview.nvim", build = "cd app && npm install" },
}
