require("config.lazy")

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_keymap('n', '-', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '-', '$', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t','<Esc>','<C-\\><C-n>',{ noremap = true, silent = true })

vim.api.nvim_create_user_command('Vte', 'rightbelow vertical terminal', {})
vim.cmd([[
cnoreabbrev vte rightbelow vertical terminal
]])

vim.api.nvim_create_autocmd('TextYankPost',{
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank',{clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('TermOpen',{
	group = vim.api.nvim_create_augroup('curst-term-open',{clear = true}),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
