return {
  {
    'UtkarshVerma/molokai.nvim',
    priority = 1000,
    config = function()
      require('molokai').setup({
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      })

      vim.cmd.colorscheme('molokai')
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    -- dependencies = { 'nvim-tree/nvim-web-devicons' }
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = false,
          theme = 'molokai',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        extensions = { 'neo-tree', 'nvim-dap-ui' },
      })
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require('neo-tree').setup({
        close_if_last_window = true,

        default_component_configs = {
          indent = {
            expander_collapsed = '▶',
            expander_expanded = '▼',
          },
          icon = {
            folder_closed = '▶',
            folder_open = '▼',
            folder_empty = '▷',
            default = ' ',
            highlight = 'NeoTreeFileIcon',
          },
          name = {
            use_git_status_colors = false,
          },
          git_status = {
            symbols = {
              added = '',
              modified = '✹',
              deleted = '✖',
              renamed = '➜',
              untracked = '✭',
              ignored = '☒',
              unstaged = '✗',
              staged = '+',
              conflict = 'C',
            },
          },
        },

        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = { '.git' },
          },
        },

        window = {
          position = 'right',
          mappings = {
            ['oo'] = { 'open', nowait = true },
          },
        },
      })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '│' },
          change = { text = '│' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
          untracked = { text = '┆' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', 'gn', gs.next_hunk, { desc = 'Next Hunk' })
          map('n', 'gp', gs.prev_hunk, { desc = 'Prev Hunk' })
          map('n', 'gu', gs.undo_stage_hunk, { desc = 'Undo Stage Hunk' })
        end,
      })
    end,
  },

  {
    'tpope/vim-fugitive',
    lazy = false,
    config = function()
      vim.keymap.set('n', 'gs', '<Cmd>Git<CR>')
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<esc>'] = actions.close,
            },
          },
        },
        pickers = {
          buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
          },
        },
      })
      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>m', builtin.git_status, { desc = 'Find modified files' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
      vim.keymap.set('n', '<leader>fu', builtin.lsp_document_symbols, { desc = 'Find symbols in document' })
    end,
  },

  'tpope/vim-surround', -- E.g. cs{(
  {
    'vimwiki/vimwiki',
    init = function()
      vim.g.vimwiki_list = {
        { path = '~/Dropbox/notes/' },
      }
    end,
  },

  'github/copilot.vim',

  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
