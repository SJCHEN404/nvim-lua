--[[
__  ____   __  _   ___     _____ __  __ ____   ____
|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
]]

-- =============================
-- ========== require ==========
-- =============================

require('settings')
require('keyBindings')
require('plugins')
require('plugConfigs')
require('lspConfigs')
require("nvim-tree").setup() 
require('lualine').setup()
require("bufferline").setup{}
require("conf/telescope")
require("conf/cmp")
require("conf/notify")
require("conf/hop")
require("conf/todo-comments")
require('dap.dap-config')
require('dap.dap-ui')
require('dap.dap-virtual-text')
require('dap.dap-util')
require("conf.toggleterm")
require("lsp.lsp-installer")
require("lsp.handlers").setup()
