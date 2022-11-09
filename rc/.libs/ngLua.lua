local gp = require ('gnuplot')
local ul = require('uselib')

-- local value = mf:read('*a')
-- mf:close()
-- local e = true

-- local param1 = 'v1'
-- local nval = value:gsub(param1 .. '%s*=%s*%w*.%w*', 'asd')
-- print('nval = ', nval)
-- print('value = ', value)
--

date = "Today is 17/7/1990"
d = string.match(date, "%d+/%d+/%d+")
print(d)
