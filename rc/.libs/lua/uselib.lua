-- General pourpose library
-- Created by: Salatiel García

local M = {}

-- Print a table in readable format
function M.pT(tab)
	if type(tab) == "table" then
		io.write('{')
		for _, v in pairs(tab) do
		    io.write(' ', v)
		end
		io.write('}\n')
	end
end

return M
