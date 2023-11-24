return {
  "mfussenegger/nvim-dap",

  dependencies = {

    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
      },
      opts = {},
      config = function(_, opts)
        -- setup dap config by VsCode launch.json file
        -- require("dap.ext.vscode").load_launchjs()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- which key integration
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          ["<leader>d"] = { name = "+debug" },
          ["<leader>da"] = { name = "+adapters" },
        },
      },
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          "codelldb",
        },
      },
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    -- { "<leader>dd", function() require("dap").}
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    { "<leader>dL", function()
                    -- (Re-)reads launch.json if present
              if vim.fn.filereadable(".vscode/launch.json") then
                  require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "c", "cpp" } })
              end
            require("dap").continue()
        end,
        desc = "DAP Continue",
  }},

  config = function()
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end

    -- Utility function for running a shell command and getting its output
    local function shell_output(command)
      local handle = io.popen(command)
      local result = handle:read("*a")
      handle:close()
      return result
    end

    -- Function to return directories containing a specific file
    local function get_dirs_with_file(file_name)
      local result = shell_output('find . -name "' .. file_name .. '"')
      local dirs = {}
      for dir in result:gmatch("[^\r\n]+") do
        table.insert(dirs, vim.fn.fnamemodify(dir, ":h"))
      end
      return dirs
    end

    -- Generalized function to handle directory selection
    local function select_dir(file_name, callback)
      local dirs = get_dirs_with_file(file_name)
      require("telescope.pickers")
        .new({}, {
          finder = require("telescope.finders").new_table({ results = dirs }),
          sorter = require("telescope.config").values.generic_sorter({}),
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              require("telescope.actions").close(prompt_bufnr)
              callback(selection.value)
            end)
            return true
          end,
        })
        :find()
    end

    -- Coroutine-based function to generate arguments
    local function generate_args()
      local co = coroutine.running()
      local args
      select_dir("rev-test.py", function(dir)
        args = dir .. "/rev-test.py"
        coroutine.resume(co)
      end)
      coroutine.yield()
      return args
    end

    -- Configuration for dap
    local dap = require("dap")
    local selected_dir
    --    local config = {
    --      name = "Rev Test",
    --      type = "codelldb",
    --      request = "launch",
    --      program = "sst",
    --      args = "",
    --      cwd = "",
    --      stopOnEntry = false,
    --    }
    --
    --    select_dir("rev-test.py", function(dir)

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "sst",
        args = { "/Users/rkabrick/dev/sst/rev-devel/test/threading/pthreads/pthread-basic-memh/rev-test.py" },
        cwd = "/Users/rkabrick/dev/sst/rev-devel/test/threading/pthreads/pthread-basic-memh/",
        stopOnEntry = false,
        -- set_exception_breakpoints({ "cpp_throw", "cpp_catch" }),
      },
    }
  end,
}

--    local dap = require("")
--    dap.adapters.executable = {
--      type = "executable",
--      command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
--      name = "lldb1",
--      host = "127.0.0.1",
--      port = 13000,
--    }
--    dap.adapters.codelldb = {
--      name = "codelldb server",
--      type = "server",
--      port = "${port}",
--      executable = {
--        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
--        args = { "--port", "${port}" },
--      },
--    }
--    dap.adapters.lldb = {
--      type = "executable",
--      command = "/opt/hombrew/opt/llvm/bin/lldb-vscode",
--      name = "codelldb",
--    }
--    dap.configurations.cpp = {
--      {
--        name = "Test Rev",
--        type = "codelldb",
--        request = "launch",
--        command = os.getenv("HOME") .. "/.local/opt/sst/bin/sst", -- Changed from program
--        args = function()
--          local test_dir = vim.fn.getcwd() .. "/test/"
--          return { vim.fn.input("Path to .py test file: ", test_dir, "file") }
--        end,
--        cwd = "${workspaceFolder}",
--        stopOnEntry = false,
--      },
--    }
--  end,
