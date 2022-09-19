require("impatient")
require("AGou.autocmd")
require("AGou.themes")
require("AGou.lsp")
require("AGou.nvim-lualine")
require("AGou.nvim-bufferline")
require("AGou.nvim-tree")
require("AGou.nvim-transparent")
require("AGou.nvim-cmp")
require("AGou.nvim-mason")
require("AGou.nvim-treesitter")
require("AGou.nvim-gitsigns")
require("AGou.nvim-autopairs")
require("AGou.nvim-lspsaga")
require("AGou.nvim-telescope")
require("AGou.nvim-toggleterm")
require("AGou.nvim-neoscroll")
require("AGou.nvim-whichkey")
require("AGou.nvim-diffview")
require("AGou.nvim-dashboard")
require("AGou.nvim-indent-blankline")
require("AGou.nvim-trouble")
require("AGou.nvim-goto-preview")
require("AGou.nvim-smart-splits")
require("AGou.nvim-scrollbar")
require("AGou.nvim-jabs")
require("AGou.nvim-dap")
require("AGou.nvim-gomove")
require("AGou.nvim-surround")
require("AGou.nvim-incline")
require("AGou.nvim-zen-mode")
require("AGou.nvim-ufo")
-- --------------------------------------

-- -------------------------- 其他简单lua插件配置项 --------------------------------------------
--
require("lsp_lines").setup()
require("hop").setup({})
-- --------------------------------------
-- full hotkeys usage: https://github.com/numToStr/Comment.nvim#-usage
-- gcc: 当前行行注释
-- gcb: 当前行块注释
-- [count]gcc/gcb: 多行块或行注释
-- `gco` - Insert comment to the next line and enters INSERT mode
-- `gcO` - Insert comment to the previous line and enters INSERT mode
-- `gcA` - Insert comment to end of the current line and enters INSERT mode
require("Comment").setup({
  mappings = {
    extended = true,
  },
})
-- --------------------------------------
require("specs").setup({
  show_jumps = true,
  min_jump = 30,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 5, -- time increments used for fade/resize effects
    blend = 0, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 70,
    winhl = "PMenu",
    -- Faders:
    -- linear_fader ▁▂▂▃▃▄▄▅▅▆▆▇▇██
    -- exp_fader ▁▁▁▁▂▂▂▃▃▃▄▄▅▆▇
    -- pulse_fader ▁▂▃▄▅▆▇█▇▆▅▄▃▂▁
    -- empty_fader ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁
    fader = require("specs").exp_fader,
    -- Resizers:
    -- shrink_resizer ░░▒▒▓█████▓▒▒░░
    -- slide_resizer ████▓▓▓▒▒▒▒░░░░
    -- empty_resizer ███████████████
    resizer = require("specs").shrink_resizer,
  },
  ignore_filetypes = { "NvimTree" },
  ignore_buftypes = {
    nofile = true,
    "NvimTree",
    "go",
  },
})

-- --------------------------------------
require("colorizer").setup({
  "*", -- Highlight all files, but customize some others.
  "!vim", -- Exclude vim from highlighting.
  -- Exclusion Only makes sense if '*' is specified!
})
-- --------------------------------------
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
  max_lines = 1000,
  max_num_results = 5,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = "..",
  ignored_file_types = { -- default is not to ignore
    TelescopePrompt = true,
    -- yaml = true
    NvimTree = true,
    vim = true,
  },
  show_prediction_strength = false,
})
-- --------------------------------------
require("nvim-gps").setup({
  icons = {
    ["class-name"] = " ", -- Classes and class-like objects
    ["function-name"] = " ", -- Functions
    ["method-name"] = " ", -- Methods (functions inside class-like objects)
    ["container-name"] = "⛶ ", -- Containers (example: lua tables)
    ["tag-name"] = "炙", -- Tags (example: html tags)
    ["object-name"] = " ",
  },
})
-- --------------------------------------
require("nvim-cursorline").setup({
  cursorline = {
    enable = false,
    timeout = 300,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  },
})
-- --------------------------------------
-- --------------------------------------
-- --------------------------------------
local opts = {
  log_level = "info",
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"), -- directory where session files are saved
  auto_session_enabled = false,
  auto_save_enabled = nil,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  -- the configs below are lua only
  bypass_session_save_file_types = {
    "NvimTree",
  },
}

require("auto-session").setup(opts)
-- --------------------------------------
require('better-comment').Setup({
    tags = {
        -- TODO: I wanna go home.
        -- FIX: FIX something
        -- WARNING: example comment
        -- !
        -- {
        --     name = "TODO",
        --     fg = "white",
        --     bg = "#0a7aca",
        --     bold = true,
        --     virtual_text = "something here",
        -- },
    }
})
-- --------------------------------------
require('neogen').setup({
    snippet_engine = "luasnip",
    enabled = true,             --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation

})
-- --------------------------------------
--require('satellite').setup {
--  current_only = false,
--  winblend = 50,
--  zindex = 40,
--  excluded_filetypes = {},
--  width = 2,
--  handlers = {
--    search = {
--      enable = true,
--    },
--    diagnostic = {
--      enable = true,
--    },
--    gitsigns = {
--      enable = true,
--    },
--    marks = {
--      enable = true,
--      show_builtins = false, -- shows the builtin marks like [ ] < >
--    },
--  },
--}
-- --------------------------------------
-- --------------------------------------
-- ----------------------------------------------------------------------
