--[[ keys.lua ]]

-- Functional wrapper for mapping custom keybindings
-- mode (as in Vim modes like Normal/Insert mode)
-- lhs (the custom keybinds you need)
-- rhs (the commands or existing keybinds to customise)
-- opts (additional options like <silent>/<noremap>, see :h map-arguments for more info on it)
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Load all OPTs
map("n", "<F1>", ":luafile ~/.config/nvim/lua/opts.lua<cr>")


-- Enable spell checking
map("n", "<F2>", ":set spell!<cr>")
-- zg to add word
-- z= to correct error
-- new words  added to ~/.config/nvim/spell/en.utf-8.add

-- Quit buffer
map("n", "qq", ":q<cr>")
map("n", "qa", ":qa<cr>")

vim.cmd([[
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
]])

-- Save and exit
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>qa", ":qa<CR>")

-- Window navigation
map("n", "<C-j>", "<C-w>j<C-w>")
map("n", "<C-h>", "<C-w>h<C-w>")
map("n", "<C-k>", "<C-w>k<C-w>")
map("n", "<C-l>", "<C-w>l<C-w>")

-- Hop
map("n", "HH", ":HopWord<cr>")
map("n", "HF", ":HopPattern<cr>")
map("n", "HL", ":HopLineStart<cr>")

-- Telescope
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
map("n", "<leader>fm", ":Telescope media_files<cr>")
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")
map("n", "<leader>fd", ":lua require('telescope.builtin').diagnostics()<cr>")
map("n", "<leader>fs", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
map("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>")
map("n", "<leader>fi", ":lua require('telescope.builtin').lsp_implementations()<cr>")
map("n", "<leader>fl", ":lua require('telescope.builtin').treesitter()<cr>")
map("n", "<leader>fk", ":lua require('telescope.builtin').keymaps()<cr>")

map("n", "<leader>fc", ":lua require('telescope.builtin').commands()<cr>")
map("n", "<leader>fch", ":lua require('telescope.builtin').command_history()<cr>")
map("n", "<leader>fsh", ":lua require('telescope.builtin').search_history()<cr>")
map("n", "<leader>fmp", ":lua require('telescope.builtin').man_pages()<cr>")
map("n", "<leader>fgc", ":lua require('telescope.builtin').git_commits()<cr>")
map("n", "<leader>fgb", ":lua require('telescope.builtin').git_branches()<cr>")


-- Todo List
map("n", "<leader>qf", ":TodoQuickFix<cr>")

-- Trouble
map("n", "<leader>e", ":TroubleToggle<cr>")

-- Nvim Tree
map("n", "<leader>nt", ":NvimTreeToggle<CR>")

-- Transparency
map("n", "<leader>\\", ":TransparentToggle<CR>")

-- Toggle colored column at 81
map('n', '<leader>|', ':execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>')

-- Navigate buffers
map('n', '<leader>bp', ':bprevious<CR>', {})
map('n', '<leader>bn', ':bnext<CR>', {})
map('n', '<leader>bf', ':bfirst<CR>', {})
map('n', '<leader>bl', ':blast<CR>', {})
map('n', '<leader>bd', ':bdelete<CR>', {})


-- Tagbar Toggle
-- map('n', "<leader>tt", ":TagbarToggle<CR>");
map('n', "<leader>tt", ":SymbolsOutline<CR>");


-- Vimspector
vim.cmd([[
nmap <F5> <cmd>call vimspector#Launch()<cr>
nmap <F10> <cmd>call vimspector#StepOver()<cr>
nmap <F6> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOut()<cr>")
nmap <F9> <cmd>call vimspector#StepInto()<cr>")
]])
map('n', "<F3>", ":call vimspector#ToggleBreakpoint()<cr>")
map('n', "<F4>", ":call vimspector#AddWatch()<cr>")
map('n', "<F7>", ":call vimspector#Evaluate()<cr>")


-- LSP Navigation
-- Code Actions
map('n', "ca", ":lua vim.lsp.buf.code_action()<CR>")
vim.cmd([[
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gc        <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gn        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
]])

vim.cmd([[
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
]])


-- Crates Nvim
vim.cmd([[
nnoremap <silent> <leader>ct :lua require('crates').toggle()<cr>
nnoremap <silent> <leader>cr :lua require('crates').reload()<cr>

nnoremap <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
nnoremap <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
nnoremap <silent> <leader>cd :lua require('crates').show_dependencies_popup()<cr>

nnoremap <silent> <leader>cu :lua require('crates').update_crate()<cr>
vnoremap <silent> <leader>cu :lua require('crates').update_crates()<cr>
nnoremap <silent> <leader>ca :lua require('crates').update_all_crates()<cr>
nnoremap <silent> <leader>cU :lua require('crates').upgrade_crate()<cr>
vnoremap <silent> <leader>cU :lua require('crates').upgrade_crates()<cr>
nnoremap <silent> <leader>cA :lua require('crates').upgrade_all_crates()<cr>

nnoremap <silent> <leader>cH :lua require('crates').open_homepage()<cr>
nnoremap <silent> <leader>cR :lua require('crates').open_repository()<cr>
nnoremap <silent> <leader>cD :lua require('crates').open_documentation()<cr>
nnoremap <silent> <leader>cC :lua require('crates').open_crates_io()<cr>
]])




-- Fix common typos
vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev W1 w!
    cnoreabbrev w1 w!
    cnoreabbrev Q! q!
    cnoreabbrev Q1 q!
    cnoreabbrev q1 q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wa wa
    cnoreabbrev Wq wq
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev wq1 wq!
    cnoreabbrev Wq1 wq!
    cnoreabbrev wQ1 wq!
    cnoreabbrev WQ1 wq!
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
    cnoreabbrev Qall qall
]])

-- Comment.nvim configuration
-- current line
vim.keymap.set('n', 'cc', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('n', 'cb', '<Plug>(comment_toggle_blockwise_current)')

-- Toggle in VISUAL mode
vim.keymap.set('x', 'cc', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', 'cb', '<Plug>(comment_toggle_blockwise_visual)')
