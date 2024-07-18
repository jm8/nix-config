{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      # {
      #   plugin = nvim-tree-lua;
      #   type = "lua";
      #   config = ''
      #     require('nvim-tree').setup {
      #       view = {
      #         side = "right"
      #       },
      #       sync_root_with_cwd = true,
      #       actions = {
      #         change_dir = {
      #           global = true
      #         }
      #       },
      #     }
      #   '';
      # }

      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require('catppuccin').setup {
            flavour = "macchiato"
          }
          vim.cmd.colorscheme "catppuccin"
        '';
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require('nvim-treesitter.configs').setup {
            highlight = { enable = true}
          }
        '';
      }

      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          local function metals_status()
            return vim.g["metals_status"] or ""
          end
          require('lualine').setup {
            sections = {
              lualine_b = { 'branch', 'diff' },
              lualine_y = {'progress'},
              lualine_z = {'location'}
            }
          }
        '';
      }

      {
        plugin = bufferline-nvim;
        type = "lua";
        config = ''
          require("bufferline").setup{}
        '';
      }

      nvim-treesitter-textobjects

      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = ''
          require("lspconfig").zls.setup{}
          require("lspconfig").rust_analyzer.setup{}
          require("lspconfig").clangd.setup{}
        '';
      }

      trouble-nvim

      plenary-nvim

      telescope-nvim
      telescope-fzf-native-nvim

      fidget-nvim

      {
        plugin = comment-nvim;
        type = "lua";
        config = ''
          require("Comment").setup({
            toggler = {
              line = '<C-c>'
            },
            opleader = {
              line = '<C-c>',
            }
          })
        '';
      }
      nvim-ts-context-commentstring

      luasnip
      {
        plugin = nvim-cmp;
        type = "lua";
        config = ''
          local luasnip = require("luasnip")
          local cmp = require("cmp")
          cmp.setup({
            enabled = function()
              -- disable completion in comments
              local context = require("cmp.config.context")
              -- keep command mode completion enabled when cursor is in a comment
              if vim.api.nvim_get_mode().mode == "c" then
                return true
              else
                return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
              end
            end,
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            completion = {
              completeopt = 'menu,menuone,noinsert'
            },
            mapping = {
              ["<Up>"] = cmp.mapping.select_prev_item(),
              ["<Down>"] = cmp.mapping.select_next_item(),
              ["<C-d>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ["<C-Space>"] = cmp.mapping.complete(),
              ["<C-e>"] = cmp.mapping.close(),
              ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
              }),
              ["<Tab>"] = function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end,
              ["<S-Tab>"] = function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end,
            },
            sources = {
              { name = "nvim_lsp" },
              { name = "luasnip" },
              { name = "path" },
              { name = "crates" },
            },
          })
        '';
      }

      cmp-nvim-lsp
      cmp-buffer
      cmp-cmdline

      clangd_extensions-nvim

      {
        plugin = guess-indent-nvim;
        type = "lua";
        config = ''
          require('guess-indent').setup {}
        '';
      }

      {
        plugin = auto-session;
        type = "lua";
        config = ''
          require("auto-session").setup {
          }
        '';
      }
    ];
    extraConfig = ''
      map <Space> <Leader>
      :set sessionoptions=blank,buffers,tabpages,curdir,options,localoptions
      :set number
      :set relativenumber
      :set expandtab
      :set tabstop=4
      :set shiftwidth=4
      nnoremap <Leader>p "+p
      nnoremap <Leader>P "+P
      nnoremap <Leader>d "+d
      nnoremap <Leader>D "+D
      nnoremap <Leader>y "+y
      nnoremap <Leader>Y "+Y
      nnoremap <Leader>f <cmd>Telescope find_files<cr>
      nnoremap <Leader>b <cmd>Telescope buffers<cr>
      nnoremap gd <cmd>Telescope lsp_definitions<cr>
      nnoremap <Leader>d <cmd>Telescope diagnostics<cr>
      nnoremap <Leader>s <cmd>Telescope lsp_document_symbols<cr>
      map <C-l> <cmd>bnext<cr>
      map <C-h> <cmd>bprevious<cr>
      map <C-s> <cmd>w<cr>
      map <C-q> <cmd>xa<cr>
      autocmd BufWritePre * lua vim.lsp.buf.format()
    '';
  };
}
