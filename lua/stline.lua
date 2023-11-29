local M = {}
local function get_lsp_diagnostics()
	-- get clients attached to this buffer
	if #vim.lsp.buf_get_clients() == 0 then
		return "No LSP"
	end
	local diagnostics = vim.diagnostic.get(0)
	local errors, warnings, info = 0, 0, 0
	for _, diag in pairs(diagnostics) do
		if diag.severity == vim.diagnostic.severity.ERROR then
			errors = errors + 1
		elseif diag.severity == vim.diagnostic.severity.WARN then
			warnings = warnings + 1
		elseif diag.severity == vim.diagnostic.severity.INFO then
			info = info + 1
		elseif diag.severity == vim.diagnostic.severity.HINT then
			info = info + 1
		end
	end
	return string.format("%s %d %s%d %s%d", "%#DiagnosticSignError#", errors,
		"%#DiagnosticSignWarn#", warnings, "%#DiagnosticSignInfo#", info)
end
local function statusline()
	local filename = '%<%1* %.35F %*'
	if vim.bo.modified then
		filename = '%<%2* %.35F %*'
	end
	return table.concat({
		-- " %.35F ",                              -- filename cut to 35 chars
		filename,
		"%R %S",                               -- modified, readonly, show
		"%=",                                  --align_right
		get_lsp_diagnostics(),
		" [%-3b,0x%-3B]",                      -- current Char
		" %Y",                                 --file type
		" %{&fileencoding?&fileencoding:&encoding}", --file encoding
		" %{&ff} ",                            --file format
		"%#PmenuSel#",
		" %3l/%L",                             -- line/total	
	}
	)
end


function M.setup()
	_G.SMstatusline = statusline
	vim.api.nvim_set_hl(0, 'User1', { bg = '#6AC935', fg = 'black' })
	vim.api.nvim_set_hl(0, 'User2', { bg = '#8F0000', fg = 'white' })
	local augroup = vim.api.nvim_create_augroup('microline', { clear = true })
	local autocmd = vim.api.nvim_create_autocmd
	autocmd({ "BufEnter", "BufWinEnter", "DiagnosticChanged" }, {
		group = augroup,
		callback = function(_) vim.o.statusline = '%!v:lua.SMstatusline()' end
	}
	)
	vim.o.statusline = '%!v:lua.SMstatusline()'
end

return M
