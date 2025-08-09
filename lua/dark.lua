-- dark.lua: A dark colorscheme module, refactored for consistency.
-- Returns a table of highlight groups compatible with the loader.

-- Base Palette
local colors = {
  bg         = '#1E1E1E',
  fg         = '#DCDCDC',
  bg_alt     = '#2B2B2B',
  blue       = '#569CD6',
  string     = '#CE9178',
  comment    = '#6A9955',
  purple     = '#C586C0',
  identifier = '#9CDCFE',
  constant   = '#B5CEA8',
  operator   = '#D7BA7D',
  type       = '#4EC9B0',
  fg_alt     = '#D4D4D4',
  error      = '#FF0000',
  warning    = '#FFA500',
  info       = '#1E90FF',
  hint       = '#00FF00',
  yellow     = '#FFD700',
  selection  = '#3E4451',
  spell_bad  = '#AC3000',
  nontext    = '#ABB2BF',
  bg_float   = '#252526',
}

-- Highlight table returned for loader
local scheme = {
  -- Core UI
  Normal       = { fg = colors.fg, bg = colors.bg },
  CursorLine   = { bg = colors.bg_alt },
  CursorColumn = { bg = colors.bg_alt },
  ColorColumn  = { bg = colors.bg_alt },
  LineNr       = { fg = colors.fg, bg = colors.bg },
  CursorLineNr = { fg = colors.blue, bg = colors.bg, bold = true },
  WinSeparator = { fg = colors.nontext },
  StatusLine   = { fg = colors.bg, bg = colors.fg },
  StatusLineNC = { fg = colors.nontext, bg = colors.bg_alt },
  VertSplit    = { fg = colors.nontext },
  SignColumn   = { fg = colors.fg, bg = colors.bg },
  Visual       = { bg = colors.selection },
  Pmenu        = { fg = colors.fg, bg = colors.bg_alt },
  PmenuSel     = { fg = colors.bg, bg = colors.blue },
  MatchParen   = { fg = colors.yellow, bg = '#44475A', bold = true },
  Folded       = { fg = colors.nontext, bg = '#2C323C' },
  NonText      = { fg = colors.nontext },
  Whitespace   = { fg = '#3B4048' },
  EndOfBuffer  = { fg = colors.bg },
  Substitute   = { fg = colors.bg, bg = colors.purple },
  TODO         = { fg = colors.yellow, bold = true, italic = true },
  NormalFloat  = { bg = colors.bg_float },
  FloatBorder  = { fg = colors.nontext },

  -- Syntax (legacy)
  Comment    = { fg = colors.comment },
  Constant   = { fg = colors.constant },
  String     = { fg = colors.string },
  Identifier = { fg = colors.identifier },
  Function   = { fg = colors.purple },
  Statement  = { fg = colors.blue },
  Keyword    = { fg = colors.blue },
  Operator   = { fg = colors.operator },
  Type       = { fg = colors.type },
  Special    = { fg = colors.yellow },
  Delimiter  = { fg = colors.operator },

  -- Search
  Search    = { fg = colors.bg, bg = colors.operator },
  IncSearch = { fg = colors.bg, bg = colors.yellow },

  -- Diagnostics (LSP)
  DiagnosticError = { fg = colors.error },
  DiagnosticWarn  = { fg = colors.warning },
  DiagnosticInfo  = { fg = colors.info },
  DiagnosticHint  = { fg = colors.hint },
  LspDiagnosticsDefaultError     = { fg = colors.error },
  LspDiagnosticsDefaultWarning   = { fg = colors.warning },
  LspDiagnosticsDefaultInformation = { fg = colors.info },
  LspDiagnosticsDefaultHint      = { fg = colors.hint },

  -- Spell Checking
  SpellBad   = { fg = colors.string, undercurl = true, sp = colors.spell_bad },

  -- Statusline specials
  User1 = { bg = '#6AC935', fg = 'black' },
  User2 = { bg = '#8F0000', fg = 'white' },

  -----------------------------------------------------------------------------
  -- Tree-sitter (Comprehensive)
  -----------------------------------------------------------------------------
  ['@annotation']        = { fg = colors.blue },
  ['@attribute']         = { fg = colors.string },
  ['@boolean']           = { fg = colors.blue },
  ['@character']         = { fg = colors.string },
  ['@comment']           = { fg = colors.comment },
  ['@conditional']       = { fg = colors.purple },
  ['@constant']          = { fg = colors.identifier },
  ['@constant.builtin']  = { fg = colors.identifier },
  ['@constant.macro']    = { fg = colors.identifier },
  ['@constructor']       = { fg = colors.constant },
  ['@error']             = { fg = colors.error },
  ['@exception']         = { fg = colors.purple },
  ['@field']             = { fg = colors.fg },
  ['@float']             = { fg = colors.fg_alt },
  ['@function']          = { fg = colors.purple },
  ['@function.builtin']  = { fg = colors.purple },
  ['@function.macro']    = { fg = colors.purple },
  ['@include']           = { fg = colors.identifier },
  ['@keyword']           = { fg = colors.blue },
  ['@keyword.function']  = { fg = colors.yellow },
  ['@label']             = { fg = colors.identifier },
  ['@method']            = { fg = colors.purple },
  ['@namespace']         = { fg = colors.identifier },
  ['@number']            = { fg = colors.constant },
  ['@operator']          = { fg = colors.operator },
  ['@parameter']         = { fg = colors.identifier },
  ['@parameter.reference'] = { fg = colors.identifier },
  ['@property']          = { fg = colors.identifier }, -- Corrected from #fCDCFE
  ['@punctuation.bracket'] = { fg = colors.operator },
  ['@punctuation.delimiter'] = { fg = colors.operator },
  ['@punctuation.special'] = { fg = colors.operator },
  ['@repeat']            = { fg = colors.blue },
  ['@string']            = { fg = colors.string },
  ['@string.escape']     = { fg = colors.string },
  ['@string.regex']      = { fg = colors.string },
  ['@symbol']            = { fg = colors.constant },
  ['@tag']               = { fg = colors.blue },
  ['@tag.delimiter']     = { fg = colors.operator },
  ['@text']              = { fg = colors.fg },
  ['@type']              = { fg = colors.type },
  ['@type.builtin']      = { fg = colors.type },
  ['@variable']          = { fg = colors.identifier },
  ['@variable.builtin']  = { fg = colors.identifier },
}

return scheme

