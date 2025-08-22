-- ~/.config/nvim/lua/config/plugins.lua
-- Neovim package list managed by lazy.nvim
-- ----------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  ---------------------------------------------------------------------------
  -- ==========  ORIGINAL PLUGINS  ==========================================
  ---------------------------------------------------------------------------

  "preservim/nerdtree",                       -- file explorer
  "vim-airline/vim-airline",                  -- statusline
  "vim-airline/vim-airline-themes",

  { "junegunn/fzf", build = "./install --all" }, -- fzf core
  "junegunn/fzf.vim",                            -- fzf vim wrappers

  "tpope/vim-fugitive",                       -- git CLI wrapper
  "airblade/vim-gitgutter",                   -- legacy diff signs (keep if you like)
  "rbong/vim-flog",                           -- commit graph viewer

  "jiangmiao/auto-pairs",                     -- auto-close brackets/quotes
  "ryanoasis/vim-devicons",                   -- file-type icons
  "preservim/nerdcommenter",                  -- comment/uncomment
  "tpope/vim-surround",                       -- surround text objects
  "nathanaelkane/vim-indent-guides",          -- indent guides
  "tpope/vim-obsession",                      -- session management
  "Chiel92/vim-autoformat",                   -- one-shot :Autoformat

  -- ----------  Theme collection ----------
  "morhetz/gruvbox","sainnhe/sonokai","sainnhe/everforest","sainnhe/edge",
  "joshdick/onedark.vim","arcticicestudio/nord-vim",{ "dracula/vim", name="dracula"},
  "ghifarit53/tokyonight-vim","crusoexia/vim-monokai",
  "kaicataldo/material.vim", "chriskempson/base16-vim","mhartington/oceanic-next","NLKNguyen/papercolor-theme",
  "ayu-theme/ayu-vim","rakr/vim-one",

  -- Kanagawa (Lua) theme
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile=false, undercurl=true,
        commentStyle={italic=true}, keywordStyle={italic=true},
        statementStyle={bold=true}, transparent=false,
        dimInactive=false, terminalColors=true,
        theme="wave", background={dark="wave", light="lotus"},
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },

  -- ----------  Code navigation / utils ----------
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = { "folke/which-key.nvim" },
    config = function()
      require("cscope_maps").setup({
        skip_input_prompt=true,
        cscope={exec="cscope", db_file="cscope.out", use_telescope=true},
      })
    end
  },

  {
    "andymass/vim-matchup",
    init = function()
      vim.g.matchup_matchparen_offscreen={method="popup"}
      vim.g.matchup_matchparen_deferred=1
      vim.g.matchup_matchparen_hi_surround_always=1
    end
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = { c={"clang_format"}, cpp={"clang_format"} },
      })
      vim.api.nvim_create_autocmd("BufWritePre",{
        pattern={ "*.c","*.cpp","*.h","*.hpp" },
        callback=function(args) require("conform").format({bufnr=args.buf}) end,
      })
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add={text="│"}, change={text="│"}, delete={text="_"},
          topdelete={text="‾"}, changedelete={text="~"},
        },
        preview_config = {border="rounded", style="minimal",
                          relative="cursor", row=0, col=1},
      })
    end
  },

  { "lukas-reineke/virt-column.nvim", opts = { char="│", virtcolumn="" } },
  { "numToStr/Comment.nvim", config = function() require("Comment").setup() end },
  { "mg979/vim-visual-multi", branch="master" },

  {
    "ojroques/nvim-osc52",
    config = function()
      local osc52=require("osc52")
      osc52.setup({max_length=0,silent=true,trim=false})
      vim.api.nvim_create_autocmd("TextYankPost",{
        callback=function()
          if vim.v.event.operator=="y" and vim.v.event.regname=="" then
            osc52.copy_register("")
          end
        end
      })
    end
  },

  { "lukas-reineke/indent-blankline.nvim", version="^3", main="ibl", opts={} },
  { "tpope/vim-sleuth", event="BufReadPre" },
  { "tpope/vim-surround", event="VeryLazy" },

  ---------------------------------------------------------------------------
  -- ==========  GitHub-like / IDE extras (no external binaries) ============
  ---------------------------------------------------------------------------

  -- Side-by-side diff & commit history
  { "sindrets/diffview.nvim", dependencies="nvim-lua/plenary.nvim" },

  -- Treesitter syntax/indent
  {
    "nvim-treesitter/nvim-treesitter",
    build=":TSUpdate",
    config=function()
      require("nvim-treesitter.configs").setup({
        highlight={enable=true}, indent={enable=true},
      })
    end
  },

  -- Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies="nvim-lua/plenary.nvim",
    config=function() require("telescope").setup() end
  },

  -- which-key popup
  { "folke/which-key.nvim", config=function() require("which-key").setup() end },

  -- Trouble diagnostics list
  {
    "folke/trouble.nvim",
    dependencies="nvim-tree/nvim-web-devicons",
    opts={},
  },

  -- Leap fast-motion
  {
    "ggandor/leap.nvim",
    config=function() require("leap").add_default_mappings() end
  },

  -- Dashboard (optional eye-candy)
  {
    "nvimdev/dashboard-nvim",
    event="VimEnter",
    dependencies="nvim-tree/nvim-web-devicons",
    opts={},
  },

  ---------------------------------------------------------------------------
  -- ==========  LSP + Completion stack  ====================================
  ---------------------------------------------------------------------------

  "neovim/nvim-lspconfig",

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = { expand=function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select=true }),
          ["<Tab>"]     = cmp.mapping.select_next_item(),
          ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name="nvim_lsp" }, { name="luasnip" },
          { name="buffer" },   { name="path" },
        },
      })
    end
  },
  --[[
   ==========  Debugging / Reverse-Engineering  (OFFLINE)  ================
  -----------------------------------------------------------------

   Core Debug Adapter Protocol engine
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

       --------  GDB / LLDB  adapter (purely local) ----------
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "lldb-vscode",       or "OpenDebugAD7" for gdb-mi
      }

      dap.configurations.cpp = {       reuse for C and C++
        {
          name = "Launch executable (gdb)",
          type = "cppdbg",
          request = "launch",
          cwd    = "${workspaceFolder}",
          stopOnEntry = true,
          program = function()
            return vim.fn.input("Path to executable > ",
                                vim.fn.getcwd() .. "/", "file")
          end,
        },
      }
       duplicate for plain C
      dap.configurations.c = dap.configurations.cpp
    end,
  },

   UI panels (scopes, stack, breakpoints, console)
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
       auto-open/close UI on start/exit
      dap.listeners.after.event_initialized["dapui_config"] =
        function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] =
        function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] =
        function() dapui.close() end
    end,
  },

   Inline variable values while stepping
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    opts = { commented = true },    show “// value” style comments
  },

   (Optional) Classic GDB TUI in a split, synced with buffers
  {
    "sakhnik/nvim-gdb",
    ft = { "c", "cpp" },            load on C/C++ files only
    opts = { set_sign_breakpoint = "🛑" },   nice breakpoint sign
  },
  ]]

})

