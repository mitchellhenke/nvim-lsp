local nvim_lsp = require'nvim_lsp'
local configs = require'nvim_lsp/skeleton'

if not nvim_lsp.elixir_ls then
  configs.elixir_ls = {
    default_config = {
      cmd = {'/Users/mitchellhenke/.config/elixir-ls/language_server.sh'};
      filetypes = {'ex', 'exs', 'eex'};
      root_dir = function(fname)
        return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end;
      log_level = vim.lsp.protocol.MessageType.Warning;
      settings = {};
    };
  }
end
nvim_lsp.elixir_ls.setup{}
