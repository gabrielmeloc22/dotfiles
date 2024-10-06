return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "luacheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        single_file_support = false,
      },
      lua_ls = {
        single_file_support = true,
        settings = {
          Lua = {
            worskspace = {
              checkThirdParty = false,
            },
            completion = {
              worskspaceWord = true,
              callSnippet = "Both",
            },
          },
        },
      },
      setup = {},
    },
  },
  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.sources, { name = "emoji" })
      table.insert(opts.sources, { name = "supermaven" })

      opts.mapping = cmp.mapping.preset.insert(vim.tbl_deep_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
      }))
    end,
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        disable_keymaps = true,
      })

      local completion_preview = require("supermaven-nvim.completion_preview")

      vim.keymap.set(
        "i",
        "<Tab>",
        completion_preview.on_accept_suggestion,
        { noremap = true, silent = true, desc = "Accept supermaven suggestion" }
      )
      vim.keymap.set(
        "i",
        "<C-J>", -- Ctrl + Enter
        completion_preview.on_accept_suggestion_word,
        { noremap = true, silent = true, desc = "Accept supermaven word suggestion" }
      )
    end,
  },
}
