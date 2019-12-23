local skeleton = require 'nvim_lsp/skeleton'
local util = require 'nvim_lsp/util'
local lsp = vim.lsp

skeleton.elixir_ls = {
  default_config = util.utf8_config {
    cmd = {'/Users/mitchellhenke/.config/elixir-ls/language_server.sh'};
    filetypes = {"ex", "exs", "eex"};
    root_dir = function(fname)
      return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    log_level = lsp.protocol.MessageType.Warning;
    settings = {};
  };
  -- commands = {};
  -- on_new_config = function(new_config) end;
  -- on_attach = function(client, bufnr) end;
  docs = {
    description = [[
https://clang.llvm.org/extra/clangd/Installation.html
**NOTE:** Clang >= 9 is recommended! See [this issue for more](https://github.com/neovim/nvim-lsp/issues/23).
clangd relies on a [JSON compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html) specified
as compile_commands.json or, for simpler projects, a compile_flags.txt.
]];
    default_config = {
      root_dir = [[root_pattern("mix.exs"), root_pattern(".git")]];
      on_init = [[function to handle changing offsetEncoding]];
      capabilities = [[default capabilities, with offsetEncoding utf-8]];
    };
  };
}
-- vim:et ts=2 sw=2
