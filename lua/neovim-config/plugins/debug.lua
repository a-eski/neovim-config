return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- Creates a beautiful debugger UI
		"rcarriga/nvim-dap-ui",
		-- Required dependency for nvim-dap-ui
		"nvim-neotest/nvim-nio",
		-- Installs the debug adapters for you
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		-- Add your own debuggers here
		--"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- Makes an effort to setup various debuggers with sensible defaults
			automatic_installation = true,
			automatic_setup = true,

			-- additional config for handlers. see mason-nvim-dap README
			handlers = {},

			ensure_installed = {
				"delve",
				"netcoredbg",
			},
		})

		if not dap.adapters["netcoredbg"] then
			dap.adapters["netcoredbg"] = {
				type = "executable",
				command = vim.fn.exepath("netcoredbg"),
				args = { "--interpreter=vscode" },
			}
		end

		-- dap.adapters.coreclr = {
		-- 	type = "executable",
		-- 	command = "netcoredbg",
		-- 	args = { "--interpreter=vscode" },
		-- }

		-- for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
		-- 	if not dap.configurations[lang] then
		-- 		dap.configurations[lang] = {
		-- 			{
		-- 				type = "netcoredbg",
		-- 				name = "Launch file",
		-- 				request = "launch",
		-- 				---@diagnostic disable-next-line: redundant-parameter
		-- 				program = function()
		-- 					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
		-- 				end,
		-- 				cwd = "${workspaceFolder}",
		-- 			},
		-- 		}
		-- 	end
		-- end

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "Launch - netcoredbg",
				request = "launch",
				console = "integratedTerminal",
				env = "ASPNETCORE_ENVIRONMENT=Development",
				args = {},
				program = function()
					return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
				end,
			},
		}

		require("nvim-dap-virtual-text").setup()
		require("dapui").setup()

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Basic debugging keymaps, feel free to change to your liking!
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

		-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
		vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })
	end,
}
