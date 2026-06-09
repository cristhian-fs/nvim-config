local M = {}

function M.apply()
  local hl = vim.api.nvim_set_hl

  local function h(group, opts)
    hl(0, group, opts)
  end

  local p = {
    bg = "#282725",
    bg_alt = "#22211F",
    selection = "#3a3835",
    comment = "#6B6259",
    fg_dim = "#8D867F",
    fg = "#C4B9AD",
    fg_bright = "#D4C9BD",
    white = "#ffffff",
    orange = "#C97042",
    orange2 = "#F0813D",
    red = "#F9615E",
    green = "#98c379",
    cyan = "#61aeee",
    purple = "#c678dd",
    yellow = "#ffcc2a",
    none = "NONE",
  }

  -- ===========================================================================
  -- EDITOR BASE
  -- ===========================================================================
  h("Normal", { fg = p.fg, bg = p.bg })
  h("NormalFloat", { fg = p.fg, bg = p.bg_alt })
  h("NormalNC", { fg = p.fg_dim, bg = p.bg })
  h("FloatBorder", { fg = p.comment, bg = p.bg_alt })

  h("LineNr", { fg = p.comment })
  h("CursorLine", { bg = p.selection })
  h("CursorLineNr", { fg = p.fg_dim, bg = p.selection })
  h("CursorColumn", { bg = p.selection })

  h("Visual", { bg = p.selection })
  h("VisualNOS", { bg = p.selection })

  h("Search", { fg = p.bg, bg = p.orange })
  h("IncSearch", { fg = p.bg, bg = p.orange2 })
  h("CurSearch", { fg = p.bg, bg = p.orange2 })

  h("StatusLine", { fg = p.fg_dim, bg = p.bg_alt })
  h("StatusLineNC", { fg = p.comment, bg = p.bg_alt })
  h("WinSeparator", { fg = p.selection })
  h("VertSplit", { fg = p.selection })

  h("Pmenu", { fg = p.fg, bg = p.bg_alt })
  h("PmenuSel", { fg = p.fg, bg = p.selection, bold = true })
  h("PmenuSbar", { bg = p.bg_alt })
  h("PmenuThumb", { bg = p.comment })

  h("TabLine", { fg = p.comment, bg = p.bg_alt })
  h("TabLineSel", { fg = p.fg, bg = p.bg })
  h("TabLineFill", { bg = p.bg_alt })

  h("SignColumn", { fg = p.comment, bg = p.bg })
  h("FoldColumn", { fg = p.comment, bg = p.bg })
  h("Folded", { fg = p.comment, bg = p.selection })

  h("MatchParen", { fg = p.orange2, bold = true, underline = true })
  h("NonText", { fg = p.selection })
  h("SpecialKey", { fg = p.selection })
  h("Whitespace", { fg = p.selection })
  h("EndOfBuffer", { fg = p.selection })

  h("Directory", { fg = p.orange })
  h("WildMenu", { fg = p.bg, bg = p.orange })
  h("Title", { fg = p.orange, bold = true })

  h("DiffAdd", { fg = p.green, bg = p.bg })
  h("DiffChange", { fg = p.orange, bg = p.bg })
  h("DiffDelete", { fg = p.red, bg = p.bg })
  h("DiffText", { fg = p.orange, bg = p.selection })

  h("SpellBad", { sp = p.red, undercurl = true })
  h("SpellCap", { sp = p.orange, undercurl = true })
  h("SpellRare", { sp = p.cyan, undercurl = true })
  h("SpellLocal", { sp = p.green, undercurl = true })

  -- ===========================================================================
  -- SINTAXE CLÁSSICA (fallback sem treesitter)
  -- ===========================================================================
  h("Comment", { fg = p.comment, italic = true })
  h("String", { fg = p.green })
  h("Character", { fg = p.green })
  h("Number", { fg = p.orange2 })
  h("Float", { fg = p.orange2 })
  h("Boolean", { fg = p.orange2 })

  h("Keyword", { fg = p.purple }) -- const, let, var, if, for...
  h("Statement", { fg = p.purple })
  h("Conditional", { fg = p.purple })
  h("Repeat", { fg = p.purple })
  h("Exception", { fg = p.purple }) -- try, catch, throw
  h("Include", { fg = p.orange2 }) -- import, require, export
  h("Define", { fg = p.purple })
  h("Macro", { fg = p.purple })
  h("PreProc", { fg = p.purple })
  h("PreCondit", { fg = p.purple })

  h("Identifier", { fg = p.red }) -- variáveis
  h("Function", { fg = p.cyan }) -- nomes de função
  h("Type", { fg = p.purple }) -- tipos
  h("StorageClass", { fg = p.purple }) -- var/let/const (fallback vimscript)
  h("Structure", { fg = p.purple })
  h("Typedef", { fg = p.purple })

  h("Constant", { fg = p.red })
  h("Special", { fg = p.fg })
  h("SpecialChar", { fg = p.orange2 })
  h("Tag", { fg = p.fg })
  h("Delimiter", { fg = p.fg }) -- { } ( ) [ ] ; ,
  h("SpecialComment", { fg = p.comment, italic = true })
  h("Debug", { fg = p.red })

  h("Underlined", { underline = true })
  h("Ignore", { fg = p.selection })
  h("Error", { fg = p.red })
  h("Todo", { fg = p.orange, italic = true })
  h("Operator", { fg = p.cyan }) -- = e variantes

  -- ===========================================================================
  -- TREESITTER
  -- ===========================================================================

  -- Comentários
  h("@comment", { fg = p.comment, italic = true })
  h("@comment.documentation", { fg = p.comment, italic = true })

  -- Strings
  h("@string", { fg = p.green })
  h("@string.escape", { fg = p.orange2 })
  h("@string.special", { fg = p.orange2 })
  h("@string.regex", { fg = p.orange2 })
  h("@string.special.url", { fg = p.cyan, underline = true })
  h("@string.special.symbol", { fg = p.fg }) -- símbolos/atoms

  -- Números
  h("@number", { fg = p.orange2 })
  h("@number.float", { fg = p.orange2 })
  h("@boolean", { fg = p.orange2 }) -- true / false

  -- -------------------------------------------------------------------------
  -- Keywords PURPLE: const, let, var, function, class, if, for, while, try...
  -- -------------------------------------------------------------------------
  h("@keyword", { fg = p.purple })
  h("@keyword.function", { fg = p.purple }) -- a palavra "function"
  h("@keyword.conditional", { fg = p.orange2 }) -- if / else / switch / case / default
  h("@keyword.conditional.ternary", { fg = p.purple }) -- ? :
  h("@keyword.repeat", { fg = p.purple }) -- for / while / do
  h("@keyword.exception", { fg = p.purple }) -- try / catch / finally / throw
  h("@keyword.operator", { fg = p.purple }) -- typeof / instanceof / void / delete / in / of
  h("@keyword.coroutine", { fg = p.purple }) -- async / await / yield
  h("@keyword.type", { fg = p.purple }) -- type / interface / enum (TS)
  h("@keyword.modifier", { fg = p.purple }) -- public / private / readonly / static / abstract

  -- -------------------------------------------------------------------------
  -- Keywords ORANGE2: import, export, return, new, this, super
  -- -------------------------------------------------------------------------
  h("@keyword.import", { fg = p.orange2 }) -- import / require
  h("@keyword.export", { fg = p.orange2 }) -- export
  h("@keyword.return", { fg = p.orange2 }) -- return
  h("@keyword.new", { fg = p.orange2 }) -- new (alguns parsers separam)

  -- -------------------------------------------------------------------------
  -- Variáveis RED
  -- -------------------------------------------------------------------------
  h("@variable", { fg = p.red })
  h("@variable.parameter", { fg = p.red }) -- parâmetros de função
  h("@variable.parameter.builtin", { fg = p.orange2 }) -- arguments (builtin)

  -- builtins especiais ORANGE2
  h("@variable.builtin", { fg = p.orange2 }) -- this / self / super / globalThis

  -- -------------------------------------------------------------------------
  -- Tipos PURPLE
  -- -------------------------------------------------------------------------
  h("@type", { fg = p.purple })
  h("@type.builtin", { fg = p.purple }) -- Array, Object, Promise, Map, Set...
  h("@type.qualifier", { fg = p.purple }) -- readonly, public enquanto qualificador
  h("@type.definition", { fg = p.purple }) -- lado esq de type Alias = ...

  -- -------------------------------------------------------------------------
  -- Constantes
  -- -------------------------------------------------------------------------
  h("@constant", { fg = p.red })
  h("@constant.builtin", { fg = p.orange2 }) -- null / undefined / NaN / Infinity
  h("@constant.macro", { fg = p.red })

  -- -------------------------------------------------------------------------
  -- Funções e métodos CYAN
  -- -------------------------------------------------------------------------
  h("@function", { fg = p.cyan }) -- definição de função nomeada
  h("@function.call", { fg = p.cyan }) -- chamada de função
  h("@function.builtin", { fg = p.cyan }) -- setTimeout, parseInt, fetch...
  h("@function.method", { fg = p.cyan }) -- definição de método
  h("@function.method.call", { fg = p.cyan }) -- chamada de método: obj.METHOD()
  h("@constructor", { fg = p.cyan }) -- new Foo() — o nome Foo

  -- -------------------------------------------------------------------------
  -- Propriedades e object keys FOREGROUND
  -- -------------------------------------------------------------------------
  h("@property", { fg = p.fg }) -- { key: value } / obj.prop
  h("@variable.member", { fg = p.fg }) -- obj.field (TS usa isso)
  h("@attribute", { fg = p.fg }) -- decorators / atributos
  h("@field", { fg = p.fg }) -- legacy treesitter

  -- -------------------------------------------------------------------------
  -- Operadores CYAN; pontuação/símbolos FOREGROUND
  -- -------------------------------------------------------------------------
  h("@operator", { fg = p.cyan }) -- = += -= *= /= === !== < > ...
  h("@punctuation.bracket", { fg = p.fg }) -- { } ( ) [ ]
  h("@punctuation.delimiter", { fg = p.fg }) -- , ; . ?.
  h("@punctuation.special", { fg = p.fg }) -- ${ } em template strings

  -- -------------------------------------------------------------------------
  -- Namespaces / módulos / labels FOREGROUND
  -- -------------------------------------------------------------------------
  h("@module", { fg = p.fg })
  h("@namespace", { fg = p.fg })
  h("@label", { fg = p.fg })

  -- Tags HTML/JSX
  h("@tag", { fg = p.orange })
  h("@tag.attribute", { fg = p.fg })
  h("@tag.delimiter", { fg = p.fg_dim })

  -- Markup (markdown)
  h("@markup.heading", { fg = p.orange, bold = true })
  h("@markup.strong", { bold = true })
  h("@markup.italic", { italic = true })
  h("@markup.link", { fg = p.cyan, underline = true })
  h("@markup.raw", { fg = p.green })

  -- ===========================================================================
  -- LSP SEMANTIC TOKENS
  -- Estes têm prioridade sobre treesitter — precisam espelhar tudo acima
  -- ===========================================================================

  -- Variáveis → red
  h("@lsp.type.variable", { fg = p.red })
  h("@lsp.type.parameter", { fg = p.red })

  -- Propriedades → foreground
  h("@lsp.type.property", { fg = p.fg })
  h("@lsp.type.enumMember", { fg = p.fg }) -- membros de enum são como props

  -- Funções e métodos → cyan
  h("@lsp.type.function", { fg = p.cyan })
  h("@lsp.type.method", { fg = p.cyan })

  -- Tipos → purple
  h("@lsp.type.class", { fg = p.yellow })
  h("@lsp.type.interface", { fg = p.purple })
  h("@lsp.type.type", { fg = p.purple })
  h("@lsp.type.typeParameter", { fg = p.purple })
  h("@lsp.type.enum", { fg = p.purple })
  h("@lsp.type.struct", { fg = p.purple })

  -- Outros → mapeados coerentemente
  h("@lsp.type.namespace", { fg = p.fg })
  h("@lsp.type.decorator", { fg = p.fg })
  h("@lsp.type.keyword", { fg = p.purple })
  h("@lsp.type.string", { fg = p.green })
  h("@lsp.type.number", { fg = p.orange2 })
  h("@lsp.type.comment", { fg = p.comment })
  h("@lsp.type.operator", { fg = p.cyan })
  h("@lsp.type.macro", { fg = p.red })

  -- -------------------------------------------------------------------------
  -- LSP Modifiers — refinam por contexto
  -- -------------------------------------------------------------------------
  h("@lsp.typemod.variable.defaultLibrary", { fg = p.orange2 }) -- globals builtin
  h("@lsp.typemod.variable.readonly", { fg = p.red })
  h("@lsp.typemod.variable.static", { fg = p.red })
  h("@lsp.typemod.function.declaration", { fg = p.cyan })
  h("@lsp.typemod.function.defaultLibrary", { fg = p.cyan })
  h("@lsp.typemod.method.declaration", { fg = p.cyan })
  h("@lsp.typemod.method.defaultLibrary", { fg = p.cyan })
  h("@lsp.typemod.property.declaration", { fg = p.fg })
  h("@lsp.typemod.property.readonly", { fg = p.fg })

  -- -------------------------------------------------------------------------
  -- JS/TS por linguagem (sobrescrevem os genéricos quando o LSP emite lang-specific)
  -- -------------------------------------------------------------------------
  h("@lsp.type.variable.javascript", { fg = p.red })
  h("@lsp.type.variable.typescript", { fg = p.red })
  h("@lsp.type.parameter.javascript", { fg = p.red })
  h("@lsp.type.parameter.typescript", { fg = p.red })
  h("@lsp.type.property.javascript", { fg = p.fg })
  h("@lsp.type.property.typescript", { fg = p.fg })
  h("@lsp.type.function.javascript", { fg = p.cyan })
  h("@lsp.type.function.typescript", { fg = p.cyan })
  h("@lsp.type.method.javascript", { fg = p.cyan })
  h("@lsp.type.method.typescript", { fg = p.cyan })
  h("@lsp.type.type.typescript", { fg = p.red })
  h("@lsp.type.interface.typescript", { fg = p.yellow })
  h("@lsp.type.class.typescript", { fg = p.yellow })
  h("@lsp.type.typeParameter.typescript", { fg = p.purple })
  h("@lsp.type.enum.typescript", { fg = p.purple })
  h("@lsp.type.enumMember.typescript", { fg = p.fg })
  h("@lsp.type.namespace.typescript", { fg = p.fg })

  -- ===========================================================================
  -- LSP DIAGNÓSTICOS
  -- ===========================================================================
  h("DiagnosticError", { fg = p.red })
  h("DiagnosticWarn", { fg = p.orange })
  h("DiagnosticInfo", { fg = p.cyan })
  h("DiagnosticHint", { fg = p.fg_dim })
  h("DiagnosticUnnecessary", { fg = p.comment })

  h("DiagnosticUnderlineError", { sp = p.red, undercurl = true })
  h("DiagnosticUnderlineWarn", { sp = p.orange, undercurl = true })
  h("DiagnosticUnderlineInfo", { sp = p.cyan, undercurl = true })
  h("DiagnosticUnderlineHint", { sp = p.comment, undercurl = true })

  h("LspReferenceText", { bg = p.selection })
  h("LspReferenceRead", { bg = p.selection })
  h("LspReferenceWrite", { bg = p.selection, bold = true })
  h("LspInlayHint", { fg = p.comment, italic = true })

  -- ===========================================================================
  -- PLUGINS COMUNS
  -- ===========================================================================

  -- Telescope
  h("TelescopeNormal", { fg = p.fg, bg = p.bg_alt })
  h("TelescopeBorder", { fg = p.comment, bg = p.bg_alt })
  h("TelescopePromptNormal", { fg = p.fg, bg = p.bg_alt })
  h("TelescopePromptBorder", { fg = p.comment, bg = p.bg_alt })
  h("TelescopeSelection", { fg = p.fg, bg = p.selection })
  h("TelescopeMatching", { fg = p.cyan, bold = true })

  -- nvim-cmp
  h("CmpItemAbbr", { fg = p.fg })
  h("CmpItemAbbrMatch", { fg = p.cyan, bold = true })
  h("CmpItemAbbrMatchFuzzy", { fg = p.cyan })
  h("CmpItemKind", { fg = p.fg_dim })
  h("CmpItemMenu", { fg = p.comment })

  -- Gitsigns
  h("GitSignsAdd", { fg = p.green })
  h("GitSignsChange", { fg = p.orange })
  h("GitSignsDelete", { fg = p.red })

  -- indent-blankline
  h("IblIndent", { fg = p.selection })
  h("IblScope", { fg = p.comment })

  -- Treesitter context
  h("TreesitterContext", { bg = p.bg_alt })

  -- Mini.nvim statusline
  h("MiniStatuslineModeNormal", { fg = p.bg, bg = p.fg_dim, bold = true })
  h("MiniStatuslineModeInsert", { fg = p.bg, bg = p.orange, bold = true })
  h("MiniStatuslineModeVisual", { fg = p.bg, bg = p.cyan, bold = true })
  h("MiniStatuslineModeOther", { fg = p.bg, bg = p.comment, bold = true })
  h("MiniStatuslineFilename", { fg = p.fg, bg = p.bg_alt })
  h("MiniStatuslineFileinfo", { fg = p.fg_dim, bg = p.bg_alt })
end

return M
