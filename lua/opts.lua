--[[ opts.lua ]]
local opt = vim.opt -- with vim.opt we can set global, window and buffer settings, acting like :set in vimscript
local set = vim.opt
local o = vim.o
local cmd = vim.api.nvim_command

-- ident
vim.cmd([[
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
]])

-- Spell check:
vim.cmd([[
set spelllang=en_us
]])

-- turn off macro reording
vim.cmd([[
map q <Nop>
]])

opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- int:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column
opt.numberwidth = 4 -- gutter width
set.cursorline = true -- display cursor line
set.cursorlineopt = 'number' --
-- set.laststatus = 3                  -- show just one status line


-- [[ Filetypes ]]
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "ON" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- Treesitter folding
-- Prevent all fold when opening
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.cmd([[autocmd BufReadPost,FileReadPost * normal zR]])

-- fold settings -- GOOOD!!!!!!!
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.wo.foldtext =
--     [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
-- vim.wo.fillchars = "fold:\\"
-- vim.wo.foldnestmax = 3
-- vim.wo.foldminlines = 1

-- Format on Save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]


-- Vimspector
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])


-- LSP Diagnostics Options Setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end
sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
        border = 'single',
        source = 'always',
        header = '',
        prefix = '- ',
    },
})
-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.o.updatetime = 350
set.signcolumn = 'yes'
vim.cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
