-- load snippets made by luasnip
--local snippet = require("snippets")
local luasnip = require("luasnip")
local cmp = require("cmp")
-- luasnip setup

local kind_icons = {
    Class = " ",
    Color = " ",
    Constant = "ﲀ ",
    Constructor = " ",
    Enum = "練",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = "",
    Folder = " ",
    Function = " ",
    Interface = "ﰮ ",
    Keyword = " ",
    Method = " ",
    Module = " ",
    Operator = "",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    Struct = " ",
    Text = " ",
    TypeParameter = " ",
    Unit = "塞",
    Value = " ",
    Variable = " ",
}
-- require("luasnip.loaders.from_snipmate").load()
-- require("luasnip.loaders.from_snipmate").lazy_load({ path = "../my-snippets" }) -- load snippets from my-snippets
--
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").load({paths = "../my-snippets"})
--
-- nvim-cmp setup
local cmp = require 'cmp'

cmp.setup {
    snippet = {
    expand = function(args)
        luasnip.lsp_expand(args.body)
    end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    },
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
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'treesitter'},
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "spell" },
    },
   formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- kind icons
            --vim_item.kind = string.format("%s", kind_icon[vim_item.kind])
            --vim_item.kind = string.format("%s %s", kind_icon[vim_item.kind], vim_item.kind)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[NVIM_LUA]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                spell = "[Spell]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    }, 
    flags = {
        debounce_text_changes = 150,
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },  
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(), 
    },
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})
 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
require("nvim-autopairs").setup()

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
