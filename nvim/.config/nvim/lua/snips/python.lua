
local ls = require("luasnip")
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
-- local m = extras.m
-- local l = extras.l
local rep = extras.rep
-- local postfix = require("luasnip.extras.postfix").postfix

local snips =  {
		s('bcomm', {
		    t('##########'),
			t({'', '# ' }), i(1),
			t({'', '##########'})
		}),
		s('lstr', {
		    t("'''"),
			t({'', ''}), i(1),
		    t({'', "'''" }),
		}),
		s('vprint', {
		    t("print('"), i(1), t(" = ', "), rep(1), t(')')
		}),
		s('new', {
			t("import matplotlib.pyplot as plt"),
			t({'', "import numpy as np"})
		}),
		s('if', {
			t('if '), i(1), t(':'),
			t({'', '    '}), i(2)
		}),
		s('pggrid', {
		    t('.showGrid(x = True, y = True)'),
		}),
	}

local autosnips = {
	}

return snips, autosnips
