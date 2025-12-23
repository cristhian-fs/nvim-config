return {
  -- Allows cursor locations in the :e
  "lewis6991/fileline.nvim",
  -- Respects .editorconfig file
  "gpanders/editorconfig.nvim",
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",
  {
    "lewis6991/foldsigns.nvim",
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "❯ ",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          preview_width = 0.55,
        },
      },
      sorting_strategy = "ascending",
      winblend = 10,
      border = true,
      borderchars = {
        prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    },
    config = function()
      require("telescope").setup {}
    end,
  },
  {
    "dmtrkovalenko/project.nvim",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = { ".git", ".sl" },
        after_project_selection_callback = function()
          require("persistence").load()
        end,
      }
    end,
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
  { "akinsho/git-conflict.nvim", version = "*", config = true },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      {
        "<D-S-c>",
        function()
          require("toggleterm").toggle()
        end,
        desc = "Toggle Terminal (Floating)",
      },
    },
    opts = {
      open_mapping = [[<D-S-c>]],
      size = function(term)
        if term.direction == "float" then
          return 20 -- Height for floating terminal
        end
      end,
      highlights = {
        NormalFloat = {
          guibg = "#16181a",
        },
        FloatBorder = {
          guibg = "#16181a",
        },
      },
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end,
        winblend = 0,
      },
      direction = "float",
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gitsigns = require "gitsigns"
        local function gsmap(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        gsmap("n", "[<Home>", function()
          gitsigns.nav_hunk "prev"
        end, { remap = true, desc = "[G]o to [P]revious Hunk" })
        gsmap("n", "]<End>", function()
          gitsigns.nav_hunk "next"
        end, { remap = true, desc = "[G]it go to [N]ext Hunk" })
        gsmap("n", "<leader>gd", gitsigns.preview_hunk, { desc = "[G]it [D]iff Hunk" })
        gsmap("n", "<leader>gr", gitsigns.reset_hunk, { desc = "[G]it [R]eset hunk" })
        gsmap("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "[G]it [U]nstage hunk" })
        gsmap("n", "<leader>gs", gitsigns.stage_hunk, { desc = "[G]it [S]tage hunk" })
        gsmap("n", "<leader>gl", gitsigns.toggle_current_line_blame, { desc = "[G]it [B]lame" })
      end,
    },
  },

  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        highlight = {
          "WhiteSpace",
        },
        char = "┊",
      },
      scope = {
        show_start = false,
        show_end = false,
        char = "│",
        highlight = {
          "IndentBlanklineChar",
        },
      },
    },
  },

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

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    commit = "e76cb03",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require "harpoon"
      harpoon:setup {
        settings = {
          save_on_toggle = true,
          mark_branch = true,
          excluded_filetypes = { "harpoon", "NvimTree", "TelescopePrompt" },
        },
        projects = {
          ["$HOME/dev/"] = {
            mark = {
              marks = { "1", "2", "3", "4", "5" },
              sign = false,
              hl = "String",
              numhl = "Comment",
              size = 1,
              hidden = false,
              stacked = false,
            },
          },
        },
      }

      vim.keymap.set("n", "<leader>h", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { noremap = true, desc = "Harpoon view" })

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
      end, { noremap = true, desc = "Harpoon this path" })

      vim.keymap.set("n", "<leader>q", function()
        harpoon:list():select(1)
      end, { desc = "Harpoon #1" })
      vim.keymap.set("n", "<leader>w", function()
        harpoon:list():select(2)
      end, { desc = "Harpoon #2" })
      vim.keymap.set("n", "<leader>e", function()
        harpoon:list():select(3)
      end, { desc = "Harpoon #3" })
      vim.keymap.set("n", "<leader>r", function()
        harpoon:list():select(4)
      end, { desc = "Harpoon #4" })
    end,
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
  -- Autocompletion and version display for rust projects
  {
    "saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    opts = {
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Auto close brackets
  {
    "saghen/blink.pairs",
    version = "*", -- (recommended) only required with prebuilt binaries
    dependencies = "saghen/blink.download",
    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        -- you can call require("blink.pairs.mappings").enable()
        -- and require("blink.pairs.mappings").disable()
        -- to enable/disable mappings at runtime
        enabled = true,
        cmdline = true,
        -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
        -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
        disabled_filetypes = {},
        -- see the defaults:
        -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
        pairs = {},
      },
      highlights = {
        enabled = true,
        -- requires require('vim._extui').enable({}), otherwise has no effect
        cmdline = true,
        groups = {
          "BlinkPairsOrange",
          "BlinkPairsPurple",
          "BlinkPairsBlue",
        },
        unmatched_group = "BlinkPairsUnmatched",

        -- highlights matching pairs under the cursor
        matchparen = {
          enabled = true,
          -- known issue where typing won't update matchparen highlight, disabled by default
          cmdline = false,
          -- also include pairs not on top of the cursor, but surrounding the cursor
          include_surrounding = false,
          group = "BlinkPairsMatchParen",
          priority = 250,
        },
      },
      debug = false,
    },
  },
  -- Search and replace
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        mode = "n",
        "<D-S-r>",
        "<cmd>GrugFar<CR>",
      },
    },
    opts = {},
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      views = {
        cmdline_popup = {
          position = { row = 23 },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      notify = {
        view = "mini",
      },
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
      },
    },
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
    "dmtrKovalenko/caps-word.nvim",
    -- dir = "~/dev/caps-word.nvim",
    lazy = true,
    opts = {
      enter_callback = function()
        vim.notify("On", vim.log.levels.INFO, { title = "Caps Word:" })
      end,
      exit_callback = function()
        vim.notify("Off", vim.log.levels.INFO, { title = "Caps Word:" })
      end,
    },
    keys = {
      {
        mode = { "i" },
        "<C-s>",
        "<cmd>lua require('caps-word').toggle()<CR>",
      },
    },
  },
  -- {
  --   "andweeb/presence.nvim",
  --   config = function()
  --     require("presence").setup {
  --       auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
  --       neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
  --       main_image = "neovim", -- Main image display (either "neovim" or "file")
  --       log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
  --       debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
  --       enable_line_number = false, -- Displays the current line number instead of the current project
  --       blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
  --       buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  --       file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  --       show_time = true, -- Show the timer
  --
  --       -- Rich Presence text options
  --       editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
  --       file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
  --       git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
  --       plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
  --       reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
  --       workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
  --       line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
  --     }
  --   end,
  -- },
}
