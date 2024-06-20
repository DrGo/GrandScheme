-- Copyright (c) 2023 Salah Mahmud
local M = {}
local sname = 'grandscheme_'

local function mod_load(filename)
	local ok, mod = pcall(require, filename)
	if not ok then
		error("could not load module" .. filename)
	end
	return mod
end

function M.setup(opts)
	opts = opts or {}
	if not opts.style then
		opts.style = os.getenv("VIMGSCOLOR") or vim.o.background
		-- print('gscheme: VIMGSCOLOR=', os.getenv("VIMGSCOLOR"), "vim.bg=", vim.o.background)
		if not opts.style or opts.style == "" then
			opts.style = 'dark'
		end
	end
	if not opts.scheme then opts.scheme = mod_load(opts.style) end
	if not opts.statusline then opts.statusline = false end
	M.setStyle(opts)
end

function M.setStyle(opts)
	local scheme = opts.scheme
	if scheme == nil or type(scheme) ~= "table" then
		error("must specifiy style table")
	end
	if vim.g.colors_name then vim.cmd("hi clear") end
	vim.g.colors_name = sname .. opts.style
	vim.o.termguicolors = true
	for group, styles in pairs(scheme) do
		vim.api.nvim_set_hl(0, group, styles)
	end
	if opts.statusline then
		require('stline').setup()
	end
end

vim.api.nvim_create_user_command("Gscheme", function(opts)
	local sty = {}
	if #opts.fargs == 0 then
		error("missing style name")
	elseif #opts.fargs > 2 then
		error("too many arguments")
	elseif #opts.fargs == 2 then
		sty.bg = opts.fargs[2]
	end
	sty.style = opts.fargs[1]
	sty.scheme = mod_load(sty.style)
	M.setStyle(sty)
end, {
	nargs = '*',
	complete = function(_, _, _)
		return { "dark", "light" }
	end,
})

vim.api.nvim_create_user_command("LspHLDisable", function()
	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
		vim.api.nvim_set_hl(0, group, {})
	end
end, {
	nargs = '*',
	complete = nil,
})



return M
