-- ~/.config/nvim/lua/snippets/mako.lua

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define Mako snippets
ls.add_snippets("mako", {
    s("def", {
        t("<%def name=\""), i(1, "name"), t({"\">", "\t"}),
        i(0),
        t({"", "</%def>"})
    }),
    s("call", {
        t("<%call expr=\""), i(1, "name"), t({"\">", "\t"}),
        i(0),
        t({"", "</%call>"})
    }),
    s("doc", {
        t("<%doc>"),
        i(0),
        t({"", "</%doc>"})
    }),
    s("text", {
        t("<%text>"),
        i(0),
        t({"", "</%text>"})
    }),
    s("for", {
        t("% for "), i(1, "i"), t(" in "), i(2, "iter"), t({":", "\t"}),
        i(0),
        t({"", "% endfor"})
    }),
    s("if", {
        t("% if "), i(1, "condition"), t({":", "\t"}),
        i(0),
        t({"", "% endif"})
    }),
    s("ife", {
        t("% if "), i(1, "condition"), t({":", "\t"}),
        i(2),
        t({"", "% else:", "\t"}),
        i(0),
        t({"", "% endif"})
    }),
    s("try", {
        t("% try:"), i(1), t({"", "% except"}), i(2), t({":", "\t"}),
        i(0),
        t({"", "% endtry"})
    }),
    s("wh", {
        t("% while "), i(1), t({":", "\t"}),
        i(0),
        t({"", "% endwhile"})
    }),
    s("$", {
        t("${ "), i(0), t(" }")
    }),
    s("<%", {
        t("<% "), i(0), t(" %>")
    }),
    s("<!%", {
        t("<!% "), i(0), t(" %>")
    }),
    s("inherit", {
        t("<%inherit file=\""), i(0, "filename"), t({"\" />"})
    }),
    s("include", {
        t("<%include file=\""), i(0, "filename"), t({"\" />"})
    }),
    s("namespace", {
        t("<%namespace file=\""), i(0, "name"), t({"\" />"})
    }),
    s("page", {
        t("<%page args=\""), i(0), t({"\" />"})
    }),
})

