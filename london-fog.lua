-- london-fog.lua
-- Dark variant of the Earl Greylyn colorscheme (based on Earl Grey)
-- https://earl-grey.halt.wtf
--
-- Installation: place this file at
--   ~/.config/nvim/colors/london-fog.lua
-- then add to your config:
--   vim.cmd("colorscheme london-fog")
--
-- The same hue identities as earl-greylyn are preserved — purple is still
-- purple, green is still green — but backgrounds are warm dark browns and the
-- accent colors are lightened just enough to hold contrast on a dark canvas.

vim.cmd("highlight clear")
if vim.g.syntax_on then vim.cmd("syntax reset") end
vim.g.colors_name = "london-fog"
vim.o.background = "dark"
vim.o.termguicolors = true

-- ── Palette ──────────────────────────────────────────────────────────────────
-- Core backgrounds: warm dark browns that echo the light variant's cream tones.
-- Core foregrounds: a lightened, desaturated version of the original #605A52.
-- Accent hues: shifted ~15–20% lighter from their light-mode values so they
-- remain readable without becoming neon or losing their Earl Grey character.

local c = {
  -- Core
  fg          = "#CEC8C0",   -- warm light grey (light-mode fg inverted in warmth)
  fg_alt      = "#DAD4CC",   -- slightly brighter for emphasis
  bg          = "#1C1A18",   -- deep warm dark brown
  bg_alt      = "#222019",   -- slightly lighter, for float/sidebars

  -- Named hues (lightened ~20% from light-mode values for dark bg contrast)
  purple      = "#B08AAA",   -- #83577D → lighter
  blue        = "#8AAAC8",   -- #556995 → lighter
  teal        = "#72AAAB",   -- #477A7B → lighter
  orange      = "#C4A06A",   -- #886A44 → lighter
  green       = "#A0A96E",   -- #747B4D → lighter
  red         = "#C48480",   -- #8F5652 → lighter
  comment     = "#6A6560",   -- muted warm grey, readable but clearly secondary
  berry       = "#CC6FAA",   -- #AA5087 → lighter

  -- Grey scale (dark-mode blend steps, running light→dark within a dark theme)
  grey1       = "#282523",   -- subtle bg tint (selection bg, etc.)
  grey2       = "#302D2A",
  grey3       = "#3A3733",
  grey4       = "#48443F",
  grey5       = "#56524C",
  grey6       = "#656058",
  grey7       = "#747068",
  grey8       = "#848078",

  -- Hue blends: dark tints for virtual text bgs, selections, diffs.
  -- Each is a very dark version of the hue, sitting just above bg.
  purple2     = "#2E1F2C",   -- selection, PmenuSel
  purple3     = "#3A2838",
  blue1       = "#1A2030",
  blue2       = "#1E2638",   -- Visual
  blue3       = "#242E44",
  teal1       = "#182828",
  teal2       = "#1C3030",
  teal3       = "#203838",
  orange1     = "#2A2018",
  orange2     = "#332618",
  orange3     = "#3C2C1C",
  green1      = "#202418",
  green2      = "#262C1C",
  green3      = "#2C3420",
  red1        = "#2A1A18",
  red2        = "#32201E",
  red3        = "#3A2624",
  berry1      = "#2A1824",
  berry2      = "#34202E",
  berry3      = "#3C2838",

  none        = "NONE",
}

-- ── Helper ────────────────────────────────────────────────────────────────────

local function hi(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- ── Editor UI ─────────────────────────────────────────────────────────────────

hi("Normal",           { fg = c.fg,      bg = c.bg })
hi("NormalFloat",      { fg = c.fg,      bg = c.bg_alt })
hi("NormalNC",         { fg = c.fg,      bg = c.bg })
hi("FloatBorder",      { fg = c.grey4,   bg = c.bg_alt })
hi("FloatTitle",       { fg = c.purple,  bg = c.bg_alt, bold = true })

hi("Cursor",           { fg = c.bg,      bg = c.fg })
hi("CursorIM",         { fg = c.bg,      bg = c.fg })
hi("CursorLine",       { bg = c.bg_alt })
hi("CursorColumn",     { bg = c.bg_alt })
hi("CursorLineNr",     { fg = c.fg_alt,  bold = true })

hi("LineNr",           { fg = c.grey4 })
hi("LineNrAbove",      { fg = c.grey4 })
hi("LineNrBelow",      { fg = c.grey4 })
hi("SignColumn",       { fg = c.grey4,   bg = c.bg })
hi("ColorColumn",      { bg = c.grey1 })
hi("FoldColumn",       { fg = c.grey5,   bg = c.bg })
hi("Folded",           { fg = c.comment, bg = c.grey1, italic = true })

hi("StatusLine",       { fg = c.fg,      bg = c.grey1 })
hi("StatusLineNC",     { fg = c.grey6,   bg = c.grey1 })
hi("TabLine",          { fg = c.grey7,   bg = c.grey1 })
hi("TabLineFill",      { bg = c.grey1 })
hi("TabLineSel",       { fg = c.fg,      bg = c.bg,    bold = true })
hi("WinBar",           { fg = c.fg,      bg = c.bg })
hi("WinBarNC",         { fg = c.grey6,   bg = c.bg_alt })
hi("WinSeparator",     { fg = c.grey2 })

hi("Pmenu",            { fg = c.fg,      bg = c.bg_alt })
hi("PmenuSel",         { fg = c.fg_alt,  bg = c.purple2, bold = true })
hi("PmenuSbar",        { bg = c.grey2 })
hi("PmenuThumb",       { bg = c.grey5 })
hi("PmenuKind",        { fg = c.teal,    bg = c.bg_alt })
hi("PmenuKindSel",     { fg = c.teal,    bg = c.purple2 })
hi("PmenuExtra",       { fg = c.comment, bg = c.bg_alt })
hi("PmenuExtraSel",    { fg = c.comment, bg = c.purple2 })
hi("PmenuMatch",       { fg = c.purple,  bg = c.bg_alt, bold = true })
hi("PmenuMatchSel",    { fg = c.purple,  bg = c.purple2, bold = true })

hi("Visual",           { bg = c.blue2 })
hi("VisualNOS",        { bg = c.blue2 })

hi("Search",           { fg = c.fg_alt,  bg = c.berry2 })
hi("IncSearch",        { fg = c.bg,      bg = c.berry })
hi("CurSearch",        { fg = c.bg,      bg = c.berry })
hi("Substitute",       { fg = c.bg,      bg = c.orange })

hi("MatchParen",       { fg = c.orange,  bg = c.orange2, bold = true })

hi("MsgArea",          { fg = c.fg })
hi("MsgSeparator",     { fg = c.grey3 })
hi("MoreMsg",          { fg = c.green,   bold = true })
hi("Question",         { fg = c.blue,    bold = true })
hi("ErrorMsg",         { fg = c.red,     bold = true })
hi("WarningMsg",       { fg = c.orange,  bold = true })

hi("NonText",          { fg = c.grey3 })
hi("EndOfBuffer",      { fg = c.grey2 })
hi("Whitespace",       { fg = c.grey3 })
hi("SpecialKey",       { fg = c.grey4 })
hi("Conceal",          { fg = c.grey5 })

hi("DiffAdd",          { fg = c.green,   bg = c.green1 })
hi("DiffChange",       { fg = c.blue,    bg = c.blue1 })
hi("DiffDelete",       { fg = c.red,     bg = c.red1 })
hi("DiffText",         { fg = c.blue,    bg = c.blue3, bold = true })
hi("Added",            { fg = c.green })
hi("Changed",          { fg = c.blue })
hi("Removed",          { fg = c.red })

hi("SpellBad",         { sp = c.red,     undercurl = true })
hi("SpellCap",         { sp = c.blue,    undercurl = true })
hi("SpellLocal",       { sp = c.teal,    undercurl = true })
hi("SpellRare",        { sp = c.orange,  undercurl = true })

hi("Directory",        { fg = c.blue,    bold = true })
hi("Title",            { fg = c.purple,  bold = true })
hi("QuickFixLine",     { bg = c.blue1 })

-- ── Syntax (legacy / :syntax on groups) ──────────────────────────────────────

hi("Comment",          { fg = c.comment, italic = true })
hi("Constant",         { fg = c.teal })
hi("String",           { fg = c.green })
hi("Character",        { fg = c.teal })
hi("Number",           { fg = c.teal })
hi("Float",            { fg = c.teal })
hi("Boolean",          { fg = c.teal })
hi("Identifier",       { fg = c.blue })
hi("Function",         { fg = c.fg,      italic = true })
hi("Statement",        { fg = c.purple })
hi("Conditional",      { fg = c.purple })
hi("Repeat",           { fg = c.purple })
hi("Label",            { fg = c.orange,  italic = true })
hi("Operator",         { fg = c.fg })
hi("Keyword",          { fg = c.purple })
hi("Exception",        { fg = c.purple })
hi("PreProc",          { fg = c.orange })
hi("Include",          { fg = c.purple })
hi("Define",           { fg = c.purple })
hi("Macro",            { fg = c.orange })
hi("PreCondit",        { fg = c.orange })
hi("Type",             { fg = c.purple })
hi("StorageClass",     { fg = c.purple })
hi("Structure",        { fg = c.purple })
hi("Typedef",          { fg = c.purple,  italic = true })
hi("Special",          { fg = c.orange })
hi("SpecialChar",      { fg = c.teal })
hi("Tag",              { fg = c.purple })
hi("Delimiter",        { fg = c.fg })
hi("SpecialComment",   { fg = c.comment, bold = true, italic = true })
hi("Debug",            { fg = c.red })
hi("Underlined",       { underline = true })
hi("Ignore",           { fg = c.grey4 })
hi("Error",            { fg = c.red,     bg = c.red1 })
hi("Todo",             { fg = c.orange,  bg = c.orange1, bold = true, italic = true })

-- ── Treesitter: base @-groups ─────────────────────────────────────────────────

hi("@variable",                { fg = c.blue })
hi("@variable.builtin",        { fg = c.purple })
hi("@variable.parameter",      { fg = c.blue })
hi("@variable.member",         { fg = c.blue })

hi("@function",                { fg = c.fg,     italic = true })
hi("@function.builtin",        { fg = c.fg,     italic = true })
hi("@function.call",           { fg = c.fg,     italic = true })
hi("@function.method",         { fg = c.fg,     italic = true })
hi("@function.method.call",    { fg = c.fg,     italic = true })
hi("@constructor",             { fg = c.fg,     italic = true })

hi("@keyword",                 { fg = c.purple })
hi("@keyword.function",        { fg = c.purple })
hi("@keyword.operator",        { fg = c.fg })
hi("@keyword.import",          { fg = c.purple })
hi("@keyword.return",          { fg = c.purple })
hi("@keyword.exception",       { fg = c.purple })
hi("@keyword.conditional",     { fg = c.purple })
hi("@keyword.repeat",          { fg = c.purple })
hi("@keyword.debug",           { fg = c.red })
hi("@keyword.directive",       { fg = c.orange })

hi("@type",                    { fg = c.purple })
hi("@type.builtin",            { fg = c.purple })
hi("@type.definition",         { fg = c.purple,  italic = true })

hi("@module",                  { fg = c.fg,      italic = true })
hi("@module.builtin",          { fg = c.fg,      italic = true })
hi("@namespace",               { fg = c.fg,      italic = true })

hi("@string",                  { fg = c.green })
hi("@string.regexp",           { fg = c.orange })
hi("@string.escape",           { fg = c.teal })
hi("@string.special",          { fg = c.teal })
hi("@string.special.url",      { fg = c.blue,    underline = true })
hi("@number",                  { fg = c.teal })
hi("@number.float",            { fg = c.teal })
hi("@boolean",                 { fg = c.teal })
hi("@character",               { fg = c.teal })

hi("@comment",                 { fg = c.comment, italic = true })
hi("@comment.todo",            { fg = c.orange,  bg = c.orange1, bold = true, italic = true })
hi("@comment.warning",         { fg = c.orange,  bold = true })
hi("@comment.error",           { fg = c.red,     bold = true })
hi("@comment.note",            { fg = c.blue,    bold = true })

hi("@operator",                { fg = c.fg })
hi("@punctuation",             { fg = c.fg })
hi("@punctuation.bracket",     { fg = c.fg })
hi("@punctuation.delimiter",   { fg = c.fg })
hi("@punctuation.special",     { fg = c.orange })

hi("@attribute",               { fg = c.blue })
hi("@label",                   { fg = c.orange,  italic = true })

hi("@tag",                     { fg = c.purple })
hi("@tag.attribute",           { fg = c.blue })
hi("@tag.builtin",             { fg = c.purple })
hi("@tag.delimiter",           { fg = c.grey6 })

hi("@property",                { fg = c.blue })
hi("@constant",                { fg = c.teal })
hi("@constant.builtin",        { fg = c.teal })
hi("@constant.macro",          { fg = c.orange })
hi("@field",                   { fg = c.blue })

-- ── Treesitter: Markup / Markdown ─────────────────────────────────────────────

hi("@markup.heading",          { fg = c.purple,  bold = true })
hi("@markup.heading.1",        { fg = c.purple,  bold = true })
hi("@markup.heading.2",        { fg = c.blue,    bold = true })
hi("@markup.heading.3",        { fg = c.teal,    bold = true })
hi("@markup.heading.4",        { fg = c.orange,  bold = true })
hi("@markup.heading.5",        { fg = c.green,   bold = true })
hi("@markup.heading.6",        { fg = c.comment, bold = true })

hi("@markup.heading.1.marker.markdown",  { fg = c.purple,  bold = true })
hi("@markup.heading.2.marker.markdown",  { fg = c.blue,    bold = true })
hi("@markup.heading.3.marker.markdown",  { fg = c.teal,    bold = true })
hi("@markup.heading.4.marker.markdown",  { fg = c.orange,  bold = true })
hi("@markup.heading.5.marker.markdown",  { fg = c.green,   bold = true })
hi("@markup.heading.6.marker.markdown",  { fg = c.comment, bold = true })

hi("@markup.heading.1.markdown",  { fg = c.purple,  bold = true })
hi("@markup.heading.2.markdown",  { fg = c.blue,    bold = true })
hi("@markup.heading.3.markdown",  { fg = c.teal,    bold = true })
hi("@markup.heading.4.markdown",  { fg = c.orange,  bold = true })
hi("@markup.heading.5.markdown",  { fg = c.green,   bold = true })
hi("@markup.heading.6.markdown",  { fg = c.comment, bold = true })

hi("@markup.bold",             { fg = c.fg_alt,  bold = true })
hi("@markup.italic",           { fg = c.fg,      italic = true })
hi("@markup.strikethrough",    { fg = c.comment, strikethrough = true })
hi("@markup.underline",        { underline = true })
hi("@markup.quote",            { fg = c.orange,  italic = true })
hi("@markup.raw",              { fg = c.orange })
hi("@markup.raw.block",        { fg = c.orange })
hi("@markup.list",             { fg = c.fg })
hi("@markup.list.checked",     { fg = c.green })
hi("@markup.list.unchecked",   { fg = c.grey5 })

hi("@markup.link",             { fg = c.teal })
hi("@markup.link.label",       { fg = c.teal })
hi("@markup.link.url",         { fg = c.blue,    underline = true })
hi("@markup.link.markdown_inline", { fg = c.teal })
hi("@markup.math",             { fg = c.teal })

-- ── Treesitter: Elixir specifics ─────────────────────────────────────────────

hi("@keyword.elixir",              { fg = c.purple })
hi("@keyword.special.elixir",      { fg = c.purple,  italic = true })
hi("@function.elixir",             { fg = c.fg,      italic = true })
hi("@function.macro.elixir",       { fg = c.orange,  italic = true })
hi("@variable.special.elixir",     { fg = c.purple })
hi("@module.elixir",               { fg = c.fg,      italic = true })
hi("@string.elixir",               { fg = c.green })
hi("@string.sigil.elixir",         { fg = c.orange })
hi("@string.escape.elixir",        { fg = c.teal })
hi("@number.elixir",               { fg = c.teal })
hi("@constant.elixir",             { fg = c.teal })
hi("@symbol.elixir",               { fg = c.teal })
hi("@attribute.elixir",            { fg = c.orange,  italic = true })
hi("@punctuation.special.elixir",  { fg = c.orange })
hi("@operator.elixir",             { fg = c.fg })
hi("@operator.pipe.elixir",        { fg = c.purple })

-- ── Diagnostics ───────────────────────────────────────────────────────────────

hi("DiagnosticError",              { fg = c.red })
hi("DiagnosticWarn",               { fg = c.orange })
hi("DiagnosticInfo",               { fg = c.blue })
hi("DiagnosticHint",               { fg = c.teal })
hi("DiagnosticOk",                 { fg = c.green })

hi("DiagnosticUnderlineError",     { sp = c.red,    undercurl = true })
hi("DiagnosticUnderlineWarn",      { sp = c.orange, undercurl = true })
hi("DiagnosticUnderlineInfo",      { sp = c.blue,   undercurl = true })
hi("DiagnosticUnderlineHint",      { sp = c.teal,   undercurl = true })

hi("DiagnosticVirtualTextError",   { fg = c.red,    bg = c.red1,    italic = true })
hi("DiagnosticVirtualTextWarn",    { fg = c.orange, bg = c.orange1, italic = true })
hi("DiagnosticVirtualTextInfo",    { fg = c.blue,   bg = c.blue1,   italic = true })
hi("DiagnosticVirtualTextHint",    { fg = c.teal,   bg = c.teal1,   italic = true })

hi("DiagnosticSignError",          { fg = c.red,    bg = c.bg })
hi("DiagnosticSignWarn",           { fg = c.orange, bg = c.bg })
hi("DiagnosticSignInfo",           { fg = c.blue,   bg = c.bg })
hi("DiagnosticSignHint",           { fg = c.teal,   bg = c.bg })

-- ── LSP ───────────────────────────────────────────────────────────────────────

hi("LspReferenceText",             { bg = c.grey1 })
hi("LspReferenceRead",             { bg = c.teal1 })
hi("LspReferenceWrite",            { bg = c.orange2 })
hi("LspInlayHint",                 { fg = c.grey6,   bg = c.grey1, italic = true })
hi("LspCodeLens",                  { fg = c.comment, italic = true })
hi("LspCodeLensSeparator",         { fg = c.grey3 })
hi("LspSignatureActiveParameter",  { fg = c.orange,  bold = true })

-- ── Semantic tokens ───────────────────────────────────────────────────────────

hi("@lsp.type.variable",          { link = "@variable" })
hi("@lsp.type.parameter",         { link = "@variable.parameter" })
hi("@lsp.type.property",          { link = "@property" })
hi("@lsp.type.function",          { link = "@function" })
hi("@lsp.type.method",            { link = "@function.method" })
hi("@lsp.type.macro",             { fg = c.orange,  italic = true })
hi("@lsp.type.class",             { link = "@type" })
hi("@lsp.type.interface",         { fg = c.purple,  italic = true })
hi("@lsp.type.struct",            { link = "@type" })
hi("@lsp.type.enum",              { link = "@type" })
hi("@lsp.type.enumMember",        { link = "@constant" })
hi("@lsp.type.namespace",         { link = "@module" })
hi("@lsp.type.string",            { link = "@string" })
hi("@lsp.type.number",            { link = "@number" })
hi("@lsp.type.boolean",           { link = "@boolean" })
hi("@lsp.type.comment",           { link = "@comment" })
hi("@lsp.type.keyword",           { link = "@keyword" })
hi("@lsp.type.operator",          { link = "@operator" })
hi("@lsp.type.decorator",         { fg = c.orange,  italic = true })
hi("@lsp.type.typeParameter",     { fg = c.purple,  italic = true })
hi("@lsp.mod.readonly",           { fg = c.teal })
hi("@lsp.mod.defaultLibrary",     { italic = true })
hi("@lsp.mod.deprecated",         { fg = c.comment, strikethrough = true })

-- ── Git signs (gitsigns.nvim) ─────────────────────────────────────────────────

hi("GitSignsAdd",                  { fg = c.green,  bg = c.bg })
hi("GitSignsChange",               { fg = c.blue,   bg = c.bg })
hi("GitSignsDelete",               { fg = c.red,    bg = c.bg })
hi("GitSignsTopDelete",            { fg = c.red,    bg = c.bg })
hi("GitSignsChangeDelete",         { fg = c.orange, bg = c.bg })
hi("GitSignsUntracked",            { fg = c.grey5,  bg = c.bg })

-- ── Telescope ─────────────────────────────────────────────────────────────────

hi("TelescopeNormal",              { fg = c.fg,     bg = c.bg })
hi("TelescopeBorder",              { fg = c.grey3,  bg = c.bg })
hi("TelescopePromptBorder",        { fg = c.grey3,  bg = c.bg })
hi("TelescopePromptNormal",        { fg = c.fg,     bg = c.bg_alt })
hi("TelescopePromptPrefix",        { fg = c.purple, bg = c.bg_alt })
hi("TelescopeResultsBorder",       { fg = c.grey3,  bg = c.bg })
hi("TelescopePreviewBorder",       { fg = c.grey3,  bg = c.bg })
hi("TelescopeSelection",           { fg = c.fg,     bg = c.blue2 })
hi("TelescopeSelectionCaret",      { fg = c.purple, bg = c.blue2 })
hi("TelescopeMultiSelection",      { fg = c.teal,   bg = c.teal1 })
hi("TelescopeMatching",            { fg = c.purple, bold = true })
hi("TelescopeTitle",               { fg = c.purple, bold = true })

-- ── blink.cmp ─────────────────────────────────────────────────────────────────

hi("BlinkCmpMenu",                 { fg = c.fg,     bg = c.bg_alt })
hi("BlinkCmpMenuBorder",           { fg = c.grey3,  bg = c.bg_alt })
hi("BlinkCmpMenuSelection",        { fg = c.fg_alt, bg = c.purple2, bold = true })
hi("BlinkCmpLabel",                { fg = c.fg })
hi("BlinkCmpLabelMatch",           { fg = c.purple, bold = true })
hi("BlinkCmpLabelDeprecated",      { fg = c.comment, strikethrough = true })
hi("BlinkCmpKind",                 { fg = c.teal })
hi("BlinkCmpKindFunction",         { fg = c.fg,     italic = true })
hi("BlinkCmpKindMethod",           { fg = c.fg,     italic = true })
hi("BlinkCmpKindKeyword",          { fg = c.purple })
hi("BlinkCmpKindVariable",         { fg = c.blue })
hi("BlinkCmpKindConstant",         { fg = c.teal })
hi("BlinkCmpKindField",            { fg = c.blue })
hi("BlinkCmpKindModule",           { fg = c.fg,     italic = true })
hi("BlinkCmpKindClass",            { fg = c.purple })
hi("BlinkCmpKindInterface",        { fg = c.purple, italic = true })
hi("BlinkCmpKindStruct",           { fg = c.purple })
hi("BlinkCmpKindEnum",             { fg = c.purple })
hi("BlinkCmpKindEnumMember",       { fg = c.teal })
hi("BlinkCmpKindSnippet",          { fg = c.orange })
hi("BlinkCmpKindText",             { fg = c.comment })
hi("BlinkCmpKindColor",            { fg = c.red })
hi("BlinkCmpKindFile",             { fg = c.green })
hi("BlinkCmpKindFolder",           { fg = c.green,  bold = true })
hi("BlinkCmpKindReference",        { fg = c.blue })
hi("BlinkCmpKindUnit",             { fg = c.teal })
hi("BlinkCmpKindValue",            { fg = c.teal })
hi("BlinkCmpKindEvent",            { fg = c.orange })
hi("BlinkCmpKindOperator",         { fg = c.fg })
hi("BlinkCmpKindTypeParameter",    { fg = c.purple, italic = true })
hi("BlinkCmpDoc",                  { fg = c.fg,     bg = c.bg_alt })
hi("BlinkCmpDocBorder",            { fg = c.grey3,  bg = c.bg_alt })
hi("BlinkCmpDocCursorLine",        { bg = c.grey1 })
hi("BlinkCmpScrollBarThumb",       { bg = c.grey4 })
hi("BlinkCmpScrollBarGutter",      { bg = c.grey2 })
hi("BlinkCmpSignatureHelp",        { fg = c.fg,     bg = c.bg_alt })
hi("BlinkCmpSignatureHelpBorder",  { fg = c.grey3,  bg = c.bg_alt })
hi("BlinkCmpSignatureHelpActiveParameter", { fg = c.orange, bold = true })

-- ── Indent guides ─────────────────────────────────────────────────────────────

hi("IblIndent",                    { fg = c.grey2 })
hi("IblScope",                     { fg = c.grey4 })
hi("IblWhitespace",                { fg = c.grey2 })
hi("SnacksIndent",                 { fg = c.grey2 })
hi("SnacksIndentScope",            { fg = c.grey4 })

-- ── Neotree / Oil ─────────────────────────────────────────────────────────────

hi("NeoTreeNormal",                { fg = c.fg,     bg = c.bg_alt })
hi("NeoTreeNormalNC",              { fg = c.fg,     bg = c.bg_alt })
hi("NeoTreeDirectoryName",         { fg = c.blue,   bold = true })
hi("NeoTreeDirectoryIcon",         { fg = c.blue })
hi("NeoTreeRootName",              { fg = c.purple, bold = true })
hi("NeoTreeFileName",              { fg = c.fg })
hi("NeoTreeFileIcon",              { fg = c.grey6 })
hi("NeoTreeFileNameOpened",        { fg = c.fg,     bold = true })
hi("NeoTreeModified",              { fg = c.orange })
hi("NeoTreeGitAdded",              { fg = c.green })
hi("NeoTreeGitModified",           { fg = c.blue })
hi("NeoTreeGitDeleted",            { fg = c.red })
hi("NeoTreeGitUntracked",          { fg = c.grey5 })
hi("NeoTreeIndentMarker",          { fg = c.grey2 })
hi("NeoTreeExpander",              { fg = c.grey5 })
hi("NeoTreeDotfile",               { fg = c.grey6 })
hi("NeoTreeHiddenByName",          { fg = c.grey6 })
hi("NeoTreeSymbolicLinkTarget",    { fg = c.teal })

hi("OilDir",                       { fg = c.blue,   bold = true })
hi("OilFile",                      { fg = c.fg })
hi("OilDirIcon",                   { fg = c.blue })
hi("OilLink",                      { fg = c.teal })
hi("OilLinkTarget",                { fg = c.teal,   italic = true })
hi("OilCopy",                      { fg = c.green })
hi("OilMove",                      { fg = c.orange })
hi("OilDelete",                    { fg = c.red })
hi("OilCreate",                    { fg = c.green })
hi("OilChange",                    { fg = c.blue })
hi("OilRestore",                   { fg = c.teal })
hi("OilPurge",                     { fg = c.red,    bold = true })
hi("OilTrash",                     { fg = c.red })
hi("OilTrashSourcePath",           { fg = c.comment,italic = true })

-- ── Which-key ─────────────────────────────────────────────────────────────────

hi("WhichKey",                     { fg = c.purple })
hi("WhichKeyGroup",                { fg = c.blue,   bold = true })
hi("WhichKeyDesc",                 { fg = c.fg })
hi("WhichKeySeparator",            { fg = c.grey4 })
hi("WhichKeyFloat",                { bg = c.bg_alt })
hi("WhichKeyBorder",               { fg = c.grey3 })
hi("WhichKeyValue",                { fg = c.comment })
hi("WhichKeyTitle",                { fg = c.purple, bold = true })

-- ── Render-markdown.nvim ──────────────────────────────────────────────────────

hi("RenderMarkdownH1",             { fg = c.purple,  bg = c.purple2, bold = true })
hi("RenderMarkdownH2",             { fg = c.blue,    bg = c.blue2,   bold = true })
hi("RenderMarkdownH3",             { fg = c.teal,    bg = c.teal2,   bold = true })
hi("RenderMarkdownH4",             { fg = c.orange,  bg = c.orange2, bold = true })
hi("RenderMarkdownH5",             { fg = c.green,   bg = c.green2,  bold = true })
hi("RenderMarkdownH6",             { fg = c.comment, bg = c.grey1,   bold = true })
hi("RenderMarkdownH1Bg",           { bg = c.purple2 })
hi("RenderMarkdownH2Bg",           { bg = c.blue2 })
hi("RenderMarkdownH3Bg",           { bg = c.teal2 })
hi("RenderMarkdownH4Bg",           { bg = c.orange2 })
hi("RenderMarkdownH5Bg",           { bg = c.green2 })
hi("RenderMarkdownH6Bg",           { bg = c.grey1 })
hi("RenderMarkdownBullet",         { fg = c.purple })
hi("RenderMarkdownCode",           { bg = c.orange1 })
hi("RenderMarkdownCodeInline",     { fg = c.orange,  bg = c.orange1 })
hi("RenderMarkdownQuote",          { fg = c.orange,  italic = true })
hi("RenderMarkdownDash",           { fg = c.grey3 })
hi("RenderMarkdownLink",           { fg = c.teal })
hi("RenderMarkdownTableHead",      { fg = c.fg_alt,  bold = true })
hi("RenderMarkdownTableRow",       { fg = c.fg })
hi("RenderMarkdownTableFill",      { fg = c.grey3 })
hi("RenderMarkdownChecked",        { fg = c.green })
hi("RenderMarkdownUnchecked",      { fg = c.grey5 })
hi("RenderMarkdownTodo",           { fg = c.orange,  bold = true })

-- ── Terminal colors ───────────────────────────────────────────────────────────

vim.g.terminal_color_0  = c.grey1     -- black
vim.g.terminal_color_1  = c.red       -- red
vim.g.terminal_color_2  = c.green     -- green
vim.g.terminal_color_3  = c.orange    -- yellow
vim.g.terminal_color_4  = c.blue      -- blue
vim.g.terminal_color_5  = c.purple    -- magenta
vim.g.terminal_color_6  = c.teal      -- cyan
vim.g.terminal_color_7  = c.fg        -- white
vim.g.terminal_color_8  = c.grey3     -- bright black
vim.g.terminal_color_9  = "#D49490"   -- bright red
vim.g.terminal_color_10 = "#B8BF88"   -- bright green
vim.g.terminal_color_11 = "#D4B880"   -- bright yellow
vim.g.terminal_color_12 = "#9AAED0"   -- bright blue
vim.g.terminal_color_13 = "#C4A0BE"   -- bright magenta
vim.g.terminal_color_14 = "#8EC8C9"   -- bright cyan
vim.g.terminal_color_15 = c.fg_alt    -- bright white
