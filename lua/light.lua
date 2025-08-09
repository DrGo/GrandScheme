-- light.lua: Minimal, eye-friendly colorscheme module for use with grandscheme
-- Returns a table of highlight groups compatible with the loader

-- Base Palette (v2 - Refined for better contrast and comfort)
local colors = {
	-- Core colors
	bg                  = '#F5F5F5',
	fg                  = '#383A42',
	comment             = '#8E8E96',
	keyword             = '#B35959',
	error_red           = '#D95C5C',
	orange              = '#C17801',
	type_yellow         = '#9A8100',
	green               = '#50A14F',
	cyan                = '#0969DA',
	blue                = '#4078F2',
	purple              = '#A626A4',
	gray                = '#D0D0D0',

	-- Enhanced colors for better readability
	comment_alt         = '#7E7E86', -- Darker comments for better small-text contrast
	punctuation         = '#A0A0A0', -- Neutral gray for punctuation/delimiters
	diag_error_alt      = '#C94C4C', -- Softer error undercurl on light bg

	-- Tree-sitter specific overrides
	ts_constant         = '#9A8100', -- @constant
	ts_constant_builtin = '#B35959', -- @constant.builtin

	-- VCS diff background colors
	diff_add_bg         = '#D6EED1', -- DiffAdd
	diff_change_bg      = '#FFF7C2', -- DiffChange
	diff_delete_bg      = '#F8D6D9', -- DiffDelete

	-- UI background variants
	bg_pmenu            = '#F8F8F8', -- Pmenu
	bg_cursor           = '#E2E4E8', -- CursorLine/CursorColumn
	bg_float            = '#F0F0F0', -- CHANGE THIS from #FBFBFB
	border_float        = '#CCCCCC', -- FloatBorder
	-- Plugin specific
	fzf_lua_help_fg     = '#6C9A00', -- fzf-lua help line override

}

-- Highlight table returned for loader
local scheme = {
	-----------------------------------------------------------------------------
	-- Core UI
	-----------------------------------------------------------------------------
	Normal                     = { fg = colors.fg, bg = colors.bg },
	CursorLine                 = { bg = colors.bg_cursor },
	CursorColumn               = { bg = colors.bg_cursor },
	ColorColumn                = { bg = '#E8E8E8' },
	LineNr                     = { fg = '#B0B0B0', bg = colors.bg },
	CursorLineNr               = { fg = colors.orange, bg = colors.bg, bold = true },
	WinSeparator               = { fg = colors.gray },
	StatusLine                 = { fg = colors.fg, bg = '#E0E0E0' },
	StatusLineNC               = { fg = '#A0A0A0', bg = '#E0E0E0' },
	VertSplit                  = { fg = colors.gray },
	SignColumn                 = { fg = colors.fg, bg = colors.bg },
	Visual                     = { bg = '#D0E0FF' },
	MatchParen                 = { fg = colors.error_red, bold = true },

	-- Popup menus
	Pmenu                      = { fg = colors.fg, bg = colors.bg_pmenu },
	PmenuSel                   = { fg = colors.bg, bg = colors.blue },
	NormalFloat                = { fg = colors.fg, bg = colors.bg_float },
	FloatBorder                = { fg = colors.border_float },

	-- Search
	Search                     = { fg = colors.fg, bg = '#D7BA7D' },
	IncSearch                  = { fg = colors.bg, bg = colors.orange },

	-- Diff
	DiffAdd                    = { bg = colors.diff_add_bg },
	DiffChange                 = { bg = colors.diff_change_bg },
	DiffDelete                 = { bg = colors.diff_delete_bg },

	-----------------------------------------------------------------------------
	-- Legacy Syntax Highlighting
	-----------------------------------------------------------------------------
	Comment                    = { fg = colors.comment_alt, italic = true },
	Constant                   = { fg = colors.purple },
	String                     = { fg = colors.green },
	Identifier                 = { fg = colors.blue },
	Function                   = { fg = colors.blue },
	Statement                  = { fg = colors.keyword },
	Keyword                    = { fg = colors.keyword, bold = true },
	Operator                   = { fg = colors.fg },
	Type                       = { fg = colors.type_yellow },
	Special                    = { fg = colors.cyan },

	-----------------------------------------------------------------------------
	-- Diagnostics (LSP)
	-----------------------------------------------------------------------------
	DiagnosticError            = { fg = colors.error_red },
	DiagnosticWarn             = { fg = colors.orange },
	DiagnosticInfo             = { fg = colors.blue },
	DiagnosticHint             = { fg = colors.green },

	-- LSP References & CodeLens
	LspReferenceText           = { bg = '#FFEED5' },
	LspReferenceRead           = { bg = '#FFEED5' },
	LspReferenceWrite          = { bg = '#FFDCD7' },
	LspCodeLens                = { fg = '#A0A0A0', italic = true },

	-----------------------------------------------------------------------------
	-- Spell Checking
	-----------------------------------------------------------------------------
	SpellBad                   = { sp = colors.error_red, undercurl = true },
	SpellCap                   = { sp = colors.orange, undercurl = true },
	SpellLocal                 = { sp = colors.type_yellow, undercurl = true },
	SpellRare                  = { sp = colors.purple, undercurl = true },

	-----------------------------------------------------------------------------
	-- Git Signs
	-----------------------------------------------------------------------------
	GitSignsAdd                = { fg = colors.green },
	GitSignsChange             = { fg = colors.orange },
	GitSignsDelete             = { fg = colors.error_red },

	-----------------------------------------------------------------------------
	-- Tree-sitter Highlights
	-----------------------------------------------------------------------------
	-- Comments & Documentation
	['@comment']               = { fg = colors.comment_alt, italic = true },
	['@comment.documentation'] = { fg = colors.comment, italic = true },

	-- Constants & Literals
	['@constant']              = { fg = colors.ts_constant },
	['@constant.builtin']      = { fg = colors.ts_constant_builtin, bold = true },
	['@constant.macro']        = { fg = colors.purple },
	['@boolean']               = { fg = colors.purple },
	['@number']                = { fg = colors.orange },
	['@float']                 = { fg = colors.orange },
	['@character']             = { fg = colors.green },

	-- Strings
	['@string']                = { fg = colors.green },
	['@string.escape']         = { fg = colors.purple, bold = true },
	['@string.regex']          = { fg = colors.orange },

	-- Functions & Methods
	['@function']              = { fg = colors.blue },
	['@function.builtin']      = { fg = colors.cyan, bold = true },
	['@function.call']         = { fg = colors.blue },
	['@function.macro']        = { fg = colors.cyan },
	['@method']                = { fg = colors.blue },
	['@method.call']           = { fg = colors.blue },
	['@constructor']           = { fg = colors.blue, bold = true },

	-- Variables & Parameters
	['@variable']              = { fg = colors.fg },
	['@variable.builtin']      = { fg = colors.purple, bold = true },
	['@parameter']             = { fg = colors.fg, italic = true },

	-- Types & Keywords
	['@type']                  = { fg = colors.type_yellow },
	['@type.builtin']          = { fg = colors.type_yellow, bold = true },
	['@keyword']               = { fg = colors.keyword, bold = true },
	['@keyword.function']      = { fg = colors.keyword },
	['@conditional']           = { fg = colors.keyword, bold = true },
	['@repeat']                = { fg = colors.keyword, bold = true },
	['@exception']             = { fg = colors.keyword, bold = true },
	['@include']               = { fg = colors.keyword },

	-- Structure & Organization
	['@namespace']             = { fg = colors.cyan },
	['@field']                 = { fg = colors.blue },
	['@property']              = { fg = colors.blue },
	['@attribute']             = { fg = colors.purple },
	['@annotation']            = { fg = colors.cyan },
	['@label']                 = { fg = colors.purple },

	-- Punctuation & Operators
	['@operator']              = { fg = colors.fg },
	['@punctuation.bracket']   = { fg = colors.fg },
	['@punctuation.delimiter'] = { fg = colors.punctuation },
	['@punctuation.special']   = { fg = colors.orange },

	-- Tags & Markup
	['@tag']                   = { fg = colors.cyan },
	['@tag.delimiter']         = { fg = colors.comment },
	['@symbol']                = { fg = colors.purple },

	-- Text & Markup (Markdown, etc.)
	['@text']                  = { fg = colors.fg },
	['@text.title']            = { fg = colors.blue, bold = true },
	['@text.strong']           = { bold = true },
	['@text.emphasis']         = { italic = true },
	['@text.literal']          = { bg = colors.bg_cursor },
	['@text.uri']              = { fg = colors.cyan, underline = true },

	-- Error Handling
	['@error']                 = { fg = colors.error_red, bold = true },

	-----------------------------------------------------------------------------
	-- Language-Specific Overrides
	-----------------------------------------------------------------------------
	-- Lua
	['@variable.builtin.lua']  = { fg = colors.purple, bold = true }, -- _G, etc.

	-- Plugin-Specific Highlights
	FzfLuaHelp                 = { fg = colors.fzf_lua_help_fg },

	  -- Statusline specials
  User1 = { bg = '#6AC935', fg = 'black' },
  User2 = { bg = '#8F0000', fg = 'white' },

}

return scheme
