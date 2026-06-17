return {
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
      preset = "helix",
    },
    config = function()
      local wk = require "which-key"
      wk.add {
        { "<leader>h", group = "harpoon" },
        { "<leader>b", group = "buffers" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>o", group = "Obsidian" },
        { "<leader>l", group = "LSP" },
      }
    end,
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
  {
    "tpope/vim-abolish",
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup()

      -- add the current file
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { desc = "Add buffer to harpoon" })

      -- open menu
      vim.keymap.set("n", "<leader>h", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "List harpoon buffers" })

      vim.keymap.set("n", "<leader>x", function()
        harpoon:list():remove()
      end, { desc = "Remove current buffer from harpoon" })
      -- direct navigation - the 4 slots
      vim.keymap.set("n", "<leader>1", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon slot 1" })
      vim.keymap.set("n", "<leader>2", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon slot 2" })
      vim.keymap.set("n", "<leader>3", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon slot 3" })
      vim.keymap.set("n", "<leader>4", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon slot 4" })
    end,
  },
  {
    "echasnovski/mini.bufremove",
    config = function()
      local bufremove = require "mini.bufremove"
      bufremove.setup()

      vim.keymap.set("n", "<leader>bd", function()
        bufremove.delete(0, false) -- false = pede confirmação se tiver mudanças
      end, { desc = "Delete buffer with confirmation" })
      vim.keymap.set("n", "<leader>bD", function()
        bufremove.delete(0, true) -- força, ignora mudanças
      end, { desc = "Delete buffer within confirmation" })
    end,
  },
}
