# Qutebrowser config

c.aliases['h'] = 'help'
c.aliases['H'] = 'help -t'

c.auto_save.session = True

# Add named search engine ddg for DuckDuckGo
c.url.searchengines['ddg'] = c.url.searchengines['DEFAULT']

# Add shortcuts for searching DuckDuckGo
config.bind('so', 'set-cmd-text -s :open ddg')
config.bind('sO', 'set-cmd-text -s :open -t ddg')

# Auto search is redundant now
c.url.auto_search = 'never'

# Bindings for adblock whitelist
config.bind('tbh', 'config-cycle -p -t -u *://{url:host}/* content.host_blocking.enabled ;; reload')
config.bind('tbH', 'config-cycle -p -t -u *://*.{url:host}/* content.host_blocking.enabled ;; reload')
config.bind('tBh', 'config-cycle -p -u *://{url:host}/* content.host_blocking.enabled ;; reload')
config.bind('tBH', 'config-cycle -p -u *://*.{url:host}/* content.host_blocking.enabled ;; reload')

# Use vertical tabs
c.tabs.position = 'left'
c.tabs.width = '10%'

# Put new tabs near the current tab
c.tabs.new_position.unrelated = 'next'

# Hints
c.hints.mode = 'number'
c.hints.auto_follow = 'full-match'

c.content.pdfjs = True

# Use user agent of upstream browser (Chromium) to reduce fingerprinting and
# compatibility issues
c.content.headers.user_agent = (
    'Mozilla/5.0 ({os_info}) '
    'AppleWebKit/{webkit_version} (KHTML, like Gecko) '
    '{upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'
)

c.editor.command = ['xterm', '-e', 'vim', '{file}', '-c',
                    'normal {line}G{column0}l']

config.load_autoconfig()
