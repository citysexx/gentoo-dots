" Advanced Neovim colorscheme with 16 color palette and $colorN placeholders

if (has("termguicolors"))
  set termguicolors
endif

" Background and foreground
set background=dark
hi Normal guifg=#bfc1cb guibg=#0d0d15         " Bright text on dark background
hi NormalNC guifg=#7E8199 guibg=#515468       " Non-current windows with soft color
hi Comment guifg=#85878e gui=italic            " Dimmed comments, italicized
hi CursorLine guibg=#5E6176                   " Highlighted line with moderate color
hi CursorColumn guibg=#63667B                 " Highlighted column with subtle color

" Line numbers and status line
hi LineNr guifg=#bfc1cb                       " Dimmed line numbers
hi CursorLineNr guifg=#bfc1cb guibg=#5E6176  " Current line number in bright color
hi StatusLine guibg=#70738A guifg=#bfc1cb    " Active status line with clear contrast
hi StatusLineNC guibg=#70738A guifg=#515468   " Inactive status line with softer colors

" Visual mode highlights with basic defaults
hi Visual guibg=#5E6176 guifg=#0d0d15        " Light selection for contrast
hi VisualNOS guibg=#70738A guifg=#0d0d15      " Non-selected text in Visual mode

" Search highlights
hi Search guibg=#515468 guifg=#0d0d15         " Highlight searches with a vivid red
hi IncSearch guibg=#63667B guifg=#0d0d15     " Incremental search with vibrant yellow

" Error highlighting
hi Error guifg=#515468                        " Errors in bright red
hi ErrorMsg guibg=#515468 guifg=#bfc1cb      " Error messages with bright foreground
hi WarningMsg guifg=#63667B                   " Warning messages in yellow
hi MoreMsg guifg=#70738A                      " "More" messages with blue
hi NonText guifg=#bfc1cb                      " Non-text characters in dimmed color

" Syntax highlighting
hi Keyword guifg=#70738A                      " Keywords in bright cyan
hi Statement guifg=#7E8199                    " Statements in bright magenta
hi Function guifg=#8F90AA                     " Functions in light blue
hi Identifier guifg=#bfc1cb                   " Identifiers in standard white
hi Type guifg=#85878e                         " Types in light gray
hi PreProc guifg=#515468                      " Preprocessors in light red
hi Constant guifg=#5E6176                    " Constants in bright green
hi Special guifg=#63667B                     " Special elements in bright yellow
hi Operator guifg=#70738A                    " Operators in bright purple
hi Title guifg=#7E8199                       " Titles in bright orange
hi SpecialKey guifg=#8F90AA                  " Special keys in bright blue
hi Underlined guifg=#bfc1cb gui=underline    " Underlined text in bright white

" String and characters
hi String guifg=#7E8199                      " Strings in orange
hi Character guifg=#8F90AA                   " Characters in teal
hi Number guifg=#bfc1cb                      " Numbers in bright white
hi Boolean guifg=#0d0d15                      " Booleans in dark black

" Diff mode highlighting
hi DiffAdd guibg=#5E6176 guifg=#bfc1cb       " Added lines in green
hi DiffChange guibg=#63667B guifg=#bfc1cb    " Changed lines in blue
hi DiffDelete guibg=#515468 guifg=#bfc1cb    " Deleted lines in red
hi DiffText guibg=#70738A guifg=#bfc1cb      " Changed text in cyan

" Sign column
hi SignColumn guibg=#7E8199 guifg=#8F90AA     " Signs in purple
hi Delimiters guifg=#bfc1cb                   " Delimiters in gray

" Filetype specific highlights
hi NvimTreeNormal guifg=#85878e guibg=#0d0d15  " Background and foreground for NvimTree
hi NvimTreeFolderName guifg=#515468           " Folder names with a bold color
hi NvimTreeFolderIcon guifg=#5E6176          " Folder icons color
hi NvimTreeIndentMarker guifg=#bfc1cb         " Indentation markers in gray

" Tab line highlights
hi TabLine guibg=#63667B guifg=#0d0d15       " Tab line with darker background
hi TabLineSel guibg=#70738A guifg=#bfc1cb   " Selected tab in bright color
hi TabLineFill guibg=#7E8199 guifg=#0d0d15   " Fill area of tab line (inactive)

" Pmenu (popup menu) highlights
hi Pmenu guibg=#8F90AA guifg=#0d0d15         " Popup menu background and text color
hi PmenuSel guibg=#bfc1cb guifg=#0d0d15      " Selected item in popup menu
hi PmenuThumb guibg=#8F90AA                   " Scrollbar color in popup menus

" Additional customizations for a more dynamic appearance
hi VertSplit guifg=#85878e guibg=#0d0d15       " Vertical splits
hi StatusLineTerm guifg=#bfc1cb guibg=#5E6176 " Terminal status line with a bright highlight
hi FloatBorder guifg=#bfc1cb guibg=#85878e    " Floating windows' border color
hi NormalNC guifg=#bfc1cb guibg=#0d0d15        " Non-current windows' normal text and background

