import catppuccin

config.load_autoconfig()

# set the flavor you'd like to use
# valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
# last argument (optional, default is False): enable the plain look for the menu rows
catppuccin.setup(c, 'mocha', True)


config.set("colors.webpage.darkmode.enabled", True)
c.fonts.tabs.selected = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.tabs.unselected = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.tooltip = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.statusbar = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.downloads = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.contextmenu = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.keyhint = '14pt InconsolataLGCNerdFont-Regular'
c.fonts.hints = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.completion.category = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.completion.entry = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.prompts = '12pt InconsolataLGCNerdFont-Regular'
c.fonts.default_family = [
    '12pt InconsolataLGCNerdFont-Regular', 
    '12pt InconsolataLGCNerdFont-Bold'
    '12pt InconsolataLGCNerdFont-Italic'
    '12pt InconsolataLGCNerdFont-BoldItalic'
]
c.tabs.show = "never"
