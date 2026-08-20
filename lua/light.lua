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
	Character                  = { fg = colors.green },
	Number                     = { fg = colors.orange },
	Boolean                    = { fg = colors.orange },
	Float                      = { fg = colors.orange },
	Identifier                 = { fg = colors.fg },
	Function                   = { fg = colors.blue },
	Statement                  = { fg = colors.magenta },
	Conditional                = { fg = colors.magenta },
	Repeat                     = { fg = colors.magenta },
	Label                      = { fg = colors.blue },
	Keyword                    = { fg = colors.magenta },
	Exception                  = { fg = colors.magenta },
	Operator                   = { fg = colors.operator },
	PreProc                    = { fg = colors.green1 },
	Include                    = { fg = colors.green1 },
	Define                     = { fg = colors.green1 },
	Macro                      = { fg = colors.cyan },
	Type                       = { fg = colors.blue1 },
	StorageClass               = { fg = colors.purple },
	Structure                  = { fg = colors.blue1 },
	Typedef                    = { fg = colors.blue1 },
	Special                    = { fg = colors.blue },
	SpecialChar                = { fg = colors.magenta },
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
	['@string.regexp']         = { fg = colors.green1 },

	-- Functions & Methods
	['@function']              = { fg = colors.blue },
	['@function.builtin']      = { fg = colors.blue1 },
	['@function.call']         = { fg = colors.blue },
	['@function.macro']        = { fg = colors.cyan },
	['@function.method']       = { fg = colors.blue },
	['@function.method.call']  = { fg = colors.blue },
	['@constructor']           = { fg = colors.magenta },

	-- Variables & Parameters
	['@variable']              = { fg = colors.fg },
	['@variable.builtin']      = { fg = colors.red },
	['@variable.parameter']    = { fg = colors.yellow },
	['@variable.parameter.builtin'] = { fg = colors.yellow },
	['@variable.member']       = { fg = colors.green1 },

	-- Types & Keywords
	['@type']                  = { fg = colors.blue1 },
	['@type.builtin']          = { fg = colors.blue1 },
	['@type.definition']       = { fg = colors.blue1 },
	['@keyword']               = { fg = colors.magenta },
	['@keyword.function']      = { fg = colors.magenta },
	['@keyword.return']        = { fg = colors.magenta },
	['@keyword.conditional']   = { fg = colors.magenta },
	['@keyword.conditional.ternary'] = { fg = colors.magenta },
	['@keyword.repeat']        = { fg = colors.magenta },
	['@keyword.exception']     = { fg = colors.magenta },
	['@keyword.import']        = { fg = colors.magenta },
	['@keyword.coroutine']     = { fg = colors.magenta },
	['@keyword.type']          = { fg = colors.magenta },
	['@keyword.operator']      = { fg = colors.magenta },
	['@keyword.modifier']      = { fg = colors.purple },
	['@keyword.directive']     = { fg = colors.green1 },
	['@keyword.directive.define'] = { fg = colors.green1 },
	['@conditional']           = { fg = colors.magenta },
	['@repeat']                = { fg = colors.magenta },
	['@exception']             = { fg = colors.magenta },
	['@include']               = { fg = colors.magenta },

	-- Structure & Organization
	['@namespace']             = { fg = colors.cyan },
	['@module']                = { fg = colors.cyan },
	['@module.builtin']        = { fg = colors.cyan },
	['@field']                 = { fg = colors.green1 },
	['@property']              = { fg = colors.green1 },
	['@attribute']             = { fg = colors.cyan },
	['@annotation']            = { fg = colors.cyan },
	['@label']                 = { fg = colors.blue },

	-- Punctuation & Operators
	['@operator']              = { fg = colors.operator },
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
	-- Lua: stdlib vs user code; table braces stay punctuation, not constructors
	['@variable.builtin.lua']  = { fg = colors.red }, -- self
	['@module.builtin.lua']    = { fg = colors.cyan }, -- _G, io, math, string
	['@function.builtin.lua']  = { fg = colors.blue1 }, -- print, ipairs, require
	['@constructor.lua']       = { fg = colors.fg_alt }, -- { }
	['@keyword.operator.lua']  = { fg = colors.magenta }, -- and, or, not
	['@attribute.lua']         = { fg = colors.cyan }, -- <const>, <close>

	-- Go: packages, builtins, composite-type keywords
	['@module.go']             = { fg = colors.cyan },
	['@function.builtin.go']   = { fg = colors.blue1 }, -- make, append, len
	['@type.builtin.go']       = { fg = colors.blue1 }, -- int, string, error
	['@keyword.type.go']       = { fg = colors.magenta }, -- type, struct, interface
	['@keyword.coroutine.go']  = { fg = colors.magenta }, -- go
	['@constant.builtin.go']   = { fg = colors.orange }, -- nil, iota

	-- C: preprocessor and storage distinct from keywords
	['@keyword.directive.c']   = { fg = colors.green1 },
	['@keyword.directive.define.c'] = { fg = colors.green1 },
	['@keyword.import.c']      = { fg = colors.green1 }, -- #include
	['@keyword.modifier.c']    = { fg = colors.purple }, -- static, const, extern
	['@keyword.operator.c']    = { fg = colors.magenta }, -- sizeof
	['@keyword.type.c']        = { fg = colors.magenta }, -- struct, enum, union
	['@constant.macro.c']      = { fg = colors.orange },
	['@function.macro.c']      = { fg = colors.cyan },
	['@type.definition.c']     = { fg = colors.blue1 },
	['@character.c']           = { fg = colors.green },

	-- LSP semantic tokens (gopls / clangd / lua_ls)
	['@lsp.type.namespace']    = { link = '@module' },
	['@lsp.type.type']         = { link = '@type' },
	['@lsp.type.class']        = { link = '@type' },
	['@lsp.type.enum']         = { link = '@type' },
	['@lsp.type.interface']    = { link = '@type' },
	['@lsp.type.struct']       = { link = '@type' },
	['@lsp.type.parameter']    = { link = '@variable.parameter' },
	['@lsp.type.variable']     = { link = '@variable' },
	['@lsp.type.property']     = { link = '@property' },
	['@lsp.type.enumMember']   = { link = '@constant' },
	['@lsp.type.function']     = { link = '@function' },
	['@lsp.type.method']       = { link = '@function.method' },
	['@lsp.type.macro']        = { link = '@function.macro' },
	['@lsp.type.decorator']    = { link = '@attribute' },
	['@lsp.type.keyword']      = { link = '@keyword' },
	['@lsp.typemod.variable.readonly'] = { link = '@constant' },
	['@lsp.typemod.variable.defaultLibrary'] = { link = '@module.builtin' },
	['@lsp.typemod.function.defaultLibrary'] = { link = '@function.builtin' },

	-- Statusline specials
	User1                      = { bg = colors.green, fg = colors.bg },
	User2                      = { bg = colors.red, fg = '#FFFFFF' },
}

return scheme
