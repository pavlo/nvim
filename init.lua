
require("config")
require("plugins")
require("keymap")

vim.cmd.colorscheme "bamboo-vulgaris"

vim.filetype.add({
  extension = {
    mq5 = "cpp", 
	mqh = "cpp"
  },
})
