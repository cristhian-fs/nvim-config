return {
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
    },
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = true,
        download_remote_images = false,
        filetypes = { "markdown" },
      },
      html = {
        enabled = false,
      },
      css = {
        enabled = false,
      },
    },
  },
}
