vim.g.mapleader = ' '

require('util')
require('plugins')

vim.cmd('colorscheme gruvbox')

setOpts({
  mouse = 'a',
  termguicolors = true,

  number = true,
  relativenumber = true,

  ignorecase = true,
  smartcase = true,

  shiftwidth = 4,
  softtabstop = -1,
  shiftround = true,
  expandtab = true,
  smartindent = true,

  list = true,
  -- listchars = 'tab:→,nbsp:␣,trail:•,extends:⟩,precedes:⟨',

  scrolloff = 3,
  sidescrolloff = 5,
  splitbelow = true,
  splitright = true,

  clipboard = 'unnamedplus',
  hidden = true,

  signcolumn = 'number',

  completeopt = 'menuone,noinsert,noselect',
  -- shortmess+=c

  swapfile = false,
})
vim.o.listchars = 'tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨'

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
nnoremap('<leader>-', ':Lexplore<CR>', { silent = true })

-- Better window movement
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')
-- FZF
nnoremap('<C-p>', ':GFiles<CR>')
nnoremap('<C-_>', ':Rg<CR>')    -- <C-/> sends <C-_>
-- nnoremap('<leader>c', ':Commands<CR>')
-- vsnip
-- map('i', '<Tab>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"', { expr = true })
-- map('s', '<Tab>', 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"', { expr = true })
-- map('i', '<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"', { expr = true })
-- map('s', '<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"', { expr = true })


-- LSP
local lspconfig = require('lspconfig')
-- vim.g.completion_enable_snippet = 'vim-vsnip'

local custom_attach = function(client)
  -- require('completion').on_attach(client);
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
  inoremap('<TAB>', 'pumvisible() ? "<C-y>" : "<TAB>"', { expr = true })
  inoremap('<C-j>', 'pumvisible() ? "<Down>" : "<C-j>"', { expr = true })
  inoremap('<C-k>', 'pumvisible() ? "<Up>" : "<C-k>"', { expr = true })

  nnoremap('<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', { silent = true})
  nnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true })
  nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', { silent = true })
  nnoremap('<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', { silent = true })
  nnoremap('<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true})
  nnoremap('<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', { silent = true})

  nnoremap('<leader>dj', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { silent = true })
  nnoremap('<leader>dk', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { silent = true })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text= true,
        signs = true,
        update_in_insert = true,
    }
)

lspconfig.hls.setup{
  on_attach=custom_attach,
  -- settings = {
  -- }
}

lspconfig.rust_analyzer.setup{
    on_attach=custom_attach,
    cmd = { "rust-analyzer-linux" },
}

lspconfig.texlab.setup{
  on_attach=custom_attach,
  settings = {
    latex = {
      lint = { onSave = true; }
    }
  }
}

-- Define nicer signs for LspDiagnostics
local sign_define = vim.fn.sign_define
sign_define("LspDiagnosticsSignError", {text = "", texthl = "LspDiagnosticsSignError"})
sign_define("LspDiagnosticsSignWarning", {text = "", texthl = "LspDiagnosticsSignWarning"})
sign_define("LspDiagnosticsSignInformation", {text = "🛈", texthl = "LspDiagnosticsSignInformation"})
sign_define("LspDiagnosticsSignHint", {text = "", texthl = "LspDiagnosticsSignHint"})

-- DAP
local dap = require('dap')
-- dap.adapters.cpp = {
dap.adapters.rust = {
  type = 'executable',
  attach = {
    pidProperty = 'pid',
    pidSelect = "ask"
  },
  command = 'lldb-vscode-11',
  env = {
    LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES'
  },
  name = 'lldb'
}

nnoremap('<F5>', [[:lua require'dap'.continue()<CR>]], { silent = true })
nnoremap('<F2>', [[:lua require'dap'.toggle_breakpoint()<CR>]], { silent = true })

sign_define("DapBreakpoint", {text = "•", texthl = "LspDiagnosticsSignError"})
