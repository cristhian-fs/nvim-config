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
      transparent_background = true,
    },
    init = function()
      local catpuccin = require "catppuccin.palettes.mocha"

      vim.api.nvim_set_hl(0, "EdgyWinBar", { bg = catpuccin.mantle })
      vim.api.nvim_set_hl(0, "EdgyNormal", { bg = catpuccin.mantle })
      vim.api.nvim_set_hl(0, "LspInlayHint", { bg = catpuccin.base, fg = catpuccin.overlay0 })
      vim.api.nvim_set_hl(0, "WinSeparator", { bg = catpuccin.mantle, fg = catpuccin.surface1 })
      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { sp = catpuccin.surface2, underline = false })
      vim.api.nvim_set_hl(0, "TreesitterContextLineNumberBottom", { sp = catpuccin.surface2, underline = false })
      -- vim.cmd "colorscheme catppuccin"
    end,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("NeoSolarized").setup {
        style = "light",
        transparent = false,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = { bold = true },
          string = { italic = false },
        },
      }
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup {
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "lotus",
        },
      }
    end,
  },
  {
    "datsfilipe/min-theme.nvim",
    lazy = false,
    name = "min-theme",
    priority = 1000,
    config = function()
      require("min-theme").setup {
        theme = "dark",
        transparent = false,
        italics = {
          comments = false,
          keywords = false,
          functions = false,
          strings = false,
          variables = false,
        },
      }
    end,
  },
  {
    "nvim-mini/mini.base16",
    version = false,
    config = function()
      require("mini.base16").setup {
        palette = {
          base00 = "#282725", -- background
          base01 = "#22211F", -- background alt
          base02 = "#3f3f3f", -- selection
          base03 = "#8D867F", -- comments
          base04 = "#ACA084", -- foreground dim
          base05 = "#C4B9AD", -- foreground
          base06 = "#C4B9AD", -- foreground bright
          base07 = "#ffffff", -- foreground extra
          base08 = "#F9615E", -- variables/params (rosa)
          base09 = "#C97042", -- numbers/functions (laranja)
          base0A = "#61aeee", -- types/classes (ciano)
          base0B = "#98c379", -- strings (verde)
          base0C = "#61aeee", -- escape chars (ciano)
          base0D = "#c678dd", -- functions calls? depende do mapping
          base0E = "#c678dd", -- keywords (roxo)
          base0F = "#F0813D", -- deprecated/special (laranja)
        },
      }

      require("animejs-theme").apply()
    end,
  },
  -- {
  --   "webhooked/kanso.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("kanso").setup {
  --       background = {
  --         dark = "zen",
  --         light = "pearl",
  --       },
  --     }
  --     vim.cmd "colorscheme kanso"
  --   end,
  -- },
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
