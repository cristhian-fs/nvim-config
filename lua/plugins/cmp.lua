return {
  "saghen/blink.cmp",
  lazy = false,
  version = "1.*",
  opts = {
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono", -- or "normal" if your nerd font isn't mono
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
      },
      ghost_text = { enabled = true },
      menu = {
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
          },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
