" Advanced Neovim colorscheme with 16 color palette and $colorN placeholders

if (has("termguicolors"))
  set termguicolors
endif

" Background and foreground
set background=dark
hi Normal guifg=#c0c0c1 guibg=#030409         " Bright text on dark background
hi NormalNC guifg=#6FFBFD guibg=#be1e39       " Non-current windows with soft color
hi Comment guifg=#535366 gui=italic            " Dimmed comments, italicized
hi CursorLine guibg=#09516e                   " Highlighted line with moderate color
hi CursorColumn guibg=#b74f6c                 " Highlighted column with subtle color

" Line numbers and status line
hi LineNr guifg=#888c94                       " Dimmed line numbers
hi CursorLineNr guifg=#c0c0c1 guibg=#09516e  " Current line number in bright color
hi StatusLine guibg=#0d889e guifg=#c0c0c1    " Active status line with clear contrast
hi StatusLineNC guibg=#12B6D3 guifg=#FE294C   " Inactive status line with softer colors

" Visual mode highlights with basic defaults
hi Visual guibg=#0D6C93 guifg=#030409        " Light selection for contrast
hi VisualNOS guibg=#0d889e guifg=#030409      " Non-selected text in Visual mode

" Search highlights
hi Search guibg=#FE294C guifg=#030409         " Highlight searches with a vivid red
hi IncSearch guibg=#F46A91 guifg=#030409     " Incremental search with vibrant yellow

" Error highlighting
hi Error guifg=#be1e39                        " Errors in bright red
hi ErrorMsg guibg=#be1e39 guifg=#c0c0c1      " Error messages with bright foreground
hi WarningMsg guifg=#b74f6c                   " Warning messages in yellow
hi MoreMsg guifg=#12B6D3                      " "More" messages with blue
hi NonText guifg=#888c94                      " Non-text characters in dimmed color

" Syntax highlighting
hi Keyword guifg=#0d889e                      " Keywords in bright cyan
hi Statement guifg=#53bcbd                    " Statements in bright magenta
hi Function guifg=#61bfbe                     " Functions in light blue
hi Identifier guifg=#888c94                   " Identifiers in standard white
hi Type guifg=#535366                         " Types in light gray
hi PreProc guifg=#FE294C                      " Preprocessors in light red
hi Constant guifg=#0D6C93                    " Constants in bright green
hi Special guifg=#F46A91                     " Special elements in bright yellow
hi Operator guifg=#12B6D3                    " Operators in bright purple
hi Title guifg=#6FFBFD                       " Titles in bright orange
hi SpecialKey guifg=#82FFFE                  " Special keys in bright blue
hi Underlined guifg=#c0c0c1 gui=underline    " Underlined text in bright white

" String and characters
hi String guifg=#6FFBFD                      " Strings in orange
hi Character guifg=#82FFFE                   " Characters in teal
hi Number guifg=#c0c0c1                      " Numbers in bright white
hi Boolean guifg=#030409                      " Booleans in dark black

" Diff mode highlighting
hi DiffAdd guibg=#09516e guifg=#c0c0c1       " Added lines in green
hi DiffChange guibg=#b74f6c guifg=#c0c0c1    " Changed lines in blue
hi DiffDelete guibg=#be1e39 guifg=#c0c0c1    " Deleted lines in red
hi DiffText guibg=#0d889e guifg=#c0c0c1      " Changed text in cyan

" Sign column
hi SignColumn guibg=$background guifg=#09516e     " Signs in purple
hi Delimiters guifg=#888c94                   " Delimiters in gray

" Filetype specific highlights
hi NvimTreeNormal guifg=#535366 guibg=#030409  " Background and foreground for NvimTree
hi NvimTreeFolderName guifg=#FE294C           " Folder names with a bold color
hi NvimTreeFolderIcon guifg=#0D6C93          " Folder icons color
hi NvimTreeIndentMarker guifg=#888c94         " Indentation markers in gray

" Tab line highlights
hi TabLine guibg=#F46A91 guifg=#030409       " Tab line with darker background
hi TabLineSel guibg=#12B6D3 guifg=#c0c0c1   " Selected tab in bright color
hi TabLineFill guibg=#6FFBFD guifg=#030409   " Fill area of tab line (inactive)

" Pmenu (popup menu) highlights
hi Pmenu guibg=#82FFFE guifg=#030409         " Popup menu background and text color
hi PmenuSel guibg=#c0c0c1 guifg=#030409      " Selected item in popup menu
hi PmenuThumb guibg=#61bfbe                   " Scrollbar color in popup menus

" Additional customizations for a more dynamic appearance
hi VertSplit guifg=#535366 guibg=#030409       " Vertical splits
hi StatusLineTerm guifg=#c0c0c1 guibg=#09516e " Terminal status line with a bright highlight
hi FloatBorder guifg=#c0c0c1 guibg=#535366    " Floating windows' border color
hi NormalNC guifg=#888c94 guibg=#030409        " Non-current windows' normal text and background

