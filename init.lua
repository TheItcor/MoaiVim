--
--   ██████   ██████                     ███     █████   █████  ███
--  ▒▒██████ ██████                     ▒▒▒     ▒▒███   ▒▒███  ▒▒▒
--   ▒███▒█████▒███   ██████   ██████   ████     ▒███    ▒███  ████  █████████████
--   ▒███▒▒███ ▒███  ███▒▒███ ▒▒▒▒▒███ ▒▒███     ▒███    ▒███ ▒▒███ ▒▒███▒▒███▒▒███
--   ▒███ ▒▒▒  ▒███ ▒███ ▒███  ███████  ▒███     ▒▒███   ███   ▒███  ▒███ ▒███ ▒███
--   ▒███      ▒███ ▒███ ▒███ ███▒▒███  ▒███      ▒▒▒█████▒    ▒███  ▒███ ▒███ ▒███
--   █████     █████▒▒██████ ▒▒████████ █████ ██    ▒▒███      █████ █████▒███ █████
--   ▒▒▒▒▒     ▒▒▒▒▒  ▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒ ▒▒      ▒▒▒      ▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒ ▒▒▒▒▒
--
--
-- First set up: 06.11.2025
-- Author: Itcor (TheItcor)
-- Github page: github.com/TheItcor/Moai.Vim
-- Original Neovim: github.com/neovim/neovim
-- Description: Minimalistic Neovim config based on Lazy.
--
-- Special thanks: Contributer(s)
--
--
-- Last update: 09.03.2026
--                     Version
--                        |
--                        |
--                        |
--                       \ /
--                        v
_G.config_version = '[v2.0] "Stoic Moai"'

-- Bootstrap lazy.nvim {
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- }

-- Basic Options {
vim.o.number = true
vim.o.wrap = false
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.history = 200
vim.o.ruler = true
vim.o.showcmd = true
vim.o.showmatch = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true
vim.o.encoding = 'utf-8'
vim.o.swapfile = false

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
-- }

-- lazy.nvim
require('lazy').setup({
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    config = function()
      vim.cmd.colorscheme('vscode')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({})
    end,
  },
  -- Main meni {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup({
        theme = 'doom',
        config = {
          header = {
            '',
            '',
            '                               ::...... : :::                  ',
            '                    ::.    : . :. --.-- .-:=:--+               ',
            '                   - .... .   :.    : . --:. +**#*             ',
            '                 .:. :-:+#%%%%%%%#*-+:..::-+*****-***          ',
            '                =.-%%@@%%%%%%%%%%%%%%%%%%%+++%*##=#**          ',
            '                %%%%@%%@%: :. +-+#@@@%%%%%%%%#*%#%%%#          ',
            '                %%%%@@%%%=..:.=:+%%#%###%%%%%%#%#*+#*          ',
            '                =#++==+*-... -++#%*+=-+++=+=-**#%+*##          ',
            '                 :.=--==. :.::-+#-:----..: ::=###*#*#          ',
            '               :.::.---:. ..+:=*%-:-=-:.=.-..*#%#+###          ',
            '               --..----. -.-=*+*-=:.-.: ::--%%###*##*          ',
            '              =....--.. ..+==+*#==:--:-=:--=%%%%%+#*#          ',
            '              -::-... .:-:::=::::+-:=.:-==*%##%##*###          ',
            '              =-::++*###**+-=+*--==:=--:=+##%%######*          ',
            '              ==-%@@%#%%%@@@@%%##*%--:==+*%%#%%##*##*          ',
            '              +:-+#%%%%%@@%%%%%%%%*++==+=#######%####          ',
            '              =.--.-=**#****++**=+-===+**#####*#%%%##          ',
            '              --.:..:-.: ..:=--=++=-+==++##%%###%@%            ',
            '              =:#%%=:.. .:-*%@%=-:=+++++*##*#%#%%%             ',
            '              -*#############%#**#*+*++*+##%*####%             ',
            '             ==+*#****##**####%####+**+#*##*#####%             ',
            '             ==*+*+++=*+*++++*#**+=*#*+####%#####%             ',
            '             =--=-+=======+=+++**=++*=*+*#%####*#%             ',
            '            -=-==.==+:==--=+==::=+++=++=#*##%%%%%##            ',
            '            #+=+==:---=-=-======-+=+++*#%%%%%%%%%###**.        ',
            '              #==:+-=-+:-+:-=*=+#%%@%%%%%%%%%#%%##*++++-.      ',
            '             =-:*#%%%%%%%@%%%%@%%%%%%%%%%%%%##%%##****=-==:=   ',
            '',
            string.rep(' ', 61) .. config_version,
            '',
            '',
          },
          center = {
            { icon = '  ', desc = 'New File', key = 'n', action = 'ene | startinsert' },
            { icon = '󰈞  ', desc = 'Find File', key = 'f', action = 'Telescope find_files' },
            { icon = '  ', desc = 'Recent Files', key = 'r', action = 'Telescope oldfiles' },
            { icon = '  ', desc = 'Config', key = 'c', action = 'e $MYVIMRC' },
            { icon = '󰅚  ', desc = 'Quit', key = 'q', action = 'qa' },
          },
          footer = {},
        },
      })
      vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#24d4b6', bg = 'NONE', bold = true })
      vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#40E0D0', bg = 'NONE', bold = true })
      vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#FFFFFF', bg = 'NONE', bold = true })
      vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#FFFFFF', bg = 'NONE', bold = true })
    end,
  },
  -- }

  -- File management {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          'bash',
          'lua',
          'python',
          'javascript',
          'typescript',
          'c',
          'cpp',
          'rust',
          'java',
          'json',
          'yaml',
          'nasm',
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup({
        view = { width = 30, side = 'left' },
        update_focused_file = { enable = true, update_cwd = true },
      })
    end,
  },
  'nvim-tree/nvim-web-devicons',
  { 'tpope/vim-fugitive' },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup({ defaults = {} })
    end,
  },
  -- }

  -- Compile && Run {
  {
    'aliqyan-21/runTA.nvim',
    config = function()
      require('runTA.commands').setup({
        output_window_type = 'pane',
        output_window_configs = { position = 'bottom', transparent = false },
      })
    end,
  },
  -- }

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({})
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  -- Terminal {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        size = 15,
        open_mapping = [[<A-x>]],
        direction = 'horizontal',
        float_opts = { border = 'curved' },
        on_open = function(term)
          vim.defer_fn(function()
            vim.api.nvim_chan_send(term.job_id, 'clear\n')
          end, 10)
        end,
      })
    end,
  },
  -- }
  -- Non-english input {
  {
    'Wansmer/langmapper.nvim',
    config = function()
      require('langmapper').setup({
        layout = {
          'ru',
          'be',
          'de',
          'fr',
          'es',
          'it',
          'pl',
          'cz',
          'tr',
          'jp',
          'cn',
          'kr',
          'pt',
          'br',
          'fi',
          'sv',
          'no',
          'da',
          'hu',
          'ro',
          'bg',
          'gr',
          'nl',
          'in',
        },
        keep_keymaps = true,
      })
    end,
  },
  -- }
  { 'lukas-reineke/indent-blankline.nvim' },
  {
    'Civitasv/cmake-tools.nvim',
    config = function()
      require('cmake-tools').setup({
        cmake_command = 'cmake',
        cmake_build_directory = 'build',
        cmake_build_directory_prefix = 'build/',
        cmake_generate_options = { '-DCMAKE_EXPORT_COMPILE_COMMANDS=1' },
        cmake_build_options = {},
        cmake_console_size = 10,
        cmake_show_console = 'always',
      })
    end,
  },

  -- LSP, Completion, Snippets {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local servers = { 'lua_ls', 'rust_analyzer', 'pyright', 'ts_ls', 'clangd', 'asm_lsp' }

      for _, srv in ipairs(servers) do
        vim.lsp.config(srv, {
          capabilities = capabilities,
        })
        vim.lsp.enable(srv)
      end

      -- Special for Java / jdtls
      --vim.api.nvim_create_autocmd('FileType', {
      --  pattern = 'java',
      --  callback = function()
      --    if vim.fn.executable('jdtls') == 1 and vim.fn.executable('java') == 1 then
      --      local ok, jdtls = pcall(require, 'jdtls')
      --      if not ok then
      --        return
      --      end
      --      vim.lsp.config('jdtls', {
      --        cmd = { 'jdtls' },
      --        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1])
      --          or vim.fn.getcwd(),
      --        capabilities = capabilities,
      --      })
      --      vim.lsp.enable('jdtls')
      --    end
      --  end,
      --})
    end,
  },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup({
        lombok = {
          enable = false,
          version = '1.18.40',
        },
      })
      vim.lsp.enable('jdtls')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local luasnip = require('luasnip')
      require('luasnip.loaders.from_vscode').lazy_load()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = 'nvim_lsp', max_item_count = 6, group_index = 1 },
          { name = 'luasnip', max_item_count = 3, group_index = 1 },
          { name = 'buffer', keyword_length = 3, max_item_count = 2, group_index = 2 },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
          ['<C-Space>'] = cmp.mapping.complete(),
        },
        completion = { keyword_length = 2, completeopt = 'menu,menuone,noinsert,noselect' },
        window = { completion = { max_height = 6, scrollbar = true } },
        sorting = {
          comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })
    end,
  },
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'saadparwaiz1/cmp_luasnip' },
})
-- }

-- Key Mappings {
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<A-e>', ':NvimTreeToggle<CR>', {})
vim.keymap.set('n', '<F5>', ':RunCode<CR>', { noremap = true, silent = true, desc = 'Run current code' })
-- vim.keymap.set('n', 'r', '<C-r>', { noremap = true, silent = true }) -- Redo on 'r'
-- vim.keymap.set('n', 'dd', '"_dd', { noremap = true, silent = true }) -- No copy when whole line is deleted
-- vim.keymap.set({'n', 'v'}, '<C-c>', '"+y', { noremap = true, silent = true }) -- CTRL+C
-- vim.keymap.set({'n', 'v'}, '<C-v>', '"+p', { noremap = true, silent = true }) -- CTRL+V
-- vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true }) -- CTRL+V insert mode

vim.keymap.set({ 'i', 'c' }, '<F13>', '<Esc>', { noremap = true, silent = true })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find text (live grep)' })
-- }

-- Commands {
vim.api.nvim_create_user_command('Q', 'Dashboard', {})
-- }
