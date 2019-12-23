local skeleton = require 'nvim_lsp/skeleton'
local util = require 'nvim_lsp/util'
local lsp = vim.lsp

local server_name = "elixir_ls"
local bin_name = "/Users/mitchellhenke/.config/elixir-ls/language_server.sh"

local root_pattern = util.root_pattern(".git")

skeleton[server_name] = {
  default_config = util.utf8_config {
    cmd = {bin_name};
    filetypes = {"ex", "exs", "eex"};
    root_dir = function(fname)
      return root_pattern(fname) or vim.loop.os_homedir()
    end;
    log_level = lsp.protocol.MessageType.Warning;
    settings = {};
  };
  docs = {
    description = [[
https://github.com/vscode-langservers/vscode-css-languageserver-bin

`css-languageserver` can be installed via `:LspInstall cssls` or by yourself with `npm`:
```sh
npm install -g vscode-css-languageserver-bin
```
]];
    default_config = {
      root_dir = [[root_pattern(".git")]];
      on_init = [[function to handle changing offsetEncoding]];
      capabilities = [[default capabilities, with offsetEncoding utf-8]];
    };
  };
}

skeleton[server_name].install = installer.install
skeleton[server_name].install_info = installer.info
-- vim:et ts=2 sw=2
