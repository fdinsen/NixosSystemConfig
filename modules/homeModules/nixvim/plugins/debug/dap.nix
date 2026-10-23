{ lib, ... }:
# TODO: Consider making dap-plugins depend on the languages installed
{
  # Debugging
  flake.nixvimPlugins.debug.dap =
    { pkgs, config, ... }:
    {
      programs.nixvim = {
        plugins = {
          dap = {
            enable = true;
            adapters = {
              executables.haskell = lib.mkIf config.custom.nixvimLangs.haskell.enable {
                command = "haskell-debug-adapter";
              };
              servers.codelldb = lib.mkIf config.custom.nixvimLangs.rust.enable {
                port = "\${port}";
                executable = {
                  command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
                  args = [
                    "--port"
                    "\${port}"
                  ];
                };
              };
            };
            configurations = {
              haskell = lib.mkIf config.custom.nixvimLangs.haskell.enable [
                {
                  type = "haskell";
                  request = "launch";
                  name = "Debug";
                  workspace = "\${workspaceFolder}";
                  startup = "./Main.hs";
                  stopOnEntry = false;
                }
              ];
              rust = lib.mkIf config.custom.nixvimLangs.rust.enable [
                {
                  name = "Launch (codelldb)";
                  type = "codelldb";
                  request = "launch";
                  cwd = "\${workspaceFolder}";
                  stopOnEntry = false;
                  program.__raw = ''
                    function()
                      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
                    end
                  '';
                }
              ];
            };
          };
          dap-python = {
            enable = true;
          };
          dap-lldb = lib.mkIf config.custom.nixvimLangs.rust.enable {
            enable = true;
            settings.codelldb_path = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
          };
          dap-ui = {
            enable = true;
          };
          dap-virtual-text = {
            enable = true;
          };
        };
        keymaps = [
          {
            key = "<leader>d";
            options.desc = "Debugging";
            action = "";
          }
          {
            key = "<leader>dt";
            options.desc = "Toggle Breakpoint";
            options.nowait = true;
            action = ":lua require(\"dap\").toggle_breakpoint()<CR>";
          }
          {
            key = "<leader>dc";
            options.desc = "Continue";
            options.nowait = true;
            action = ":lua require(\"dap\").continue()<CR>";
          }
          {
            key = "<leader>di";
            options.desc = "Step Into";
            options.nowait = true;
            action = ":lua require(\"dap\").step_into()<CR>";
          }
          {
            key = "<leader>do";
            options.desc = "Step Over";
            options.nowait = true;
            action = ":lua require(\"dap\").step_over()<CR>";
          }
          {
            key = "<leader>du";
            options.desc = "Step Out";
            options.nowait = true;
            action = ":lua require(\"dap\").step_out()<CR>";
          }
          {
            key = "<leader>dr";
            options.desc = "Open REPL";
            options.nowait = true;
            action = ":lua require(\"dap\").repl.open()<CR>";
          }
          {
            key = "<leader>dl";
            options.desc = "Run Last";
            options.nowait = true;
            action = ":lua require(\"dap\").run_last()<CR>";
          }
          {
            key = "<leader>dq";
            options.desc = "Terminate";
            options.nowait = true;
            action = ":lua require(\"dap\").terminate()<CR>
                    :lua require(\"dapui\").close()<CR>
                    :lua require(\"nvim-dap-virtual-text\").toggle()<CR>";
          }
          {
            key = "<leader>db";
            options.desc = "List Breakpoints";
            options.nowait = true;
            action = ":lua require(\"dap\").list_breakpoints()<CR>";
          }
          {
            key = "<leader>de";
            options.desc = "Set Exception Breakpoints";
            options.nowait = true;
            action = ":lua require(\"dap\").set_exception_breakpoints({ \"all\" })<CR>";
          }
          {
            key = "<leader>dw";
            options.desc = "Toggle UI";
            options.nowait = true;
            action = ":lua require(\"dapui\").toggle()<CR>";
          }
        ];
      };
    };
}
