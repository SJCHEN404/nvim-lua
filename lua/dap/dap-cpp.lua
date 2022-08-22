local status_ok, dap = pcall(require, "dap")
if not status_ok then
    vim.notify("dap don't exists")
    return
end

-- local dbg_path = require("dap-install.config.settings").options["installation_path"] .. "ccppr_vsc/"
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "/Users/SJCHEN/.vscode/extensions/ms-vscode.cpptools-1.11.5-darwin-x64/debugAdapters/bin/OpenDebugAD7",
    -- command = dbg_path .. "extension/debugAdapters/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    MIMode = 'lldb',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
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
  -- Attach
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'lldb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/lldb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
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
dap.configurations.rust = dap.configurations.cpp
