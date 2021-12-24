vim.o.completeopt = "menu,menuone,noselect"

local cmp = require'cmp'
local lspkind = require('lspkind')
-- local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
 formatting = {
    format = lspkind.cmp_format(),
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif luasnip.expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end,
      ["<S-Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end,
  },
  sources = cmp.config.sources({
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' }
  }, {
    { name = 'buffer', keyword_length=3 },
    { name = 'path' }
  })
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})

local map_key = vim.api.nvim_set_keymap
local opts = {silent=true, noremap=true}

-- vsnip
vim.g.vsnip_snippet_dir = os.getenv('HOME') .. "/.config/nvim/snippets"

local map_key = vim.api.nvim_set_keymap
local opts = {expr=true}
map_key('i', '<Tab>', [[vsnip#available()  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>']], opts)
map_key('s', '<Tab>', [[vsnip#available()  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>']], opts)

map_key('s', '<C-l>', [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : '<C-l>']], opts)
map_key('s', '<C-j>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-j>']], opts)
