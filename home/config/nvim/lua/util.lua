local keymap = vim.api.nvim_set_keymap

-- Set options with vim.cmd as it's unclear which one of vim.o should be used
function setOpts(opts)
  for k,v in pairs(opts) do
    if (type(v)=="boolean") then
      if (v) then
        vim.cmd(string.format('set %s', k))
      else
        vim.cmd(string.format('set no%s', k))
      end
    else
      vim.cmd(string.format('set %s=%s', k, v))
    end
  end
end

function map(mode, lhs, rhs, opts)
  local options = {}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function nnoremap(lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  map('n', lhs, rhs, options)
end

function inoremap(lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  map('i', lhs, rhs, options)
end
