" Advanced Neovim colorscheme with 16 color palette and $colorN placeholders

if (has("termguicolors"))
  set termguicolors
endif

" Background and foreground
set background=dark
hi Normal guifg=#c0c3cc guibg=#0e0e16         " Bright text on dark background
hi NormalNC guifg=#7B869C guibg=#626578       " Non-current windows with soft color
hi Comment guifg=#86888e gui=italic            " Dimmed comments, italicized
hi CursorLine guibg=#597485                   " Highlighted line with moderate color
hi CursorColumn guibg=#70758B                 " Highlighted column with subtle color

" Line numbers and status line
hi LineNr guifg=#c0c3cc                       " Dimmed line numbers
hi CursorLineNr guifg=#c0c3cc guibg=#597485  " Current line number in bright color
hi StatusLine guibg=#877B82 guifg=#c0c3cc    " Active status line with clear contrast
hi StatusLineNC guibg=#877B82 guifg=#626578   " Inactive status line with softer colors

" Visual mode highlights with basic defaults
hi Visual guibg=#597485 guifg=#0e0e16        " Light selection for contrast
hi VisualNOS guibg=#877B82 guifg=#0e0e16      " Non-selected text in Visual mode

" Search highlights
hi Search guibg=#626578 guifg=#0e0e16         " Highlight searches with a vivid red
hi IncSearch guibg=#70758B guifg=#0e0e16     " Incremental search with vibrant yellow

" Error highlighting
hi Error guifg=#626578                        " Errors in bright red
hi ErrorMsg guibg=#626578 guifg=#c0c3cc      " Error messages with bright foreground
hi WarningMsg guifg=#70758B                   " Warning messages in yellow
hi MoreMsg guifg=#877B82                      " "More" messages with blue
hi NonText guifg=#c0c3cc                      " Non-text characters in dimmed color

" Syntax highlighting
hi Keyword guifg=#877B82                      " Keywords in bright cyan
hi Statement guifg=#7B869C                    " Statements in bright magenta
hi Function guifg=#7A99C0                     " Functions in light blue
hi Identifier guifg=#c0c3cc                   " Identifiers in standard white
hi Type guifg=#86888e                         " Types in light gray
hi PreProc guifg=#626578                      " Preprocessors in light red
hi Constant guifg=#597485                    " Constants in bright green
hi Special guifg=#70758B                     " Special elements in bright yellow
hi Operator guifg=#877B82                    " Operators in bright purple
hi Title guifg=#7B869C                       " Titles in bright orange
hi SpecialKey guifg=#7A99C0                  " Special keys in bright blue
hi Underlined guifg=#c0c3cc gui=underline    " Underlined text in bright white

" String and characters
hi String guifg=#7B869C                      " Strings in orange
hi Character guifg=#7A99C0                   " Characters in teal
hi Number guifg=#c0c3cc                      " Numbers in bright white
hi Boolean guifg=#0e0e16                      " Booleans in dark black

" Diff mode highlighting
hi DiffAdd guibg=#597485 guifg=#c0c3cc       " Added lines in green
hi DiffChange guibg=#70758B guifg=#c0c3cc    " Changed lines in blue
hi DiffDelete guibg=#626578 guifg=#c0c3cc    " Deleted lines in red
hi DiffText guibg=#877B82 guifg=#c0c3cc      " Changed text in cyan

" Sign column
hi SignColumn guibg=#7B869C guifg=#7A99C0     " Signs in purple
hi Delimiters guifg=#c0c3cc                   " Delimiters in gray

" Filetype specific highlights
hi NvimTreeNormal guifg=#86888e guibg=#0e0e16  " Background and foreground for NvimTree
hi NvimTreeFolderName guifg=#626578           " Folder names with a bold color
hi NvimTreeFolderIcon guifg=#597485          " Folder icons color
hi NvimTreeIndentMarker guifg=#c0c3cc         " Indentation markers in gray

" Tab line highlights
hi TabLine guibg=#70758B guifg=#0e0e16       " Tab line with darker background
hi TabLineSel guibg=#877B82 guifg=#c0c3cc   " Selected tab in bright color
hi TabLineFill guibg=#7B869C guifg=#0e0e16   " Fill area of tab line (inactive)

" Pmenu (popup menu) highlights
hi Pmenu guibg=#7A99C0 guifg=#0e0e16         " Popup menu background and text color
hi PmenuSel guibg=#c0c3cc guifg=#0e0e16      " Selected item in popup menu
hi PmenuThumb guibg=#7A99C0                   " Scrollbar color in popup menus

" Additional customizations for a more dynamic appearance
hi VertSplit guifg=#86888e guibg=#0e0e16       " Vertical splits
hi StatusLineTerm guifg=#c0c3cc guibg=#597485 " Terminal status line with a bright highlight
hi FloatBorder guifg=#c0c3cc guibg=#86888e    " Floating windows' border color
hi NormalNC guifg=#c0c3cc guibg=#0e0e16        " Non-current windows' normal text and background

