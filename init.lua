
require("config")
require("plugins")
require("keymap")
require("sessions")

vim.cmd.colorscheme "bamboo-vulgaris"

vim.filetype.add({
  extension = {
    mq5 = "cpp", 
    mqh = "cpp"
  },
})
