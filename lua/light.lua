-- light.lua: Minimal, eye‑friendly colorscheme module for use with grandscheme_
-- Returns a table of highlight groups compatible with the loader

-- Base Palette (v2 - Refined for better contrast and comfort)
local colors = {
	bg          = '#F5F5F5',
	fg          = '#383A42',
	comment     = '#8E8E96',
	-- NEW: A more muted, brownish-red for keywords
	keyword     = '#B35959',
	-- NEW: A less-saturated red for errors and deletions
	error_red   = '#D95C5C',
	-- NEW: A general-purpose orange with better contrast
	orange      = '#C17801',
	-- NEW: A darker, richer yellow for types with excellent contrast
	type_yellow = '#9A8100',
	green       = '#50A14F',
	cyan        = '#0969DA',
	blue        = '#4078F2',
	purple      = '#A626A4',
	gray        = '#D0D0D0',
}

-- Highlight table returned for loader
local scheme = {
	-- Core UI
	Normal                           = { fg = colors.fg, bg = colors.bg },
	CursorLine                       = { bg = '#E2E4E8' },
	CursorColumn                     = { bg = '#E2E4E8' },
	ColorColumn                      = { bg = '#E8E8E8' },
	LineNr                           = { fg = '#B0B0B0', bg = colors.bg },
	CursorLineNr                     = { fg = colors.orange, bg = colors.bg, bold = true },
	WinSeparator                     = { fg = colors.gray },
	StatusLine                       = { fg = colors.fg, bg = '#E0E0E0' },
	StatusLineNC                     = { fg = '#A0A0A0', bg = '#E0E0E0' },
	VertSplit                        = { fg = colors.gray },
	SignColumn                       = { fg = colors.fg, bg = colors.bg },
	Visual                           = { bg = '#D0E0FF' },
	Pmenu                            = { fg = colors.fg, bg = '#E2E4E8' },
	PmenuSel                         = { fg = colors.bg, bg = colors.blue },
	MatchParen                       = { fg = colors.error_red, bold = true },

	-- Syntax (legacy)
	Comment                          = { fg = colors.comment, italic = true },
	Constant                         = { fg = colors.purple },
	String                           = { fg = colors.green },
	Identifier                       = { fg = colors.blue },
	Function                         = { fg = colors.blue },
	Statement                        = { fg = colors.keyword },
	Keyword                          = { fg = colors.keyword, bold = true },
	Operator                         = { fg = colors.fg },
	Type                             = { fg = colors.type_yellow },
	Special                          = { fg = colors.cyan },

	-- Search
	Search                           = { fg = colors.fg, bg = '#D7BA7D', undercurl = true },
	IncSearch                        = { fg = colors.bg, bg = colors.orange },

	-- Diagnostics (LSP)
	DiagnosticError                  = { fg = colors.error_red },
	DiagnosticWarn                   = { fg = colors.orange },
	DiagnosticInfo                   = { fg = colors.blue },
	DiagnosticHint                   = { fg = colors.green },
	LspDiagnosticsDefaultError       = { fg = colors.error_red },
	LspDiagnosticsDefaultWarning     = { fg = colors.orange },
	LspDiagnosticsDefaultInformation = { fg = colors.blue },
	LspDiagnosticsDefaultHint        = { fg = colors.green },

	-- LSP References & CodeLens
	LspReferenceText                 = { bg = '#FFEED5' },
	LspReferenceRead                 = { bg = '#FFEED5' },
	LspReferenceWrite                = { bg = '#FFDCD7' },
	LspCodeLens                      = { fg = '#A0A0A0', italic = true },

	-- Spell Checking
	SpellBad                         = { sp = colors.error_red, undercurl = true },
	SpellCap                         = { sp = colors.orange, undercurl = true },
	SpellLocal                       = { sp = colors.type_yellow, undercurl = true },
	SpellRare                        = { sp = colors.purple, undercurl = true },

	-- Git
	GitSignsAdd                      = { fg = colors.green },
	GitSignsChange                   = { fg = colors.orange },
	GitSignsDelete                   = { fg = colors.error_red },

	-----------------------------------------------------------------------------
	-- Tree-sitter (Comprehensive)
	-----------------------------------------------------------------------------
	['@annotation']                  = { fg = colors.cyan },
	['@attribute']                   = { fg = colors.purple },
	['@boolean']                     = { fg = colors.purple },
	['@character']                   = { fg = colors.green },
	['@comment']                     = { fg = colors.comment, italic = true },
	['@conditional']                 = { fg = colors.keyword, bold = true },
	['@constant']                    = { fg = colors.orange },
	['@constant.builtin']            = { fg = colors.purple, bold = true },
	['@constant.macro']              = { fg = colors.purple },
	['@constructor']                 = { fg = colors.blue, bold = true },
	['@error']                       = { fg = colors.error_red, bold = true },
	['@exception']                   = { fg = colors.keyword, bold = true },
	['@field']                       = { fg = colors.blue }, -- For struct fields in Go/Swift
	['@float']                       = { fg = colors.orange },
	['@function']                    = { fg = colors.blue },
	['@function.builtin']            = { fg = colors.cyan, bold = true },
	['@function.call']               = { fg = colors.blue },
	['@function.macro']              = { fg = colors.cyan },
	['@include']                     = { fg = colors.keyword },
	['@keyword']                     = { fg = colors.keyword, bold = true },
	['@keyword.function']            = { fg = colors.keyword },
	['@label']                       = { fg = colors.purple },
	['@method']                      = { fg = colors.blue },
	['@method.call']                 = { fg = colors.blue },
	['@namespace']                   = { fg = colors.cyan }, -- For Go packages, Python/Swift modules
	['@number']                      = { fg = colors.orange },
	['@operator']                    = { fg = colors.fg },
	['@parameter']                   = { fg = colors.fg, italic = true },
	['@property']                    = { fg = colors.blue }, -- For properties in Swift/Python
	['@punctuation.bracket']         = { fg = colors.fg },
	['@punctuation.delimiter']       = { fg = colors.comment },
	['@punctuation.special']         = { fg = colors.orange },
	['@repeat']                      = { fg = colors.keyword, bold = true },
	['@string']                      = { fg = colors.green },
	['@string.escape']               = { fg = colors.purple, bold = true },
	['@string.regex']                = { fg = colors.orange },
	['@symbol']                      = { fg = colors.purple },
	['@tag']                         = { fg = colors.cyan },
	['@tag.delimiter']               = { fg = colors.comment },
	['@text']                        = { fg = colors.fg },
	['@type']                        = { fg = colors.type_yellow },
	['@type.builtin']                = { fg = colors.type_yellow, bold = true },
	['@variable']                    = { fg = colors.fg },
	['@variable.builtin']            = { fg = colors.purple, bold = true }, -- For `self`, `this`, etc.

	-- Language Specific Overrides
	-- Markdown
	['@text.title']                  = { fg = colors.blue, bold = true }, -- Headings
	['@text.strong']                 = { bold = true },            -- Bold text
	['@text.emphasis']               = { italic = true },          -- Italic text
	['@text.literal']                = { bg = '#E2E4E8' },         -- Inline code
	['@text.uri']                    = { fg = colors.cyan, underline = true }, -- Links

	-- Lua
	['@variable.builtin.lua']        = { fg = colors.purple, bold = true }, -- `_G`
}

return scheme
