-- init.lua
local session_dir = vim.fn.expand('~/.config/nvim/sessions')

if vim.fn.isdirectory(session_dir) == 0 then
  vim.fn.mkdir(session_dir, 'p')
end

vim.opt.sessionoptions = 'curdir,folds,tabpages,winsize,terminal'

-- Auto-save on exit
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    if vim.v.this_session ~= '' then
      vim.cmd('mksession! ' .. vim.v.this_session)
    end
  end
})

-- SessionSave command
vim.api.nvim_create_user_command('SessionSave', function(opts)
  local name = opts.args
  vim.cmd('mksession! ' .. session_dir .. '/' .. name .. '.vim')
end, { nargs = 1 })

vim.api.nvim_create_user_command('SessionLoad', function()
  local fzf = require('fzf-lua')
  local files = vim.fn.glob(session_dir .. '/*.vim', false, true)
  local sessions = vim.tbl_map(function(f)
    return vim.fn.fnamemodify(f, ':t:r')
  end, files)
  
  fzf.fzf_exec(sessions, {
    prompt = 'Sessions> ',
    actions = {
      default = function(selected)
        vim.cmd('source ' .. session_dir .. '/' .. selected[1] .. '.vim')
      end
    }
  })
end, {})

vim.keymap.set('n', '<leader>ss', ':SessionSave ', { noremap = true })
vim.keymap.set('n', '<leader>sl', ':SessionLoad <CR>', { noremap = true })
-- Update current session
vim.keymap.set('n', '<leader>su', function()
  vim.cmd('mksession! ' .. vim.v.this_session)
end, { noremap = true })
