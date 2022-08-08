local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "U", "5k", opt)
map("n", "E", "5j", opt)
map("n", "W", "5w", opt)
map("n", "B", "5b", opt)
-- split screen
map("n", "sl", ":set splitright<CR>:vsplit<CR>", opt)
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>", opt)
map("n", "sk", ":set nosplitbelow<CR>:split<CR>", opt)
map("n", "sj", ":set splitbelow<CR>:split<CR>", opt)
map("n", "sc", "<C-w>c", opt)
map("n", "so", "<C-w>o", opt) -- close others
-- Jump windows
map("n", "<LEADER>h", "<C-w>h", opt)
map("n", "<LEADER>j", "<C-w>j", opt)
map("n", "<LEADER>k", "<C-w>k", opt)
map("n", "<LEADER>l", "<C-w>l", opt)

map("", "R", ":source $MYVIMRC<CR>", opt)

map("n", "tt", ":NvimTreeToggle<CR>")

-- save
map("n", "<C-s>", "<Esc>:w<CR>q")


--================================
--========== bufferline ==========
--================================

map("n", "<LEADER>2", ":BufferLineCycleNext<CR>", opt)
map("n", "<LEADER>1", ":BufferLineCyclePrev<CR>", opt)
map("n", "<LEADER>3", ":BufferLinePick<CR>", opt)

--================================
--========== wildfire ==========
--================================

map("n", "<C-v>", "<Plug>(wildfire-quick-select)" )


--================================
--========== debug ===============
--================================


map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<cr>", opts)
map("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
map("n", "<F9>", "<cmd>lua require'dap'.run_last()<cr>", opts)
map('n', '<F10>', '<cmd>lua require"dap.dap-util".reload_continue()<CR>', opts)
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)

--================================
--========== debug ===============
--================================

vim.keymap.set("n", "<LEADER>mp", "<cmd>MarkdownPreview<CR>", opt)
vim.keymap.set("n", "<LEADER>ms", "<cmd>MarkdownPreviewStop<CR>", opt)
vim.keymap.set("n", "<LEADER>mt", "<cmd>MarkdownPreviewToggle<CR>", opt)



--================================
--============ hop ===============
--================================

-- place this in one of your configuration file(s)
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

vim.api.nvim_set_keymap('n', '<C-w>', "<cmd>HopWord<cr>", {})
vim.api.nvim_set_keymap('n', '<C-q>', "<cmd>HopLine<cr>", {})

--================================
--============ lsp ===============
--================================

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>", {})
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {})
-- vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {})
-- vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {})
-- vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>lua vim.lsp.buf.references()<CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-c>", "<cmd>lua vim.lsp.buf.code_action()<CR>", {})
-- vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua vim.diagnostic.open_float()<CR>", {})
-- vim.api.nvim_set_keymap("n", ";dj", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', {})
-- vim.api.nvim_set_keymap("n", ";dn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', {})
-- vim.api.nvim_set_keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float()<CR>', {})
-- vim.api.nvim_set_keymap("n", "<leader>dq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>fm", '<cmd>lua vim.lsp.buf.formatting()<CR>', {})
