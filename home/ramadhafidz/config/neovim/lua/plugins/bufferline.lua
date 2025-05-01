require("bufferline").setup({
  options = {
    mode = "tabs", -- atau "buffers" (tampilkan sebagai buffer)
    separator_style = "slant", -- atau "padded_slant", "thick", "thin"
    show_close_icon = false,
    color_icons = true,
    custom_filter = function(buf_number, buf_numbers)
      if vim.bo[buf_number].filetype ~= "NvimTree" then
        return false
      end
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true,
      }
    }
  }
})
