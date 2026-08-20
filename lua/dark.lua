-- dark.lua: A dark colorscheme module, refactored for consistency.
-- Returns a table of highlight groups compatible with the loader.

-- Base Palette
local colors = {
	bg             = '#1E1E1E',
	fg             = '#DCDCDC',
	bg_alt         = '#2B2B2B',
	blue           = '#569CD6',
	string         = '#CE9178',
	comment        = '#6A9955',
	purple         = '#C586C0',
	identifier     = '#9CDCFE',
	constant       = '#B5CEA8',
	operator       = '#D7BA7D',
	type           = '#4EC9B0',
	fg_alt         = '#D4D4D4',
	error          = '#FF0000',
	warning        = '#FFA500',
	info           = '#1E90FF',
	hint           = '#00FF00',
	yellow         = '#FFD700',
	selection      = '#3E4451',
	spell_bad      = '#AC3000',
	nontext        = '#ABB2BF',
	bg_float       = '#252526',

	-- Added for Diff View
	diff_add_bg    = '#314D38',
	diff_change_bg = '#373F51',
	diff_delete_bg = '#543436',
}

-- Highlight table returned for loader
local scheme = {
	-- Core UI
	Normal            = { fg = colors.fg, bg = colors.bg },
	CursorLine        = { bg = colors.bg_alt },
	CursorColumn      = { bg = colors.bg_alt },
	ColorColumn       = { bg = colors.bg_alt },
	LineNr            = { fg = colors.fg, bg = colors.bg },
	CursorLineNr      = { fg = colors.blue, bg = colors.bg, bold = true },
	WinSeparator      = { fg = colors.nontext },
	StatusLine        = { fg = colors.bg, bg = colors.fg },
	StatusLineNC      = { fg = colors.nontext, bg = colors.bg_alt },
	VertSplit         = { fg = colors.nontext },
	SignColumn        = { fg = colors.fg, bg = colors.bg },
	Visual            = { bg = colors.selection },
	Pmenu             = { fg = colors.fg, bg = colors.bg_alt },
	PmenuSel          = { fg = colors.bg, bg = colors.blue },
	MatchParen        = { fg = colors.yellow, bg = '#44475A', bold = true },
	Folded            = { fg = colors.nontext, bg = '#2C323C' },
	NonText           = { fg = colors.nontext },
	Whitespace        = { fg = '#3B4048' },
	EndOfBuffer       = { fg = colors.bg },
	Substitute        = { fg = colors.bg, bg = colors.purple },
	TODO              = { fg = colors.yellow, bold = true, italic = true },
	NormalFloat       = { bg = colors.bg_float },
	FloatBorder       = { fg = colors.nontext },

	-- Syntax (legacy)
	Comment           = { fg = colors.comment },
	Constant          = { fg = colors.constant },
	String            = { fg = colors.string },
	Character         = { fg = colors.string },
	Number            = { fg = colors.constant },
	Boolean           = { fg = colors.blue },
	Float             = { fg = colors.constant },
	Identifier        = { fg = colors.identifier },
	Function          = { fg = colors.purple },
	Statement         = { fg = colors.blue },
	Conditional       = { fg = colors.blue },
	Repeat            = { fg = colors.blue },
	Label             = { fg = colors.identifier },
	Keyword           = { fg = colors.blue },
	Exception         = { fg = colors.blue },
	Operator          = { fg = colors.operator },
	PreProc           = { fg = colors.purple },
	Include           = { fg = colors.purple },
	Define            = { fg = colors.purple },
	Macro             = { fg = colors.purple },
	Type              = { fg = colors.type },
	StorageClass      = { fg = colors.blue },
	Structure         = { fg = colors.type },
	Typedef           = { fg = colors.type },
	Special           = { fg = colors.yellow },
	SpecialChar       = { fg = colors.operator },
	Delimiter         = { fg = colors.fg_alt },

	-- Search
	Search            = { fg = colors.bg, bg = colors.operator },
	IncSearch         = { fg = colors.bg, bg = colors.yellow },
	CurSearch         = { fg = colors.bg, bg = colors.yellow, bold = true },
	-- Diff View
	DiffAdd           = { bg = colors.diff_add_bg },
	DiffChange        = { bg = colors.diff_change_bg },
	DiffDelete        = { bg = colors.diff_delete_bg },

	-- Diagnostics (LSP)
	DiagnosticError   = { fg = colors.error },
	DiagnosticUnderlineError = { sp = colors.error, undercurl = true },
	DiagnosticWarn    = { fg = colors.warning },
	DiagnosticInfo    = { fg = colors.info },
	DiagnosticHint    = { fg = colors.hint },
	-- LSP References & CodeLens
	LspReferenceText  = { bg = colors.selection },
	LspReferenceRead  = { bg = colors.selection },
	LspReferenceWrite = { bg = colors.selection },
	LspCodeLens       = { fg = colors.comment, italic = true },

	-- Spell Checking
	SpellBad                   = { fg = colors.string, undercurl = true, sp = colors.spell_bad },
	SpellCap                   = { undercurl = true, sp = colors.warning },
	SpellLocal                 = { undercurl = true, sp = colors.info },
	SpellRare                  = { undercurl = true, sp = colors.purple },

	-- Git Signs
	GitSignsAdd                = { fg = colors.constant },
	GitSignsChange             = { fg = colors.operator },
	GitSignsDelete             = { fg = colors.error },

	-----------------------------------------------------------------------------
	-- Tree-sitter
	-----------------------------------------------------------------------------
	-- Comments & Documentation
	['@comment']               = { fg = colors.comment },
	['@comment.documentation'] = { fg = colors.comment },

	-- Constants & Literals
	['@constant']              = { fg = colors.constant },
	['@constant.builtin']      = { fg = colors.blue },
	['@constant.macro']        = { fg = colors.purple },
	['@boolean']               = { fg = colors.blue },
	['@number']                = { fg = colors.constant },
	['@float']                 = { fg = colors.constant },
	['@number.float']          = { fg = colors.constant },
	['@character']             = { fg = colors.string },

	-- Strings
	['@string']                = { fg = colors.string },
	['@string.escape']         = { fg = colors.operator },
	['@string.regex']          = { fg = colors.operator },
	['@string.regexp']         = { fg = colors.operator },

	-- Functions & Methods
	['@function']              = { fg = colors.purple },
	['@function.builtin']      = { fg = colors.type },
	['@function.call']         = { fg = colors.purple },
	['@function.macro']        = { fg = colors.purple },
	['@function.method']       = { fg = colors.purple },
	['@function.method.call']  = { fg = colors.purple },
	['@method']                = { fg = colors.purple },
	['@constructor']           = { fg = colors.type },

	-- Variables & Parameters
	['@variable']              = { fg = colors.identifier },
	['@variable.builtin']      = { fg = colors.blue },
	['@variable.parameter']    = { fg = colors.identifier },
	['@variable.parameter.builtin'] = { fg = colors.identifier },
	['@variable.member']       = { fg = colors.identifier },
	['@parameter']             = { fg = colors.identifier },
	['@parameter.reference']   = { fg = colors.identifier },

	-- Types & Keywords
	['@type']                  = { fg = colors.type },
	['@type.builtin']          = { fg = colors.type },
	['@type.definition']       = { fg = colors.type },
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
	['@keyword.modifier']      = { fg = colors.blue },
	['@keyword.directive']     = { fg = colors.purple },
	['@keyword.directive.define'] = { fg = colors.purple },
	['@conditional']           = { fg = colors.blue },
	['@repeat']                = { fg = colors.blue },
	['@exception']             = { fg = colors.blue },
	['@include']               = { fg = colors.blue },

	-- Structure & Organization
	['@namespace']             = { fg = colors.type },
	['@module']                = { fg = colors.type },
	['@module.builtin']        = { fg = colors.type },
	['@field']                 = { fg = colors.identifier },
	['@property']              = { fg = colors.identifier },
	['@attribute']             = { fg = colors.type },
	['@annotation']            = { fg = colors.blue },
	['@label']                 = { fg = colors.identifier },

	-- Punctuation & Operators
	['@operator']              = { fg = colors.operator },
	['@punctuation.bracket']   = { fg = colors.fg_alt },
	['@punctuation.delimiter'] = { fg = colors.fg_alt },
	['@punctuation.special']   = { fg = colors.operator },

	-- Tags & Markup
	['@tag']                   = { fg = colors.blue },
	['@tag.delimiter']         = { fg = colors.fg_alt },
	['@symbol']                = { fg = colors.constant },
	['@text']                  = { fg = colors.fg },
	['@text.title']            = { fg = colors.blue, bold = true },
	['@text.strong']           = { bold = true },
	['@text.emphasis']         = { italic = true },
	['@text.literal']          = { bg = colors.bg_alt },
	['@text.uri']              = { fg = colors.blue, underline = true },
	['@markup.heading']        = { fg = colors.blue, bold = true },
	['@markup.strong']         = { bold = true },
	['@markup.italic']         = { italic = true },
	['@markup.raw']            = { fg = colors.string },
	['@markup.link.url']       = { fg = colors.blue, underline = true },
	['@error']                 = { fg = colors.error },

	-----------------------------------------------------------------------------
	-- Language-Specific Overrides
	-----------------------------------------------------------------------------
	-- Lua: stdlib vs user code; table braces stay punctuation, not constructors
	['@variable.builtin.lua']  = { fg = colors.blue }, -- self
	['@module.builtin.lua']    = { fg = colors.type }, -- _G, io, math, string
	['@function.builtin.lua']  = { fg = colors.type }, -- print, ipairs, require
	['@constructor.lua']       = { fg = colors.fg_alt }, -- { }
	['@keyword.operator.lua']  = { fg = colors.blue }, -- and, or, not
	['@attribute.lua']         = { fg = colors.type }, -- <const>, <close>

	-- Go: packages, builtins, composite-type keywords
	['@module.go']             = { fg = colors.type },
	['@function.builtin.go']   = { fg = colors.type }, -- make, append, len
	['@type.builtin.go']       = { fg = colors.type }, -- int, string, error
	['@keyword.type.go']       = { fg = colors.blue }, -- type, struct, interface
	['@keyword.coroutine.go']  = { fg = colors.blue }, -- go
	['@constant.builtin.go']   = { fg = colors.blue }, -- nil, iota

	-- C: preprocessor and storage distinct from types
	['@keyword.directive.c']   = { fg = colors.purple },
	['@keyword.directive.define.c'] = { fg = colors.purple },
	['@keyword.import.c']      = { fg = colors.purple }, -- #include
	['@keyword.modifier.c']    = { fg = colors.blue }, -- static, const, extern
	['@keyword.operator.c']    = { fg = colors.blue }, -- sizeof
	['@keyword.type.c']        = { fg = colors.blue }, -- struct, enum, union
	['@constant.macro.c']      = { fg = colors.purple },
	['@function.macro.c']      = { fg = colors.purple },
	['@type.definition.c']     = { fg = colors.type },
	['@character.c']           = { fg = colors.string },

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
	User1                      = { bg = '#6AC935', fg = 'black' },
	User2                      = { bg = '#8F0000', fg = 'white' },
}

return scheme
