return {
  {
    "lewis6991/foldsigns.nvim",
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      winopts = {
        height = 0.85,
        width = 0.70,
        row = 0.35,
        col = 0.50,
        border = "single",
        backdrop = 100,
        title = "Fzf",
        title_pos = "left",
        fullscreen = false,
        treesitter = {
          enabled = true,
          fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" },
        },
        preview = {
          border = "single",
          wrap = false,
          hidden = false,
          vertical = "down:45%",
          horizontal = "right:60%",
          layout = "flex",
          flip_columns = 100,
          title = true,
          title_pos = "left",
          scrollbar = "float",
          scrolloff = -1,
          delay = 20,
          winopts = {
            number = true,
            relativenumber = false,
            cursorline = true,
            cursorlineopt = "both",
            signcolumn = "no",
            foldenable = false,
          },
        },
      },
    },
    config = function(_, opts)
      local fzf = require "fzf-lua"
      fzf.setup(opts)

      vim.keymap.set("n", "ff", fzf.files, { desc = "Find files" })
      vim.keymap.set("n", "fg", fzf.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "fb", fzf.buffers, { desc = "Find buffers " })
      vim.keymap.set("n", "fz", function()
        fzf.live_grep { search = "", rg_opts = "--fixed-strings" }
      end, { desc = "Fuzzy grep alt" })
      vim.keymap.set("n", "fc", function()
        fzf.grep_cword()
      end, { desc = "Search current word" })
    end,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        mode = "n",
        "<leader>ch",
        "<cmd>ClaudeCode<CR>",
        desc = "Claude Code",
      },
    },
    opts = {
      command = "awsclaude",
      window = {
        split_ratio = 0.4,
        enter_insert = false,
        position = "rightbelow",
      },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      {
        mode = "n",
        "<leader>u",
        "<cmd>UndotreeToggle<CR>",
      },
    },
    config = function()
      vim.g.undotree_WindowLayout = 3 -- Right layout
      vim.g.undotree_SplitWidth = 40 -- Width of the undotree window
      vim.g.undotree_SetFocusWhenToggle = 1 -- Focus on the undotree window when toggled
    end,
  },
  { "chentoast/marks.nvim", event = "VeryLazy", opts = {} },
  {
    "vyfor/cord.nvim",
    opts = {},
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup {
        keymaps = {
          -- Disable all default mappings
          useDefaults = false,
        },
      }

      -- Custom keymappings for subword text objects
      vim.keymap.set({ "o", "x" }, "iqw", function()
        require("various-textobjs").subword "inner"
      end)
      vim.keymap.set({ "o", "x" }, "aqw", function()
        require("various-textobjs").subword "outer"
      end)
    end,
  },
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    opts = {},
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
    },
  },

  -- A lightbulb highlight for code actions
  {
    "kosayoda/nvim-lightbulb",
    lazy = false,
    config = function()
      require("nvim-lightbulb").setup {
        autocmd = { enabled = true },
      }
    end,
  },
  -- Auto close brackets
  -- {
  --   "windwp/nvim-autopairs",
  --   event = "InsertEnter",
  --   opts = {
  --     enable_check_bracket_line = false,
  --   },
  --   init = function()
  --     local npairs = require "nvim-autopairs"
  --     local rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --
  --     npairs.add_rules { rule("|", "|", { "rust", "go", "lua" }):with_move(cond.after_regex "|") }
  --   end,
  -- },
  -- Search and replace
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      need = 1,
      branch = false,
    },
    init = function()
      vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
    end,
  },
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
  },
}
