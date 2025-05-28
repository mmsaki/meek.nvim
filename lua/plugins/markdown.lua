return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  config = function()
    local cmp = require("cmp")
    cmp.setup.filetype("markdown", {
      sources = cmp.config.sources({
        { name = "render-markdown" },
      }, {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }),
    })
    require("render-markdown").setup({
      enabled = true,
      render_modes = { "n", "c", "t" },
      max_file_size = 10.0,
      debounce = 100,
      -- | obsidian | mimic Obsidian UI                                          |
      -- | lazy     | will attempt to stay up to date with LazyVim configuration |
      -- | none     | does nothing                                               |
      preset = "none",
      log_level = "error",
      log_runtime = false,
      file_types = { "markdown" },
      ignore = function()
        return false
      end,
      change_events = {},
      injections = {
        gitcommit = {
          enabled = true,
          query = [[
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
        },
      },
      patterns = {
        markdown = {
          disable = true,
          directives = {
            { id = 17, name = "conceal_lines" },
            { id = 18, name = "conceal_lines" },
          },
        },
      },
      anti_conceal = {
        enabled = true,
        --   head_icon, head_background, head_border, code_language, code_background, code_border,
        --   dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
        ignore = {
          code_background = true,
          sign = true,
        },
        above = 0,
        below = 0,
      },
      padding = {
        highlight = "Normal",
      },
      latex = {
        enabled = true,
        render_modes = false,
        converter = "latex2text",
        highlight = "RenderMarkdownMath",
        -- | above | above latex block |
        -- | below | below latex block |
        position = "above",
        top_pad = 0,
        bottom_pad = 0,
      },
      on = {
        attach = function() end,
        initial = function() end,
        render = function() end,
        clear = function() end,
      },
      completions = {
        blink = { enabled = false },
        coq = { enabled = false },
        lsp = { enabled = false },
        filter = {
          callout = function()
            return true
          end,
          checkbox = function()
            return true
          end,
        },
      },
      heading = {
        enabled = false,
        render_modes = false,
        atx = false,
        setext = false,
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        -- | right   | '#'s are concealed and icon is appended to right side                          |
        -- | inline  | '#'s are concealed and icon is inlined on left side                            |
        -- | overlay | icon is left padded with spaces and inserted on left hiding any additional '#' |
        position = "right",
        signs = { "󰫎 " },
        -- | block | width of the heading text |
        -- | full  | full width of the window  |
        width = "full",
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = false,
        border_virtual = false,
        border_prefix = false,
        above = "▄",
        below = "▀",
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
        -- | pattern    | matched against the heading text @see :h lua-patterns |
        -- | icon       | optional override for the icon                        |
        -- | background | optional override for the background                  |
        -- | foreground | optional override for the foreground                  |
        custom = {},
      },
      paragraph = {
        enabled = true,
        render_modes = false,
        left_margin = 0,
        indent = 0,
        min_width = 0,
      },
      code = {
        enabled = true,
        render_modes = false,
        sign = true,
        -- | none     | disables all rendering                                                    |
        -- | normal   | highlight group to code blocks & inline code, adds padding to code blocks |
        -- | language | language icon to sign column if enabled and icon + name above code blocks |
        -- | full     | normal + language                                                         |
        style = "full",
        -- | right | right side of code block |
        -- | left  | left side of code block  |
        position = "left",
        language_pad = 0,
        language_icon = true,
        language_name = true,
        disable_background = { "diff" },
        -- | block | width of the code block  |
        -- | full  | full width of the window |
        width = "full",
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        -- | none  | do not render a border                               |
        -- | thick | use the same highlight as the code body              |
        -- | thin  | when lines are empty overlay the above & below icons |
        -- | hide  | conceal lines unless language name or icon is added  |
        border = "hide",
        above = "▄",
        below = "▀",
        inline_left = "",
        inline_right = "",
        inline_pad = 0,
        highlight = "RenderMarkdownCode",
        highlight_language = nil,
        highlight_border = "RenderMarkdownCodeBorder",
        highlight_fallback = "RenderMarkdownCodeFallback",
        highlight_inline = "RenderMarkdownCodeInline",
      },
      dash = {
        enabled = true,
        render_modes = false,
        icon = "─",
        width = "full",
        left_margin = 0,
        highlight = "RenderMarkdownDash",
      },
      document = {
        enabled = true,
        render_modes = false,
        conceal = {
          char_patterns = {},
          line_patterns = {},
        },
      },
      bullet = {
        enabled = true,
        render_modes = false,
        icons = { "●", "○", "◆", "◇" },
        ordered_icons = function(ctx)
          local value = vim.trim(ctx.value)
          local index = tonumber(value:sub(1, #value - 1))
          return ("%d."):format(index > 1 and index or ctx.index)
        end,
        left_pad = 0,
        right_pad = 0,
        highlight = "RenderMarkdownBullet",
        scope_highlight = {},
      },
      checkbox = {
        enabled = true,
        render_modes = false,
        bullet = false,
        right_pad = 1,
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = nil,
        },
        checked = {
          icon = "󰱒 ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil,
        },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        },
      },
      quote = {
        enabled = true,
        render_modes = false,
        icon = "▋",
        repeat_linebreak = false,
        highlight = {
          "RenderMarkdownQuote1",
          "RenderMarkdownQuote2",
          "RenderMarkdownQuote3",
          "RenderMarkdownQuote4",
          "RenderMarkdownQuote5",
          "RenderMarkdownQuote6",
        },
      },
      pipe_table = {
        enabled = true,
        render_modes = false,
        preset = "none",
        style = "full",
        -- | overlay | writes completely over the table, removing conceal behavior and highlights |
        -- | raw     | replaces only the '|' characters in each row, leaving the cells unmodified |
        -- | padded  | raw + cells are padded to maximum visual width for each column             |
        -- | trimmed | padded except empty space is subtracted from visual width calculation      |
        cell = "padded",
        padding = 1,
        min_width = 0,
        border = {
          "┌",
          "┬",
          "┐",
          "├",
          "┼",
          "┤",
          "└",
          "┴",
          "┘",
          "│",
          "─",
        },
        border_virtual = false,
        alignment_indicator = "━",
        head = "RenderMarkdownTableHead",
        row = "RenderMarkdownTableRow",
        filler = "RenderMarkdownTableFill",
      },
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo", category = "github" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess", category = "github" },
        important = {
          raw = "[!IMPORTANT]",
          rendered = "󰅾 Important",
          highlight = "RenderMarkdownHint",
          category = "github",
        },
        warning = {
          raw = "[!WARNING]",
          rendered = "󰀪 Warning",
          highlight = "RenderMarkdownWarn",
          category = "github",
        },
        caution = {
          raw = "[!CAUTION]",
          rendered = "󰳦 Caution",
          highlight = "RenderMarkdownError",
          category = "github",
        },
        -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
        abstract = {
          raw = "[!ABSTRACT]",
          rendered = "󰨸 Abstract",
          highlight = "RenderMarkdownInfo",
          category = "obsidian",
        },
        summary = {
          raw = "[!SUMMARY]",
          rendered = "󰨸 Summary",
          highlight = "RenderMarkdownInfo",
          category = "obsidian",
        },
        tldr = { raw = "[!TLDR]", rendered = "󰨸 Tldr", highlight = "RenderMarkdownInfo", category = "obsidian" },
        info = { raw = "[!INFO]", rendered = "󰋽 Info", highlight = "RenderMarkdownInfo", category = "obsidian" },
        todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo", category = "obsidian" },
        hint = { raw = "[!HINT]", rendered = "󰌶 Hint", highlight = "RenderMarkdownSuccess", category = "obsidian" },
        success = {
          raw = "[!SUCCESS]",
          rendered = "󰄬 Success",
          highlight = "RenderMarkdownSuccess",
          category = "obsidian",
        },
        check = {
          raw = "[!CHECK]",
          rendered = "󰄬 Check",
          highlight = "RenderMarkdownSuccess",
          category = "obsidian",
        },
        done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess", category = "obsidian" },
        question = {
          raw = "[!QUESTION]",
          rendered = "󰘥 Question",
          highlight = "RenderMarkdownWarn",
          category = "obsidian",
        },
        help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn", category = "obsidian" },
        faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn", category = "obsidian" },
        attention = {
          raw = "[!ATTENTION]",
          rendered = "󰀪 Attention",
          highlight = "RenderMarkdownWarn",
          category = "obsidian",
        },
        failure = {
          raw = "[!FAILURE]",
          rendered = "󰅖 Failure",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError", category = "obsidian" },
        missing = {
          raw = "[!MISSING]",
          rendered = "󰅖 Missing",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        danger = {
          raw = "[!DANGER]",
          rendered = "󱐌 Danger",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError", category = "obsidian" },
        bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError", category = "obsidian" },
        example = {
          raw = "[!EXAMPLE]",
          rendered = "󰉹 Example",
          highlight = "RenderMarkdownHint",
          category = "obsidian",
        },
        quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote", category = "obsidian" },
        cite = { raw = "[!CITE]", rendered = "󱆨 Cite", highlight = "RenderMarkdownQuote", category = "obsidian" },
      },
      link = {
        enabled = true,
        render_modes = false,
        footnote = {
          enabled = true,
          superscript = true,
          prefix = "",
          suffix = "",
        },
        image = "󰥶 ",
        email = "󰀓 ",
        hyperlink = "󰌹 ",
        highlight = "RenderMarkdownLink",
        wiki = {
          icon = "󱗖 ",
          body = function()
            return nil
          end,
          highlight = "RenderMarkdownWikiLink",
        },
        custom = {
          web = { pattern = "^http", icon = "󰖟 " },
          discord = { pattern = "discord%.com", icon = "󰙯 " },
          github = { pattern = "github%.com", icon = "󰊤 " },
          gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
          google = { pattern = "google%.com", icon = "󰊭 " },
          neovim = { pattern = "neovim%.io", icon = " " },
          reddit = { pattern = "reddit%.com", icon = "󰑍 " },
          stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
          wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
          youtube = { pattern = "youtube%.com", icon = "󰗃 " },
        },
      },
      sign = {
        enabled = true,
        highlight = "RenderMarkdownSign",
      },
      inline_highlight = {
        enabled = true,
        render_modes = false,
        highlight = "RenderMarkdownInlineHighlight",
      },
      indent = {
        enabled = false,
        render_modes = false,
        per_level = 2,
        skip_level = 1,
        skip_heading = false,
        icon = "▎",
        highlight = "RenderMarkdownIndent",
      },
      html = {
        enabled = true,
        render_modes = false,
        comment = {
          conceal = true,
          text = nil,
          highlight = "RenderMarkdownHtmlComment",
        },
        tag = {},
      },
      win_options = {
        -- @see :h 'conceallevel'
        conceallevel = {
          default = vim.o.conceallevel,
          rendered = 3,
        },
        -- @see :h 'concealcursor'
        concealcursor = {
          default = vim.o.concealcursor,
          rendered = "",
        },
      },
      overrides = {
        buflisted = {},
        buftype = {
          nofile = {
            render_modes = true,
            padding = { highlight = "NormalFloat" },
            sign = { enabled = false },
          },
        },
        filetype = {},
      },
      custom_handlers = {
        -- @see [Custom Handlers](doc/custom-handlers.md)
      },
    })
  end,
}
