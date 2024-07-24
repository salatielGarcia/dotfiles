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
    s('new', {
        t('\\documentclass[12pt]{'), i(1), t('}'),
        t({'', '\\usepackage[utf8]{inputenc}'}),
        t({'', '\\usepackage[english]{babel}'}),
        t({'', '\\usepackage[hmargin=1.25cm,vmargin=1.25cm,columnsep=1.25cm]{geometry}'}),
        t({'', ''}),
    }),
    s('begin', {
        t('\\begin{'), i(1), t('}'),
        t({'', '    '}), i(2),
        t({'', '\\end{'}), rep(1), t('}')
    }),
    s('bf', {
        t('\\textbf{'), i(1), t('}'),
    }),
    s('it', {
        t('\\textit{'), i(1), t('}'),
    }),
    s('tt', {
        t('\\texttt{'), i(1), t('}'),
    }),
    s('title', {
        t('\\title{'), i(1), t('}'),
    }),
    s('auth', {
        t('\\author{'), i(1), t('}'),
    }),
    s('sec', {
        t('\\section{'), i(1), t('}'),
        t({'', '\\label{sec:'}), i(2), t('}'),
    }),
    s('ssec', {
        t('\\subsection{'), i(1), t('}'),
        t({'', '\\label{sec:'}), i(2), t('}'),
    }),
    s('sssec', {
        t('\\subsubsection{'), i(1), t('}'),
    }),
    s('ref', {
        t('\\ref{'), i(1), t('}')
    }),
}

local autosnips = {
	}

return snips, autosnips
