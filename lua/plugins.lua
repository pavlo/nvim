
--vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

vim.pack.add { { 
	src = "https://github.com/ribru17/bamboo.nvim" } 
}
require("bamboo").setup()

-- LUALINE
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim"
})
require("lualine").setup()

-- FZF LUA
vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
    winopts = { backdrop = 85 },
    keymap = {
        builtin = {
            ["<C-f>"] = "preview-page-down",
            ["<C-b>"] = "preview-page-up",
            ["<C-p>"] = "toggle-preview",
        },
        fzf = {
            ["ctrl-a"] = "toggle-all",
            ["ctrl-t"] = "first",
            ["ctrl-g"] = "last",
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
        }
    },
    actions = {
        files = {
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-n"] = actions.toggle_ignore,
            ["ctrl-h"] = actions.toggle_hidden,
            ["enter"]  = actions.file_edit_or_qf,
        }
    }
})

-- BLINK
vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "enter",
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
		menu = {
			auto_show = false
		},
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        },
		list = {
			selection = {
				preselect = true,
				auto_insert = false
			},
		},
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { 'lsp', 'buffer', 'snippets', 'path' } }
})


vim.pack.add({
    { src = "https://github.com/folke/flash.nvim" },
})
-- Просто setup без кастомних опцій (дефолти вже хороші)
require("flash").setup()

-- Кейбіндінги задаються окремо
vim.keymap.set({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash jump" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
  require("flash").treesitter()
end, { desc = "Flash Treesitter" })

