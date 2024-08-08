return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/nvim-nio"
},
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("dap-python").setup("python")

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.after.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.after.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>dt", function() dap.toggle_breakpoint() end, { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>dc", function() dap.continue() end, { noremap = true, silent = true })
  end,
}
