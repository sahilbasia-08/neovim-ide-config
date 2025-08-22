local map = vim.api.nvim_set_keyma-----------------------------------------------------------------------
--  Keymaps for my Neovim setup
--  (Load after plugins.lua   –   e.g. require("config.keymaps"))
-----------------------------------------------------------------------

local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------------------
--  1.  Core / Navigation
-----------------------------------------------------------------------
-- Buffers
map("n", "<Tab>",     "<cmd>bnext<CR>",      opts) -- next buffer
map("n", "<S-Tab>",   "<cmd>bprevious<CR>",  opts) -- prev buffer

-- Tag stack & quick Cscope helpers
map("n", "<leader>d", "<C-]>",               opts) -- jump to tag under cursor
map("n", "<leader>B", "<C-T>",               opts) -- jump back in tag stack
map("n", "<leader>b", "<C-o>",               opts) -- jump back in jumplist
map("n", "<leader>f", "<C-i>",               opts) -- jump fwd in jumplist

-----------------------------------------------------------------------
--  2.  File Explorer – NERDTree
-----------------------------------------------------------------------
map("n", "<leader>n", "<cmd>NERDTreeToggle<CR>", opts)

-----------------------------------------------------------------------
--  3.  Fuzzy finding – FZF  *and* Telescope
-----------------------------------------------------------------------
-- FZF
map("n", "<C-p>",     "<cmd>Files<CR>",      opts)
map("n", "<leader>ff","<cmd>Files<CR>",      opts)

-- Telescope (lua powered – safer to leave as <leader>t… to avoid clash)
map("n", "<leader>tf", "<cmd>Telescope find_files<CR>",  opts)  -- files
map("n", "<leader>tg", "<cmd>Telescope live_grep<CR>",   opts)  -- ripgrep
map("n", "<leader>tb", "<cmd>Telescope buffers<CR>",     opts)  -- open bufs
map("n", "<leader>th", "<cmd>Telescope help_tags<CR>",   opts)  -- :help

-----------------------------------------------------------------------
--  4.  Git workflow
-----------------------------------------------------------------------
-- Fugitive
map("n", "<leader>gs", "<cmd>G<CR>",                 opts) -- status
map("n", "<leader>gb", "<cmd>G blame<CR>",           opts) -- blame
map("n", "<leader>gc", "<cmd>G commit<CR>",          opts) -- commit
map("n", "<leader>gp", "<cmd>G push<CR>",            opts) -- push
map("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>",       opts) -- 3-way diff

-- Git commit graph (vim-flog)
map("n", "<leader>gl", "<cmd>Flog<CR>",              opts)

-- Gitsigns (hunks)
map("n", "]g",         "<cmd>Gitsigns next_hunk<CR>", opts)
map("n", "[g",         "<cmd>Gitsigns prev_hunk<CR>", opts)
map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>",  opts)
map("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>",    opts)
map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)

-- Diffview
map("n", "<leader>dv", "<cmd>DiffviewOpen<CR>",  opts)  -- open diff UI
map("n", "<leader>dx", "<cmd>DiffviewClose<CR>", opts)  -- quit diff UI

-----------------------------------------------------------------------
--  5.  Code exploration – Cscope (cscope_maps.nvim)
-----------------------------------------------------------------------
map("n", "gd", "<cmd>cs find g <C-R>=expand('<cword>')<CR><CR>", opts) -- defs
map("n", "gD", "<cmd>cs find d <C-R>=expand('<cword>')<CR><CR>", opts) -- decl
map("n", "gs", "<cmd>cs find s <C-R>=expand('<cword>')<CR><CR>", opts) -- sym
map("n", "gC", "<cmd>cs find c <C-R>=expand('<cword>')<CR><CR>", opts) -- callers
map("n", "gt", "<cmd>cs find t <C-R>=expand('<cword>')<CR><CR>", opts) -- text

-----------------------------------------------------------------------
--  6.  Formatting
-----------------------------------------------------------------------
-- Autoformat.vim (legacy)
map("n", "<leader>af", "<cmd>Autoformat<CR>", opts)

-- Conform.nvim (async clang-format for C/C++)
map("n", "<leader>cf", function() require("conform").format() end,
    { desc = "Conform format buffer" })

-----------------------------------------------------------------------
--  7.  Commenting
-----------------------------------------------------------------------
-- NerdCommenter (Ctrl + / style)
map({ "n", "v" }, "<C-_>", "<Plug>NERDCommenterToggle", opts)

-- Comment.nvim (gcc / gc)
require("Comment").setup({
  toggler  = { line = "gcc", block = "gbc" },
  opleader = { line = "gc",  block = "gb"  },
  mappings = { basic = true, extra = false },
})

-----------------------------------------------------------------------
--  8.  Trouble (diagnostics list)
-----------------------------------------------------------------------
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>",                  opts)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>",  opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>",          opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>",         opts)

-----------------------------------------------------------------------
--  9.  Leap (fast 2-char motion) – default mappings are good.
--      Extra: quickly toggle/highlight targets
-----------------------------------------------------------------------
map("n", "s", "<Plug>(leap-forward)",  {}) -- already set by leap, here for docs
map("n", "S", "<Plug>(leap-backward)", {})

-----------------------------------------------------------------------
-- 10. Visual-Multi – multiple cursors
-----------------------------------------------------------------------
vim.g.VM_default_mappings = 1
vim.g.VM_maps = {
  ["Find Under"]         = "<C-n>",
  ["Find Subword Under"] = "<C-n>",
  ["Select Cursor Down"] = "<C-Down>",
  ["Select Cursor Up"]   = "<C-Up>",
}
map("n", "<leader>vm", "<cmd>VMtoggle<CR>", opts)

-----------------------------------------------------------------------
-- 11. Dashboard – home screen
-----------------------------------------------------------------------
map("n", "<leader>;", "<cmd>Dashboard<CR>", opts) -- open dashboard any time

