local dashboard = require "alpha.themes.dashboard"
math.randomseed(os.time())

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl = "AlphaButton"
  b.opts.hl_shortcut = "AlphaButtonShortcut"
  return b
end

local function footer()
  local plugins = #vim.tbl_keys(packer_plugins)
  local v = vim.version()
  local datetime = os.date " %d-%m-%Y   %H:%M:%S"
  return string.format(" %d   v%d.%d.%d  %s", plugins, v.major, v.minor, v.patch, datetime)
end

dashboard.section.header.val = require("config.utils.headers").random
dashboard.section.header.opts.hl = "AlphaCol" .. math.random(5)

dashboard.section.buttons.val = {
  button("SPC t o", "  Recently opened files"),
  button("SPC t f", "  Find file"),
  button("SPC t l", "  Find word"),
  button("SPC t F", "  File browser"),
  button("SPC t 1", "  Find repo"),
  button("SPC s s", "  Open session"),
  button("SPC c n", "  New file"),
  button("SPC p u", "  Update plugins"),
  button("q", "  Quit", "<Cmd>qa<CR>"),
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = dashboard.section.header.opts.hl

dashboard.config.layout[1].val = 1

require("alpha").setup(dashboard.config)

-- hide tabline and statusline on startup screen
vim.cmd(string.format(
  [[
  augroup alpha_tabline
    au!
    au FileType alpha set showtabline=0 laststatus=0 noruler | au BufUnload <buffer> set showtabline=2 ruler laststatus=%d
  augroup END
  ]],
  vim.fn.has "nvim-0.7" == 1 and 3 or 2
))
