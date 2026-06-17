return {
	{
		"echasnovski/mini.base16",
		version = false,
		config = function()
			require("mini.base16").setup({
				palette = {
					base00 = "#101011", -- editor.background
					base01 = "#090909", -- sidebar, statusBar, bg mais escuro
					base02 = "#1e1f23", -- seleção, list active, tab ativa
					base03 = "#8B9EA1", -- comentários
					base04 = "#797979", -- line numbers
					base05 = "#e7e7e7", -- foreground principal
					base06 = "#D4D4D4", -- foreground dimmed (embedded, operators)
					base07 = "#ffffff", -- brightest
					base08 = "#f2777a", -- erros, constant.language (null/false/true)
					base09 = "#B5CEA8", -- números, constants
					base0A = "#5fc0a0", -- classes, tipos, tags HTML
					base0B = "#FFDF9F", -- strings
					base0C = "#90cae8", -- escape chars, regex
					base0D = "#83dcdc", -- funções, métodos
					base0E = "#F79CE0", -- keywords, storage, variable.language
					base0F = "#D7Ba7D", -- CSS tags, escape chars especiais
				},
			})

			local hl = vim.api.nvim_set_hl
			local function h(group, opts)
				hl(0, group, opts)
			end

			local p = {
				bg = "#101011", -- editor.background
				bg_alt = "#090909", -- sidebar, statusBar, titleBar
				bg_active = "#1e1f23", -- list selection, tab ativa
				bg_hover = "#151619", -- list hover
				bg_widget = "#28292d", -- scrollbar, editorBracketMatch
				comment = "#8B9EA1", -- comentários, fg secundário
				fg_dim = "#797979", -- line numbers, inactive
				fg = "#e7e7e7", -- foreground principal
				fg_mid = "#D4D4D4", -- embedded, operators simples
				fg_bright = "#9CDCFE", -- variáveis genéricas
				fg_const = "#8FA6FF", -- variable.other.constant, enum members
				fg_punctuation = "#D2D7DE",
				white = "#ffffff",
				red = "#f2777a", -- erros, invalid, git delete
				pink = "#F79CE0", -- keywords, properties, attributes
				blue = "#8FA6FF", -- @type
				blue2 = "#76cff6", -- @type.builtin, defaultLibrary
				orange = "#f7bf8b", -- this/self, params TS, properties TS
				orange2 = "#d85927", -- this/self, params TS, properties TS
				yellow = "#ffdf9f", -- strings, funções definição, @variable.member
				cyan = "#83dcdc", -- funções chamada, métodos
				purple = "#ca9cfc", -- decorators, misc
				green = "#5fc0a0", -- classes, tipos, tags, git add
				green2 = "#B5CEA8", -- números, CSS units
				focus = "#5e6ad2", -- statusline normal, search, badge
				none = "NONE",
			}

			-- ===========================================================================
			-- EDITOR BASE
			-- ===========================================================================
			h("Normal", { fg = p.fg, bg = p.bg })
			h("NormalFloat", { fg = p.fg, bg = p.bg_alt })
			h("NormalNC", { fg = p.comment, bg = p.bg })
			h("FloatBorder", { fg = p.comment, bg = p.bg_alt })

			h("LineNr", { fg = p.fg_dim })
			h("CursorLine", { bg = p.bg_active })
			h("CursorLineNr", { fg = p.fg, bg = p.bg_active })
			h("CursorColumn", { bg = p.bg_active })

			h("Visual", { bg = p.bg_widget })
			h("VisualNOS", { bg = p.bg_widget })

			h("Search", { fg = p.bg, bg = p.yellow })
			h("IncSearch", { fg = p.bg, bg = p.yellow })
			h("CurSearch", { fg = p.bg, bg = p.yellow })

			h("StatusLine", { fg = p.comment, bg = p.bg_alt })
			h("StatusLineNC", { fg = p.fg_dim, bg = p.bg_alt })
			h("WinSeparator", { fg = p.bg_active })
			h("VertSplit", { fg = p.bg_active })

			h("Pmenu", { fg = p.fg, bg = p.bg_alt })
			h("PmenuSel", { fg = p.fg, bg = p.bg_active, bold = true })
			h("PmenuSbar", { bg = p.bg_alt })
			h("PmenuThumb", { bg = p.comment })

			h("TabLine", { fg = p.comment, bg = p.bg_alt })
			h("TabLineSel", { fg = p.fg, bg = p.bg_active })
			h("TabLineFill", { bg = p.bg_alt })

			h("SignColumn", { fg = p.comment, bg = p.bg })
			h("FoldColumn", { fg = p.comment, bg = p.bg })
			h("Folded", { fg = p.comment, bg = p.bg_active })

			h("MatchParen", { fg = p.yellow, bold = true, underline = true })
			h("NonText", { fg = p.bg_active })
			h("SpecialKey", { fg = p.bg_active })
			h("Whitespace", { fg = p.bg_active })
			h("EndOfBuffer", { fg = p.bg_active })

			h("Directory", { fg = p.pink })
			h("WildMenu", { fg = p.bg, bg = p.focus })
			h("Title", { fg = p.pink, bold = true })

			h("DiffAdd", { fg = p.green, bg = p.bg })
			h("DiffChange", { fg = p.yellow, bg = p.bg })
			h("DiffDelete", { fg = p.red, bg = p.bg })
			h("DiffText", { fg = p.yellow, bg = p.bg_active })

			h("SpellBad", { sp = p.red, undercurl = true })
			h("SpellCap", { sp = p.yellow, undercurl = true })
			h("SpellRare", { sp = p.cyan, undercurl = true })
			h("SpellLocal", { sp = p.green2, undercurl = true })

			-- ===========================================================================
			-- SINTAXE CLÁSSICA
			-- ===========================================================================
			h("Comment", { fg = p.comment, italic = true })
			h("String", { fg = p.yellow })
			h("Character", { fg = p.yellow })
			h("Number", { fg = p.green2 })
			h("Float", { fg = p.green2 })
			h("Boolean", { fg = p.fg_const })

			h("Keyword", { fg = p.pink })
			h("Statement", { fg = p.pink })
			h("Conditional", { fg = p.pink })
			h("Repeat", { fg = p.pink })
			h("Exception", { fg = p.pink })
			h("Include", { fg = p.pink })
			h("Define", { fg = p.pink })
			h("Macro", { fg = p.pink })
			h("PreProc", { fg = p.pink })
			h("PreCondit", { fg = p.pink })

			h("Identifier", { fg = p.fg_const })
			h("Function", { fg = p.cyan })
			h("Type", { fg = p.green })
			h("StorageClass", { fg = p.pink })
			h("Structure", { fg = p.green })
			h("Typedef", { fg = p.green })

			h("Constant", { fg = p.fg_const })
			h("Special", { fg = p.pink })
			h("SpecialChar", { fg = p.pink })
			h("Tag", { fg = p.green })
			h("Delimiter", { fg = p.fg_mid })
			h("SpecialComment", { fg = p.comment, italic = true })
			h("Debug", { fg = p.red })

			h("Underlined", { underline = true })
			h("Ignore", { fg = p.bg_active })
			h("Error", { fg = p.red })
			h("Todo", { fg = p.yellow, italic = true })
			h("Operator", { fg = p.fg_mid })

			-- ===========================================================================
			-- TREESITTER
			-- ===========================================================================

			h("@comment", { fg = p.comment, italic = true })
			h("@comment.documentation", { fg = p.comment, italic = true })

			h("@string", { fg = p.yellow })
			h("@string.escape", { fg = p.orange })
			h("@string.special", { fg = p.orange })
			h("@string.regex", { fg = p.red })
			h("@string.special.url", { fg = p.pink, underline = true })
			h("@string.special.symbol", { fg = p.fg_mid })
			h("@string.typescript", { fg = p.orange })

			h("@number", { fg = p.green2 })
			h("@number.float", { fg = p.green2 })
			h("@boolean", { fg = p.fg_const })

			-- Keywords
			h("@keyword", { fg = p.pink })
			h("@keyword.function", { fg = p.pink })
			h("@keyword.conditional", { fg = p.pink })
			h("@keyword.conditional.ternary", { fg = p.pink })
			h("@keyword.repeat", { fg = p.pink })
			h("@keyword.exception", { fg = p.pink })
			h("@keyword.operator", { fg = p.fg_mid })
			h("@keyword.coroutine", { fg = p.pink })
			h("@keyword.type", { fg = p.pink })
			h("@keyword.modifier", { fg = p.pink })
			h("@keyword.import", { fg = p.pink })
			h("@keyword.export", { fg = p.pink })
			h("@keyword.return", { fg = p.pink })
			h("@keyword.new", { fg = p.pink })

			-- Variables
			h("@variable", { fg = p.fg_const })
			h("@variable.parameter", { fg = p.orange })
			h("@variable.parameter.builtin", { fg = p.orange })
			h("@variable.builtin", { fg = p.orange }) -- this/self
			h("@variable.member", { fg = p.orange }) -- object members/properties

			-- Types
			h("@type", { fg = p.blue })
			h("@type.builtin", { fg = p.blue2 })
			h("@type.qualifier", { fg = p.blue2 })
			h("@type.definition", { fg = p.blue2 })

			-- Constants
			h("@constant", { fg = p.fg_const })
			h("@constant.builtin", { fg = p.fg_const }) -- null/undefined/NaN
			h("@constant.macro", { fg = p.green2 })

			-- Functions
			h("@function", { fg = p.cyan })
			h("@function.call", { fg = p.cyan })
			h("@function.builtin", { fg = p.cyan })
			h("@function.method", { fg = p.cyan })
			h("@function.method.call", { fg = p.cyan })
			h("@function.typescript", { fg = p.cyan })
			h("@constructor", { fg = p.cyan })

			-- Properties / object keys
			h("@property", { fg = p.yellow })
			h("@attribute", { fg = p.pink })
			h("@field", { fg = p.orange })

			-- Operators / punctuation
			h("@operator", { fg = p.fg_mid })
			h("@punctuation.bracket", { fg = p.fg_mid })
			h("@punctuation.delimiter", { fg = p.fg_mid })
			h("@punctuation.special", { fg = p.pink })

			-- Namespaces / modules
			h("@module", { fg = p.green })
			h("@namespace", { fg = p.green })
			h("@label", { fg = p.fg })

			-- Tags HTML/JSX
			h("@tag", { fg = p.green })
			h("@tag.attribute", { fg = p.pink })
			h("@tag.delimiter", { fg = p.comment })

			-- Markup
			h("@markup.heading", { fg = p.pink, bold = true })
			h("@markup.strong", { fg = p.pink, bold = true })
			h("@markup.italic", { italic = true })
			h("@markup.link", { fg = p.pink, underline = true })
			h("@markup.raw", { fg = p.yellow })

			-- TS específicos treesitter
			h("@variable.typescript", { fg = p.fg_const })
			h("@variable.parameter.typescript", { fg = p.orange })
			h("@type.typescript", { fg = p.blue2 })

			-- ===========================================================================
			-- LSP SEMANTIC TOKENS
			-- ===========================================================================

			h("@lsp.type.variable", { fg = p.fg_const })
			h("@lsp.type.parameter", { fg = p.orange })
			h("@lsp.type.property", { fg = p.orange })
			h("@lsp.type.enumMember", { fg = p.fg_const })
			h("@lsp.type.function", { fg = p.cyan })
			h("@lsp.type.method", { fg = p.cyan })
			h("@lsp.type.class", { fg = p.green })
			h("@lsp.type.interface", { fg = p.green })
			h("@lsp.type.type", { fg = p.blue })
			h("@lsp.type.typeParameter", { fg = p.blue2 })
			h("@lsp.type.enum", { fg = p.green })
			h("@lsp.type.struct", { fg = p.green })
			h("@lsp.type.namespace", { fg = p.green })
			h("@lsp.type.decorator", { fg = p.pink })
			h("@lsp.type.keyword", { fg = p.pink })
			h("@lsp.type.string", { fg = p.yellow })
			h("@lsp.type.number", { fg = p.green2 })
			h("@lsp.type.comment", { fg = p.comment })
			h("@lsp.type.operator", { fg = p.fg_mid })
			h("@lsp.type.macro", { fg = p.pink })

			-- LSP Modifiers
			h("@lsp.typemod.variable.defaultLibrary", { fg = p.blue2 })
			h("@lsp.typemod.variable.readonly", { fg = p.fg_const })
			h("@lsp.typemod.variable.static", { fg = p.fg_const })
			h("@lsp.typemod.function.declaration", { fg = p.cyan })
			h("@lsp.typemod.function.defaultLibrary", { fg = p.blue2 })
			h("@lsp.typemod.method.declaration", { fg = p.cyan })
			h("@lsp.typemod.method.defaultLibrary", { fg = p.blue2 })
			h("@lsp.typemod.property.declaration", { fg = p.orange })
			h("@lsp.typemod.property.readonly", { fg = p.orange })

			-- JS/TS específicos
			h("@lsp.type.variable.javascript", { fg = p.fg_const })
			h("@lsp.type.variable.typescript", { fg = p.fg_const })
			h("@lsp.type.parameter.javascript", { fg = p.orange })
			h("@lsp.type.parameter.typescript", { fg = p.orange })
			h("@lsp.type.property.javascript", { fg = p.orange })
			h("@lsp.type.property.typescript", { fg = p.orange })
			h("@lsp.type.function.javascript", { fg = p.cyan })
			h("@lsp.type.function.typescript", { fg = p.cyan })
			h("@lsp.type.method.javascript", { fg = p.cyan })
			h("@lsp.type.method.typescript", { fg = p.cyan })
			h("@lsp.type.type.typescript", { fg = p.blue })
			h("@lsp.type.interface.typescript", { fg = p.cyan })
			h("@lsp.type.class.typescript", { fg = p.cyan })
			h("@lsp.type.typeParameter.typescript", { fg = p.blue2 })
			h("@lsp.type.enum.typescript", { fg = p.green })
			h("@lsp.type.enumMember.typescript", { fg = p.fg_const })
			h("@lsp.type.namespace.typescript", { fg = p.green })

			-- Bash
			h("@nospell.bash", { fg = p.comment })
			h("@variable.parameter.bash", { fg = p.fg_mid })
			h("@constant.bash", { fg = p.orange })
			h("@number.bash", { fg = p.fg_mid })
			h("@punctuation.special.bash", { fg = p.yellow })
			h("@variable.bash", { fg = p.orange })
			h("@string.special.path.bash", { fg = p.fg_mid })

			-- Css
			h("@attribute.css", { fg = p.orange })
			h("@variable.css", { fg = p.orange })
			h("@string.css", { fg = p.yellow })
			h("@number.css", { fg = p.cyan })

			-- HTML
			h("@constant.html", { fg = p.comment })
			h("@tag.html", { fg = p.pink })
			h("@tag.attribute", { fg = p.orange })
			h("@markup.heading.html", { fg = p.fg })
			h("@markup.heading.1.html", { fg = p.fg })
			h("@markup.heading.2.html", { fg = p.fg })
			h("@markup.heading.3.html", { fg = p.fg })
			h("@markup.heading.4.html", { fg = p.fg })
			h("@markup.heading.5.html", { fg = p.fg })
			h("@markup.heading.6.html", { fg = p.fg })

			-- SQl
			h("sqlFold", { fg = p.blue2 })
			h("sqlType", { fg = p.blue2 })
			h("sqlKeyword", { fg = p.orange })

			-- Tag
			h("@tag.xml", { fg = p.pink })
			h("@tag.attribute.xml", { fg = p.orange })

			-- YAML
			h("@property.yaml", { fg = p.pink })
			h("@number.yaml", { fg = p.cyan })

			-- ===========================================================================
			-- LSP DIAGNÓSTICOS
			-- ===========================================================================
			h("DiagnosticError", { fg = p.red })
			h("DiagnosticWarn", { fg = p.yellow })
			h("DiagnosticInfo", { fg = p.blue2 })
			h("DiagnosticHint", { fg = p.comment })
			h("DiagnosticUnnecessary", { fg = p.comment })

			h("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
			h("DiagnosticUnderlineWarn", { sp = p.yellow, undercurl = true })
			h("DiagnosticUnderlineInfo", { sp = p.blue2, undercurl = true })
			h("DiagnosticUnderlineHint", { sp = p.comment, undercurl = true })

			h("LspReferenceText", { bg = p.bg_widget })
			h("LspReferenceRead", { bg = p.bg_widget })
			h("LspReferenceWrite", { bg = p.bg_widget, bold = true })
			h("LspInlayHint", { fg = p.comment, italic = true })

			-- ===========================================================================
			-- PLUGINS COMUNS
			-- ===========================================================================

			-- Telescope
			h("TelescopeNormal", { fg = p.fg, bg = p.bg_alt })
			h("TelescopeBorder", { fg = p.comment, bg = p.bg_alt })
			h("TelescopePromptNormal", { fg = p.fg, bg = p.bg_alt })
			h("TelescopePromptBorder", { fg = p.comment, bg = p.bg_alt })
			h("TelescopeSelection", { fg = p.fg, bg = p.bg_active })
			h("TelescopeMatching", { fg = p.yellow, bold = true })

			-- nvim-cmp
			h("CmpItemAbbr", { fg = p.fg })
			h("CmpItemAbbrMatch", { fg = p.yellow, bold = true })
			h("CmpItemAbbrMatchFuzzy", { fg = p.yellow })
			h("CmpItemKind", { fg = p.comment })
			h("CmpItemMenu", { fg = p.fg_dim })

			-- Gitsigns
			h("GitSignsAdd", { fg = p.green })
			h("GitSignsChange", { fg = p.yellow })
			h("GitSignsDelete", { fg = p.red })

			-- indent-blankline
			h("IblIndent", { fg = p.bg_active })
			h("IblScope", { fg = p.comment })

			-- Treesitter context
			h("TreesitterContext", { bg = p.bg_alt })

			-- Mini.nvim statusline
			h("MiniStatuslineModeNormal", { fg = p.bg, bg = p.focus, bold = true })
			h("MiniStatuslineModeInsert", { fg = p.bg, bg = p.green, bold = true })
			h("MiniStatuslineModeVisual", { fg = p.bg, bg = p.yellow, bold = true })
			h("MiniStatuslineModeOther", { fg = p.bg, bg = p.comment, bold = true })
			h("MiniStatuslineFilename", { fg = p.fg, bg = p.bg_alt })
			h("MiniStatuslineFileinfo", { fg = p.comment, bg = p.bg_alt })
		end,
	},
}
