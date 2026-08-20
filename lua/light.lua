-- light.lua: Grok Day colorscheme for grandscheme
-- Palette and token mapping from GrokDay + grok-day.tmTheme
-- (xai-org/grok-build). Returns highlight groups for the loader.

-- Grok Day palette
local colors = {
	-- Surfaces
	bg             = '#EEEEEE',
	fg             = '#262626',
	fg_alt         = '#444444',
	comment        = '#767676',
	comment_doc    = '#808080',
	gutter         = '#B2B2B2',
	gray           = '#D0D0D0',
	dark3          = '#8E8E8E',
	dark5          = '#626262',

	-- Accents (deepened TokyoNight family)
	blue           = '#2F64D2',
	blue0          = '#28448A',
	blue1          = '#0F87A2',
	cyan           = '#0082AA',
	green          = '#378E23',
	green1         = '#0C947C',
	magenta        = '#7D4BC6',
	purple         = '#6C3EB2',
	orange         = '#C3691E',
	yellow         = '#A27612',
	teal           = '#0A8E70',
	red            = '#CD3048',
	red1           = '#AF2323',

	-- Operators / punctuation (tmTheme)
	operator       = '#5580A8',
	punctuation    = '#4A72B0',

	-- UI surfaces
	bg_cursor      = '#DEDEDE',
	bg_visual      = '#C6C6C6',
	bg_pmenu       = '#F0F0F0',
	bg_float       = '#F0F0F0',
	border_float   = '#DEDEDE',
	bg_search      = '#A27612',

	-- Diff
	diff_add_bg    = '#DAF2DC',
	diff_change_bg = '#F5EED8',
	diff_delete_bg = '#F5DADE',
}

-- Highlight table returned for loader
local scheme = {
	-----------------------------------------------------------------------------
	-- Core UI
	-----------------------------------------------------------------------------
	Normal                     = { fg = colors.fg, bg = colors.bg },
	CursorLine                 = { bg = colors.bg_cursor },
	CursorColumn               = { bg = colors.bg_cursor },
	ColorColumn                = { bg = colors.bg_cursor },
	LineNr                     = { fg = colors.gutter, bg = colors.bg },
	CursorLineNr               = { fg = colors.yellow, bg = colors.bg, bold = true },
	WinSeparator               = { fg = colors.gray },
	StatusLine                 = { fg = colors.fg_alt, bg = colors.bg_cursor },
	StatusLineNC               = { fg = colors.comment, bg = colors.bg_cursor },
	VertSplit                  = { fg = colors.gray },
	SignColumn                 = { fg = colors.gutter, bg = colors.bg },
	Visual                     = { bg = colors.bg_visual },
	MatchParen                 = { fg = colors.orange, bold = true },
	Folded                     = { fg = colors.comment, bg = colors.bg_cursor },
	NonText                    = { fg = colors.gutter },
	Whitespace                 = { fg = colors.gutter },
	EndOfBuffer                = { fg = colors.bg },
	Substitute                 = { fg = colors.bg, bg = colors.red },
	TODO                       = { fg = colors.bg, bg = colors.yellow, bold = true },

	-- Popup menus
	Pmenu                      = { fg = colors.fg, bg = colors.bg_pmenu },
	PmenuSel                   = { fg = colors.fg, bg = colors.bg_cursor },
	NormalFloat                = { fg = colors.fg, bg = colors.bg_float },
	FloatBorder                = { fg = colors.border_float },

	-- Search
	Search                     = { fg = colors.bg, bg = colors.yellow },
	IncSearch                  = { fg = colors.bg, bg = colors.orange },
	CurSearch                  = { fg = colors.bg, bg = colors.orange, bold = true },

	-- Diff
	DiffAdd                    = { bg = colors.diff_add_bg },
	DiffChange                 = { bg = colors.diff_change_bg },
	DiffDelete                 = { bg = colors.diff_delete_bg },

	-----------------------------------------------------------------------------
	-- Legacy Syntax Highlighting
	-----------------------------------------------------------------------------
	Comment                    = { fg = colors.comment, italic = true },
	Constant                   = { fg = colors.orange },
	String                     = { fg = colors.green },
	Identifier                 = { fg = colors.magenta },
	Function                   = { fg = colors.blue },
	Statement                  = { fg = colors.magenta },
	Keyword                    = { fg = colors.magenta },
	Operator                   = { fg = colors.cyan },
	Type                       = { fg = colors.blue1 },
	Special                    = { fg = colors.blue },
	Delimiter                  = { fg = colors.fg_alt },

	-- Diagnostics (LSP)
	DiagnosticError            = { fg = colors.red },
	DiagnosticUnderlineError   = { sp = colors.red, undercurl = true },
	DiagnosticWarn             = { fg = colors.yellow },
	DiagnosticInfo             = { fg = colors.blue },
	DiagnosticHint             = { fg = colors.teal },

	-- LSP References & CodeLens
	LspReferenceText           = { bg = colors.bg_cursor },
	LspReferenceRead           = { bg = colors.bg_cursor },
	LspReferenceWrite          = { bg = colors.bg_cursor },
	LspCodeLens                = { fg = colors.comment, italic = true },

	-----------------------------------------------------------------------------
	-- Spell Checking
	-----------------------------------------------------------------------------
	SpellBad                   = { sp = colors.red, undercurl = true },
	SpellCap                   = { sp = colors.yellow, undercurl = true },
	SpellLocal                 = { sp = colors.blue, undercurl = true },
	SpellRare                  = { sp = colors.purple, undercurl = true },

	-----------------------------------------------------------------------------
	-- Git Signs
	-----------------------------------------------------------------------------
	GitSignsAdd                = { fg = colors.green },
	GitSignsChange             = { fg = colors.yellow },
	GitSignsDelete             = { fg = colors.red },

	-----------------------------------------------------------------------------
	-- Tree-sitter Highlights
	-----------------------------------------------------------------------------
	-- Comments & Documentation
	['@comment']               = { fg = colors.comment, italic = true },
	['@comment.documentation'] = { fg = colors.comment_doc, italic = true },

	-- Constants & Literals
	['@constant']              = { fg = colors.orange },
	['@constant.builtin']      = { fg = colors.orange },
	['@constant.macro']        = { fg = colors.cyan },
	['@boolean']               = { fg = colors.orange },
	['@number']                = { fg = colors.orange },
	['@float']                 = { fg = colors.orange },
	['@character']             = { fg = colors.green },

	-- Strings
	['@string']                = { fg = colors.green },
	['@string.escape']         = { fg = colors.magenta },
	['@string.regex']          = { fg = colors.green1 },

	-- Functions & Methods
	['@function']              = { fg = colors.blue },
	['@function.builtin']      = { fg = colors.blue },
	['@function.call']         = { fg = colors.blue },
	['@function.macro']        = { fg = colors.cyan },
	['@function.method']       = { fg = colors.blue },
	['@function.method.call']  = { fg = colors.blue },
	['@constructor']           = { fg = colors.magenta },

	-- Variables & Parameters
	['@variable']              = { fg = colors.fg },
	['@variable.builtin']      = { fg = colors.red },
	['@variable.parameter']    = { fg = colors.yellow, italic = true },

	-- Types & Keywords
	['@type']                  = { fg = colors.blue1 },
	['@type.builtin']          = { fg = colors.blue1 },
	['@keyword']               = { fg = colors.magenta },
	['@keyword.function']      = { fg = colors.magenta },
	['@conditional']           = { fg = colors.magenta },
	['@repeat']                = { fg = colors.magenta },
	['@exception']             = { fg = colors.magenta },
	['@include']               = { fg = colors.magenta },

	-- Structure & Organization
	['@namespace']             = { fg = colors.cyan },
	['@field']                 = { fg = colors.green1 },
	['@property']              = { fg = colors.green1 },
	['@attribute']             = { fg = colors.cyan },
	['@annotation']            = { fg = colors.cyan },
	['@label']                 = { fg = colors.blue },

	-- Punctuation & Operators
	['@operator']              = { fg = colors.cyan },
	['@punctuation.bracket']   = { fg = colors.fg_alt },
	['@punctuation.delimiter'] = { fg = colors.fg_alt },
	['@punctuation.special']   = { fg = colors.cyan },

	-- Tags & Markup
	['@tag']                   = { fg = colors.red },
	['@tag.delimiter']         = { fg = colors.dark5 },
	['@symbol']                = { fg = colors.orange },

	-- Text & Markup (Markdown, etc.)
	['@text']                  = { fg = colors.fg },
	['@text.title']            = { fg = colors.blue, bold = true },
	['@text.strong']           = { bold = true },
	['@text.emphasis']         = { italic = true },
	['@text.literal']          = { fg = colors.green },
	['@text.uri']              = { fg = colors.blue, underline = true },
	['@markup.heading']        = { fg = colors.blue, bold = true },
	['@markup.strong']         = { bold = true },
	['@markup.italic']         = { italic = true },
	['@markup.raw']            = { fg = colors.green },
	['@markup.link.url']       = { fg = colors.blue, underline = true },

	-- Error Handling
	['@error']                 = { fg = colors.red, bold = true },

	-----------------------------------------------------------------------------
	-- Language-Specific Overrides
	-----------------------------------------------------------------------------
	-- Lua
	['@variable.builtin.lua']  = { fg = colors.red }, -- _G, etc.

	-- Statusline specials
	User1                      = { bg = colors.green, fg = colors.bg },
	User2                      = { bg = colors.red, fg = '#FFFFFF' },
}

return scheme
