local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local extras = require("luasnip.extras")
local m = extras.m
local l = extras.l
local rep = extras.rep
local postfix = require("luasnip.extras.postfix").postfix

local snips =  {
		s('pcall', {
			t('local status_ok, '), rep(1), t(' = pcall('), i(2), t(', "'), i(1), t('")'),
			t({'', 'if not status_ok then' }),
			t({'', '    return' }),
			t({'', 'end' })
		}),
		s('bcomm', {
		    t('----------'),
			t({'', '-- ' }), i(1),
			t({'', '----------'})
		}),
		s('gfor', {
		    t('for '), i(1,'i'), t(' = '), i(2), t(', '), i(3), t(', '), i(4), t(' do'),
			t({'','    '}), i(4),
			t({'', 'end'})
		}),
		s('nfor', {
		    t('for '), i(1,'k'), t(', '), i(2, 'v'), t(' in pairs('), i(3), t(') do'),
			t({'','    '}), i(4),
			t({'', 'end'})
		}),
		s('vprint', {
		    t("print('"), i(1), t(" = ', "), rep(1), t(')')
		}),
		s('new', { 
			t("local gp = require ('gnuplot')"),
			t({'', "local ul = require('uselib')"})
		}),
	} 

local autosnips = {
	}

return snips, autosnips
