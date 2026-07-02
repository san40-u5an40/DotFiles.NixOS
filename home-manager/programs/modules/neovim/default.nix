{ pkgs, ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      roslyn-ls
      netcoredbg
      csharpier
      lua-language-server
      nil
      nixpkgs-fmt
      ripgrep
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      vim-devicons
      plenary-nvim
      lualine-nvim
      smear-cursor-nvim
      yazi-nvim

      telescope-nvim
      telescope-fzf-native-nvim
      telescope-lsp-handlers-nvim

      roslyn-nvim
      luasnip
      friendly-snippets
      blink-cmp
      gitsigns-nvim
      nvim-lightbulb
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      nvim-nio
    ];
    extraConfig = ''
      set encoding=utf8
      set nocompatible
      set ignorecase
      set smartcase
      set hlsearch
      set tabstop=2
      set softtabstop=2
      set shiftwidth=2
      set expandtab
      set smarttab
      set autoindent
      set smartindent
      set number
      set relativenumber
      syntax on
      set clipboard=unnamedplus
      set ttyfast
      set so=30
      set guicursor=i:block
      filetype plugin indent on
      let g:netrw_liststyle=3
      let g:netrw_banner=0
      let g:netrw_browse_split=3
    '';
    initLua = ''
      -- Модули из конфигурационной директории
      require('keymap')
      require('plugins.cmp')
      require('plugins.dap')
      require('plugins.gitsigns')
      require('plugins.lightbulb')
      require('plugins.lualine')
      require('plugins.luasnip')
      require('plugins.smear')
      require('plugins.telescope')
      require('plugins.yazi')

      -- LSP (т.к. в файлах сложнее интернировать путь до запуска LSP-сервера)
      local on_attach = function(client, bufnr)
          local opts = { buffer = bufnr, noremap = true, silent = true }

          vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>f', function()
              vim.lsp.buf.format({ async = true })
          end, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      end
            
      vim.diagnostic.config({
          virtual_text = true,
          underline = true,
          update_in_insert = true
      })

      vim.lsp.config['roslyn'] = {
          cmd = {
            vim.fn.exepath('Microsoft.CodeAnalysis.LanguageServer'),
            '--logLevel=Information',
            '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
            '--stdio',
          },
          on_attach = on_attach,
          settings = {
            ['csharp|background_analysis'] = {
              dotnet_analyzer_diagnostics_scope = "fullsolution",
              dotnet_compiler_diagnostics_scope = "fullsolution",
            },
            ['csharp|code_lens'] = {
              dotnet_enable_references_code_lens = true,
              dotnet_enable_tests_code_lens = true,
            },
            ['csharp|completion'] = {
              dotnet_show_completion_items_from_unimported_namespaces = true,
              dotnet_show_name_completion_suggestions = true,
            },
            ['csharp|inlay_hints'] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              csharp_enable_inlay_hints_for_types = true,
              dotnet_enable_inlay_hints_for_indexer_parameters = true,
              dotnet_enable_inlay_hints_for_literal_parameters = true,
              dotnet_enable_inlay_hints_for_object_creation_parameters = true,
              dotnet_enable_inlay_hints_for_other_parameters = true,
              dotnet_enable_inlay_hints_for_parameters = true,
              dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
              dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
              dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
            },
            ['csharp|symbol_search'] = {
              dotnet_search_reference_assemblies = true,
            },
            ['csharp|formatting'] = {
              dotnet_organize_imports_on_format = true,
            },
          }
      }

      vim.lsp.config['nil-ls'] = {
          cmd = { "${pkgs.nil}/bin/nil" },
          filetypes = { 'nix' },
          root_markers = { 'flake.nix', '.git' },
          on_attach = on_attach,
          settings = {
              ['nil'] = {
                  formatting = {
                      command = { "${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt" },
                  },
                  diagnostics = {
                      ignored = { "unused_bindings" },
                  },
              },
          },
      }

      vim.lsp.config['lua-ls'] = {
          cmd = { "${pkgs.lua-language-server}/bin/lua-language-server" },
          filetypes = { 'lua' },
          root_markers = { 
              '.luarc.json',
              '.luarc.jsonc',
              '.luacheckrc',
              '.stylua.toml',
              'stylua.toml',
              'selene.toml',
              'selene.yml',
              '.git'
          },
          on_attach = on_attach,
          settings = {
              Lua = {
                  runtime = {
                      version = 'Lua 5.4',
                  },
                  diagnostics = {
                      enable = true,
                      globals = { 'vim' },
                  },
                  workspace = {
                      library = { vim.env.VIMRUNTIME },
                      checkThirdParty = false,
                  },
                  telemetry = {
                      enable = false,
                  },
                  completion = {
                      enable = true,
                  },
              },
          },
      }

      vim.lsp.enable({
          'nil-ls',
          'roslyn',
          'lua-ls',
      })
    '';
  };
  home.file = {
    ".config/nvim/lua" = {
      source = ./configuration;
      recursive = true;
    };
  };
}
