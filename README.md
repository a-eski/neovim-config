# neovim-config
Setup primarily for C# and Lua development. Based on https://github.com/nvim-lua/kickstart.nvim.

## New to neovim?
Neovim configuration based on Kickstart. To get started:
  - lua basics: https://learnxinyminutes.com/docs/lua/
  - how neovim integrates with lua: :help lua-guide
  - if new to vim, run :Tutor
  - then, start reading through :help
  - then, start reading through the init.lua in this directory
  - use " sh" to [s]search the [h]elp documentation (press space (leader) then s then h, specific to kickstart and this config)
  - use " sn" to [s]earch this [n]eovim configuration (press space (leader) then s then n, specific to this config)

## Todos
* Add LSP support and capabilities for Rust, Go, C, C++, and Zig.
* Look into setting up fugitive or something else to make managing git repos easier from neovim or CLI.
* Look into vim-dadbod so I can run and write SQL queries from neovim.
* Rewrite the config so that plugins all have their own lua files (I started this somewhat, you'll see some unreferenced lua files).
