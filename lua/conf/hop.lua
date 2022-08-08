-- https://github.com/phaazon/hop.nvim
local status_ok, hop = pcall(require, "hop")
if not status_ok then
    vim.notify("hop dno't exists")
    return
end

hop.setup()
