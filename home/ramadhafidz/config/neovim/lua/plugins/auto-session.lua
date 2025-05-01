require("auto-session").setup({
  enabled = true,
  auto_save = true,
  auto_restore = true,
  auto_create = true,
  session_lens = {
    load_on_setup = true,
    theme_conf = { border = true },
    previewer = false,
  },
  vim.keymap.set('n', '<leader>ls', require('auto-session.session-lens').search_session, { noremap = true, }),
})
