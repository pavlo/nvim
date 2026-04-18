# nvim

Personal Neovim configuration, built around Neovim's native `vim.pack` plugin manager and built-in LSP.

## Requirements

- Neovim 0.12+ (uses `vim.pack` and the `lsp/` runtime directory)
- A Nerd Font (for `nvim-web-devicons` / `lualine`)
- `git`, `ripgrep`, `fzf` and `fd` on `$PATH`

## Install

Clone into your Neovim config directory:

```sh
git clone https://github.com/pavlikus/nvim ~/.config/nvim
nvim
```

On first launch `vim.pack` will fetch the plugins listed in [lua/plugins.lua](lua/plugins.lua).

## Layout

```
.
├── init.lua              entry point
├── lua/
│   ├── config.lua        core options and leader
│   ├── plugins.lua       plugin declarations and setup
│   └── keymap.lua        global keymaps
└── lsp/                  per-server LSP configs (vim.lsp.config)
```

## Plugins

- [catppuccin/nvim](https://github.com/catppuccin/nvim) — `catppuccin-macchiato` colorscheme
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — statusline
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) — file icons
- [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua) — fuzzy finder
- [saghen/blink.cmp](https://github.com/saghen/blink.cmp) — completion
- [folke/flash.nvim](https://github.com/folke/flash.nvim) — motion / jump

## Keymaps

Leader is `<Space>`.

| Mode    | Mapping              | Action                |
| ------- | -------------------- | --------------------- |
| n       | `<leader>e`          | `:Explore` (netrw)    |
| n       | `<leader><leader>`   | fzf files             |
| n       | `<leader>b`          | fzf buffers           |
| n       | `<leader>/`          | fzf live grep         |
| n/x/o   | `s`                  | Flash jump            |
| n/x/o   | `S`                  | Flash treesitter      |

Completion (blink.cmp): `<C-y>` toggle docs, `<C-n>` accept, `<C-j>`/`<C-k>` next/prev, `<C-l>`/`<C-h>` snippet forward/back, `<C-f>`/`<C-b>` scroll docs.

## Filetypes

`.mq5` and `.mqh` (MetaTrader 5 / MQL) are mapped to `cpp` for syntax and LSP.

## License

[MIT](LICENSE)
