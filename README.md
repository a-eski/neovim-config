# neovim-config
My neovim-config. Setup primarily for web, C#, C, and Lua development.

## New to neovim?
- This is a configuration for neovim originally based on kickstart.nvim, which is a starter config maintained by the neovim community to help get people started with neovim.
- kickstart.nvim will have a ton of in-depth comments and information for beginners, some or all which may be removed from this config over time. This is why I would recommend beginners to install neovim and mess around with kickstart.nvim, read through init.lua, get familiar with vim motions, and get familiar with how to setup a neovim configuration. Then you will be well set to fork kickstart.nvim or this config for your own use :). Of course, you could also go with a distribution like astro, which is a very popular choice in the community. I chose to go with my own config because I experienced the need to configure things with distro's anyway, so figured I may as well setup from scratch and try to get a better understanding of what's happening under the hood.

To get started:
  - lua basics: https://learnxinyminutes.com/docs/lua/
  - how neovim integrates with lua: :help lua-guide
  - if new to vim, run :Tutor
  - then, start reading through :help
  - then, start reading through the init.lua in this directory
  - use " sh" to [s]search the [h]elp documentation (press space (leader) then s then h, specific to kickstart and this config)
  - use " sn" to [s]earch this [n]eovim configuration (press space (leader) then s then n, specific to this config)

## Todos
* Add LSP support and capabilities for Rust, Go, and Zig.
* Look into vim-dadbod so I can run and write SQL queries from neovim.
* Rewrite the config so that plugins all have their own lua files.
* Get debugging working well for .NET and C/C++ projects.
