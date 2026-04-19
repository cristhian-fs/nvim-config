return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        cmp = true,
        treesitter = true,
        telescope = true,
        notify = true,
        gitsigns = true,
        noice = true,
        dap = true,
        dap_ui = true,
        nvimtree = true,
        markdown = true,
        mason = true,
      },
    },
    init = function()
      local catpuccin = require "catppuccin.palettes.mocha"

      vim.api.nvim_set_hl(0, "EdgyWinBar", { bg = catpuccin.mantle })
      vim.api.nvim_set_hl(0, "EdgyNormal", { bg = catpuccin.mantle })
      vim.api.nvim_set_hl(0, "LspInlayHint", { bg = catpuccin.base, fg = catpuccin.overlay0 })
      vim.api.nvim_set_hl(0, "WinSeparator", { bg = catpuccin.mantle, fg = catpuccin.surface1 })
      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { sp = catpuccin.surface2, underline = false })
      vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { sp = catpuccin.surface2, underline = false })
    end,
  },
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      italics = {
        comments = false, -- Boolean: Italicizes comments
        keywords = false, -- Boolean: Italicizes keywords
        functions = false, -- Boolean: Italicizes functions
        strings = false, -- Boolean: Italicizes strings
        variables = false, -- Boolean: Italicizes variables
      },
    },
  },
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    opts = {},
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    name = "tokyonight",
    style = "night",
    transparent = true,
    opts = {
      sidebars = "transparent",
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    name = "cyberdream",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "light",
      transparent = true,
      borderless_pickers = false,
      cache = true,
    },
    config = function()
      require("cyberdream").setup {
        variant = "default",
        transparent = false,
        borderless_pickers = false,
        cache = true,
      }
      vim.cmd "colorscheme cyberdream"
    end,
  },
  {
    priority = 1000,
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "linrongbin16/lsp-progress.nvim",
        opts = {
          format = function(client_messages)
            local api = require "lsp-progress.api"
            local lsp_clients = #api.lsp_clients()
            if #client_messages > 0 then
              return table.concat(client_messages, " ")
            elseif lsp_clients > 0 then
              return "󰄳 LSP " .. lsp_clients .. " clients"
            end
            return ""
          end,
        },
      },
    },
    cond = function()
      return os.getenv "PRESENTATION" ~= "true"
    end,
    config = function()
      vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = require("lualine").refresh,
      })

      require("lualine").setup {
        options = {
          disabled_filetypes = {
            statusline = { "alpha", "NvimTree", "trouble", "Outline" },
          },
          theme = "auto",
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_a = {
            {
              "mode",
            },
          },
          lualine_c = {
            function()
              -- invoke `progress` here.
              return require("lsp-progress").progress()
            end,
          },
          lualine_x = { "filetype" },
          lualine_y = {},
          lualine_z = { { "os.date('󰅐 %H:%M')" } },
        },
      }
    end,
  },
}
