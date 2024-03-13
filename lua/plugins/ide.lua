return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'go',
          'javascript',
          'lua',
          'markdown',
          'markdown_inline',
          'php',
          'python',
          'typescript',
          'vim',
          'vimdoc',
        },
        auto_install = true,
        highlight = {
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      local treesj = require('treesj')

      treesj.setup({
        use_default_keymaps = false,
      })

      vim.keymap.set('n', 'gS', treesj.split, { desc = 'Split under cursor' })
      vim.keymap.set('n', 'gJ', treesj.join, { desc = 'Join under cursor' })
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls' },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      {
        'L3MON4D3/LuaSnip',
        run = 'make install_jsregexp',
      },
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        completion = { completeopt = 'menu,menuone' },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete({}),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        }),
      })
    end,
  },
}
