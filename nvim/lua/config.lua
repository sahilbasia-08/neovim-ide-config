-- ~/.config/nvim/lua/config.lua

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.ruler = true
vim.opt.background = "dark"
vim.opt.tags = "./tags,tags"
vim.opt.path:append("**")
vim.opt.wildignore:append("*/.git/*,*/build/*")
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100

-- Load plugins
require("config.plugins")

-- Keymaps
require("config.keymaps")

-- Themes
vim.cmd([[colorscheme kanagawa]])
vim.g.airline_theme = "atomic"

-- GitGutter
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 1

-- Indent Guides
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0
vim.cmd([[
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235 guibg=#2c2c2c
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236 guibg=#333333
]])

-- Cscope
--vim.cmd([[
--  set cscopetag
--  set cscopeverbose
--  if has("cscope")
--    if filereadable("cscope.out")
--      silent! cs reset
--      cs add cscope.out
--    endif
--  endif
--]])
--
--Word wrapping
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt.wrap = true           -- enable wrap
    vim.opt.linebreak = true      -- wrap only at word boundaries
    vim.opt.breakindent = true    -- keep indentation of wrapped lines
    vim.opt.showbreak = "↪ "      -- show wrap character
  end,
})

-- customer color scheme
vim.cmd("colorscheme kanagawa2")

-- related to whitespaces and tabs related stuff
vim.cmd [[
  highlight NonText guifg=#5c6370 ctermfg=240
  highlight SpecialKey guifg=#5c6370 ctermfg=240
]]



