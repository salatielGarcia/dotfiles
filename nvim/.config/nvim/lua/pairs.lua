local status_ok, pairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end
local Rule = require('nvim-autopairs.rule')
pairs.setup()

pairs.add_rule(Rule(':', ':', 'norg'))
pairs.add_rule(Rule("$$","$$","tex"))
pairs.add_rule(Rule("<",">","vim"))
pairs.add_rule(Rule("<",">","lua"))
