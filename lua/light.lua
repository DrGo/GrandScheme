-- light.lua: Grok Day colorscheme for grandscheme
-- Swatches from GrokDay. Hues are spread so Go/C/Lua are not all cool:
--   keywords blue, functions magenta, variables indigo, types orange,
--   strings green, operators gold, numbers purple, packages teal.

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

	-- Operators (warm, like dark gold)
	operator       = '#A27612',
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
	Constant                   = { fg = colors.purple },
	String                     = { fg = colors.green },
	Character                  = { fg = colors.green },
	Number                     = { fg = colors.purple },
	Boolean                    = { fg = colors.blue },
	Float                      = { fg = colors.purple },
	Identifier                 = { fg = colors.blue0 },
	Function                   = { fg = colors.magenta },
	Statement                  = { fg = colors.blue },
	Conditional                = { fg = colors.blue },
	Repeat                     = { fg = colors.blue },
	Label                      = { fg = colors.blue0 },
	Keyword                    = { fg = colors.blue },
	Exception                  = { fg = colors.blue },
	Operator                   = { fg = colors.operator },
	PreProc                    = { fg = colors.purple },
	Include                    = { fg = colors.purple },
	Define                     = { fg = colors.purple },
	Macro                      = { fg = colors.purple },
	Type                       = { fg = colors.orange },
	StorageClass               = { fg = colors.purple },
	Structure                  = { fg = colors.orange },
	Typedef                    = { fg = colors.orange },
	Special                    = { fg = colors.yellow },
	SpecialChar                = { fg = colors.operator },
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
	['@constant']              = { fg = colors.purple },
	['@constant.builtin']      = { fg = colors.blue },
	['@constant.macro']        = { fg = colors.purple },
	['@boolean']               = { fg = colors.blue },
	['@number']                = { fg = colors.purple },
	['@float']                 = { fg = colors.purple },
	['@character']             = { fg = colors.green },

	-- Strings
	['@string']                = { fg = colors.green },
	['@string.escape']         = { fg = colors.operator },
	['@string.regex']          = { fg = colors.operator },
	['@string.regexp']         = { fg = colors.operator },

	-- Functions & Methods
	['@function']              = { fg = colors.magenta },
	['@function.builtin']      = { fg = colors.teal },
	['@function.call']         = { fg = colors.magenta },
	['@function.macro']        = { fg = colors.purple },
	['@function.method']       = { fg = colors.magenta },
	['@function.method.call']  = { fg = colors.magenta },
	['@constructor']           = { fg = colors.orange },

	-- Variables & Parameters
	['@variable']              = { fg = colors.blue0 },
	['@variable.builtin']      = { fg = colors.red },
	['@variable.parameter']    = { fg = colors.blue0 },
	['@variable.parameter.builtin'] = { fg = colors.blue0 },
	['@variable.member']       = { fg = colors.blue0 },

	-- Types & Keywords
	['@type']                  = { fg = colors.orange },
	['@type.builtin']          = { fg = colors.orange },
	['@type.definition']       = { fg = colors.orange },
	['@keyword']               = { fg = colors.blue },
	['@keyword.function']      = { fg = colors.blue },
	['@keyword.return']        = { fg = colors.blue },
	['@keyword.conditional']   = { fg = colors.blue },
	['@keyword.conditional.ternary'] = { fg = colors.blue },
	['@keyword.repeat']        = { fg = colors.blue },
	['@keyword.exception']     = { fg = colors.blue },
	['@keyword.import']        = { fg = colors.blue },
	['@keyword.coroutine']     = { fg = colors.blue },
	['@keyword.type']          = { fg = colors.blue },
	['@keyword.operator']      = { fg = colors.blue },
	['@keyword.modifier']      = { fg = colors.purple },
	['@keyword.directive']     = { fg = colors.purple },
	['@keyword.directive.define'] = { fg = colors.purple },
	['@conditional']           = { fg = colors.blue },
	['@repeat']                = { fg = colors.blue },
	['@exception']             = { fg = colors.blue },
	['@include']               = { fg = colors.blue },

	-- Structure & Organization
	['@namespace']             = { fg = colors.teal },
	['@module']                = { fg = colors.teal },
	['@module.builtin']        = { fg = colors.teal },
	['@field']                 = { fg = colors.blue0 },
	['@property']              = { fg = colors.blue0 },
	['@attribute']             = { fg = colors.purple },
	['@annotation']            = { fg = colors.purple },
	['@label']                 = { fg = colors.blue0 },

	-- Punctuation & Operators
	['@operator']              = { fg = colors.operator },
	['@punctuation.bracket']   = { fg = colors.fg_alt },
	['@punctuation.delimiter'] = { fg = colors.fg_alt },
	['@punctuation.special']   = { fg = colors.operator },

	-- Tags & Markup
	['@tag']                   = { fg = colors.red },
	['@tag.delimiter']         = { fg = colors.dark5 },
	['@symbol']                = { fg = colors.purple },

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
	['@module.builtin.lua']    = { fg = colors.teal }, -- _G, io, math, string
	['@function.builtin.lua']  = { fg = colors.teal }, -- print, ipairs, require
	['@constructor.lua']       = { fg = colors.fg_alt }, -- { }
	['@keyword.operator.lua']  = { fg = colors.blue }, -- and, or, not
	['@attribute.lua']         = { fg = colors.purple }, -- <const>, <close>

	-- Go: indigo fields, orange types, teal packages
	['@module.go']             = { fg = colors.teal },
	['@function.builtin.go']   = { fg = colors.teal }, -- make, append, len
	['@type.go']               = { fg = colors.orange },
	['@type.builtin.go']       = { fg = colors.orange }, -- int, string, error
	['@variable.member.go']    = { fg = colors.blue0 },
	['@property.go']           = { fg = colors.blue0 },
	['@keyword.type.go']       = { fg = colors.blue }, -- type, struct, interface
	['@keyword.coroutine.go']  = { fg = colors.blue }, -- go
	['@constant.builtin.go']   = { fg = colors.blue }, -- nil, iota

	-- C: preprocessor purple, storage purple, type keywords blue
	['@keyword.directive.c']   = { fg = colors.purple },
	['@keyword.directive.define.c'] = { fg = colors.purple },
	['@keyword.import.c']      = { fg = colors.purple }, -- #include
	['@keyword.modifier.c']    = { fg = colors.purple }, -- static, const, extern
	['@keyword.operator.c']    = { fg = colors.blue }, -- sizeof
	['@keyword.type.c']        = { fg = colors.blue }, -- struct, enum, union
	['@constant.macro.c']      = { fg = colors.purple },
	['@function.macro.c']      = { fg = colors.purple },
	['@type.definition.c']     = { fg = colors.orange },
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
