local M = {}

local function config_dapi_and_sign()

  local dap_breakpoint = {
    error = {
      text = "🛑",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "⭐️",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
  vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
end

local function config_dapui()
  local dap, dapui = require "dap", require "dapui"

  dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
      vim.api.nvim_command("DapVirtualTextDisable")
      dapui.close()
  end
  dap.listeners.before.disconnect["dapui_config"]       = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    debug_close()
  end

  dap.defaults.fallback.terminal_win_cmd = 'vsplit new'
end

local function config_debuggers()
  -- load from json file
  require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'cpp' } })
  -- config per launage
  require("dap.dap-cpp")
  require("dap.dap-python")
end

function M.setup()
  config_dapi_and_sign()
  config_dapui()
  config_debuggers() -- Debugger
end

return M
