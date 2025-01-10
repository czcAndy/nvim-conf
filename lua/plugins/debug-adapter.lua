return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			dap.set_log_level("DEBUG")
			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtBeginningOfMainSubprogram = false,
				},
				{
					name = "Select and attach to process",
					type = "gdb",
					request = "attach",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					pid = function()
						local name = vim.fn.input("Executable name (filter): ")
						return require("dap.utils").pick_process({ filter = name })
					end,
					cwd = "${workspaceFolder}",
				},
				{
					name = "Attach to gdbserver :1234",
					type = "gdb",
					request = "attach",
					target = "localhost:1234",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
				},
			}

			dap.adapters.gdb = {
				type = "executable",
				command = "/usr/bin/gdb",
				args = { "--interpreter", "dap" },
			}

			vim.keymap.set("n", "<F5>", dap.continue)

			vim.keymap.set("n", "<F7>", dap.step_into)
			vim.keymap.set("n", "<F8>", dap.step_out)
			vim.keymap.set("n", "<F9>", dap.step_over)
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint)
			vim.keymap.set("n", "<Leader>dB", dap.set_breakpoint)
			vim.keymap.set("n", "<Leader>dr", dap.repl.open)
			vim.keymap.set("n", "<Leader>dl", dap.run_last)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "nvim-neotest/nvim-nio" },
		config = function()
			local dapui = require("dapui")
			dapui.setup()
			local dap = require("dap")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
}
