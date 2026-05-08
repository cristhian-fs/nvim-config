return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      config = function()
        local select = require "nvim-treesitter-textobjects.select"
        local swap = require "nvim-treesitter-textobjects.swap"
        local move = require "nvim-treesitter-textobjects.move"

        require("nvim-treesitter-textobjects").setup {
          select = {
            lookahead = true,
          },
          move = {
            set_jumps = true,
          },
        }

        -- Select keymaps
        local select_maps = {
          ["ap"] = "@parameter.outer",
          ["ip"] = "@parameter.inner",
          ["au"] = "@attribute.outer",
          ["iu"] = "@attribute.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["as"] = "@statement.outer",
          ["is"] = "@statement.inner",
          ["av"] = "@assignment.outer",
          ["iv"] = "@assignment.inner",
          ["in"] = "@assignment.lhs",
        }
        for key, query in pairs(select_maps) do
          vim.keymap.set({ "x", "o" }, key, function()
            select.select_textobject(query, "textobjects")
          end)
        end

        -- Move keymaps
        local move_next_start = { ["]["] = "@function.outer", ["]c"] = "@class.outer" }
        local move_next_end = { ["]}"] = "@function.outer", ["]C"] = "@class.outer" }
        local move_prev_start = { ["[{"] = "@function.outer", ["[c"] = "@class.outer" }
        local move_prev_end = { ["[}"] = "@function.outer", ["[C"] = "@class.outer" }

        for key, query in pairs(move_next_start) do
          vim.keymap.set({ "n", "x", "o" }, key, function()
            move.goto_next_start(query, "textobjects")
          end)
        end
        for key, query in pairs(move_next_end) do
          vim.keymap.set({ "n", "x", "o" }, key, function()
            move.goto_next_end(query, "textobjects")
          end)
        end
        for key, query in pairs(move_prev_start) do
          vim.keymap.set({ "n", "x", "o" }, key, function()
            move.goto_previous_start(query, "textobjects")
          end)
        end
        for key, query in pairs(move_prev_end) do
          vim.keymap.set({ "n", "x", "o" }, key, function()
            move.goto_previous_end(query, "textobjects")
          end)
        end

        -- Swap keymaps
        vim.keymap.set("n", "<A-p>", function()
          swap.swap_next "@parameter.inner"
        end)
        vim.keymap.set("n", "<A-P>", function()
          swap.swap_previous "@parameter.inner"
        end)
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        max_lines = 1,
      },
    },
  },
  main = "nvim-treesitter",
  opts = {
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<c-space>",
        node_incremental = "<c-space>",
        scope_incremental = "<c-s>",
        node_decremental = "<S-space>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").compilers = { "gcc", "clang" }
    require("nvim-treesitter").setup(opts)
  end,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua:requirre'nvim-treesitter'.indentexpr()"
      end,
    })

    local ensureInstalled = {
      "c",
      "cpp",
      "go",
      "lua",
      "python",
      "rust",
      "tsx",
      "typescript",
      "javascript",
      "vimdoc",
      "vim",
      "markdown",
      "html",
      "css",
      "json",
      "yaml",
      "bash",
    }

    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim
      .iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsersToInstall)
  end,
}
