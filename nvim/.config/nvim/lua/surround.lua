local status_ok, surround = pcall(require, 'nvim-surround')
if not status_ok then
	print('Something went wrong')
	return
end

surround.setup{
-- inset config here
}
