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

local function tit(index)
	return f(function(args)
		return string.gsub(args[1][1], '.', '=')
	end, {index})
end


local function stit(index)
	return f(function(args)
		return string.gsub(args[1][1], '.', '-')
	end, {index})
end

local function sstit(index)
	return f(function(args)
		return string.gsub(args[1][1], '.', '~')
	end, {index})
end

local snips =  {
	s('tit', {
	    i(1),
		t({'', ''}), tit(1),
		t({'', ''}),
		t({'', ''}), i(0),
	}),
	s('stit', {
	    i(1),
		t({'', ''}), stit(1),
		t({'', ''}),
		t({'', ''}), i(0),
	}),
	s('sstit', {
	    i(1),
		t({'', ''}), sstit(1),
		t({'', ''}),
		t({'', ''}), i(0),
	}),
	s('it', {
	    t('_'), i(1), t('_'),
	}),
	s('bf', {
	    t('**'), i(1), t('**'),
	}),
	s('tt', {
	    t('`'), i(1), t('`'),
	}),
	s('code', {
	    t('```'), i(1),
		t({'', ''}), i(2),
		t({'', '```'}),
	}),
	s('link', {
	    t('['), i(1, 'Text'), t(']('), i(2, 'link'), t(')'),
	}),
	}

local autosnips = {
	}

return snips, autosnips
