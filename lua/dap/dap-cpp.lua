local status_ok, dap = pcall(require, "dap")
if not status_ok then
    vim.notify("dap don't exists")
    return
end

-- local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "ccppr_vsc/"
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "/Users/SJCHEN/.vscode/extensions/ms-vscode.cpptools-1.11.4-darwin-x64/debugAdapters/bin/OpenDebugAD7",
    -- command = dbg_path .. "extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      local input = vim.fn.input("Input args: ")
      return require("dap.dap-util").str2argtable(input)
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    setupCommands = {  
      { 
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false 
      },
    },
  },
  -- attach process
  {
    name = "Attach process",
    type = "cppdbg",
    request = "attach",
    processId = require('dap.utils').pick_process,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    setupCommands = {
      {
        description = 'enable pretty printing',
        text = '-enable-pretty-printing',
        ignoreFailures = false
      },
    },
  },
  -- Attach
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      local input = vim.fn.input("Input args: ")
      return require("dap.dap-util").str2argtable(input)
    end,
    setupCommands = {  
      { 
        text = '-enable-pretty-printing',
        description =  'enable pretty printing',
        ignoreFailures = false 
      },
    },
  },
}

dap.configurations.c = dap.configurations.cpp
