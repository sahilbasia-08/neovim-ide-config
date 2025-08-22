-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config")

--vim.cmd([[set showmatch]])

--vim.cmd([[
--  augroup MatchParenStyle
--    autocmd!
--    autocmd ColorScheme * hi MatchParen cterm=bold ctermbg=darkblue ctermfg=yellow gui=bold guibg=#1e1e7e guifg=yellow
--  augroup END
--]])

