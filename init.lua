
require("config")
require("plugins")
require("keymap")

vim.cmd.colorscheme "catppuccin-macchiato"

vim.filetype.add({
  extension = {
    mq5 = "cpp", 
	mqh = "cpp"
  },
})
