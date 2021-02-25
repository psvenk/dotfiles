# Qutebrowser config

# Sessions
c.auto_save.session = True
c.session.lazy_restore = True

# Tabs
c.tabs.position = 'left'
c.tabs.width = 200

c.tabs.new_position.unrelated = 'next'
c.tabs.background = True

# Hints
c.hints.mode = 'number'
c.hints.auto_follow = 'full-match'

c.content.pdfjs = True

c.content.javascript.enabled = False
c.content.javascript.can_access_clipboard = True

# Use user agent of upstream browser (Chromium) {{{
# to reduce fingerprinting and compatibility issues
c.content.headers.user_agent = (
    'Mozilla/5.0 ({os_info}) '
    'AppleWebKit/{webkit_version} (KHTML, like Gecko) '
    '{upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}'
)
# }}}

c.editor.command = ['xterm', '-e', 'vim', '{file}', '-c',
                    'normal {line}G{column0}l']

# Search {{{
c.url.searchengines['ddg'] = c.url.searchengines['DEFAULT']

c.url.auto_search = 'never'
c.url.open_base_url = True

config.bind('so', 'set-cmd-text -s :open -- ddg')
config.bind('sO', 'set-cmd-text -s :open -t -- ddg')

config.bind('spp', 'open -- ddg {clipboard}')
config.bind('spP', 'open -- ddg {primary}')
config.bind('sPp', 'open -t -- ddg {clipboard}')
config.bind('sPP', 'open -t -- ddg {primary}')
# }}}

# Bindings for controlling adblock whitelist {{{
config.bind('tbh', 'config-cycle -p -t -u *://{url:host}/* content.host_blocking.enabled ;; reload')
config.bind('tbH', 'config-cycle -p -t -u *://*.{url:host}/* content.host_blocking.enabled ;; reload')
config.bind('tBh', 'config-cycle -p -u *://{url:host}/* content.host_blocking.enabled ;; reload')
config.bind('tBH', 'config-cycle -p -u *://*.{url:host}/* content.host_blocking.enabled ;; reload')
# }}}

# Aliases {{{

# Wayback Machine {{{
c.aliases['wayback']      = 'spawn -u archive -t lookup wayback'
c.aliases['wayback!']     = 'spawn -u archive    lookup wayback'
c.aliases['waybacksave']  = 'spawn -u archive -b save   wayback'
c.aliases['waybacksave!'] = 'spawn -u archive    save   wayback'

c.aliases['wb']   = c.aliases['wayback']
c.aliases['wb!']  = c.aliases['wayback!']
c.aliases['wbs']  = c.aliases['waybacksave']
c.aliases['wbs!'] = c.aliases['waybacksave!']
# }}}

# archive.today {{{
c.aliases['archive']      = 'spawn -u archive -t lookup archive.today'
c.aliases['archive!']     = 'spawn -u archive    lookup archive.today'
c.aliases['archivesave']  = 'spawn -u archive -b save   archive.today'
c.aliases['archivesave!'] = 'spawn -u archive    save   archive.today'

c.aliases['ar']   = c.aliases['archive']
c.aliases['ar!']  = c.aliases['archive!']
c.aliases['ars']  = c.aliases['archivesave']
c.aliases['ars!'] = c.aliases['archivesave!']
# }}}

# Invidious {{{
c.aliases['invidious'] = 'spawn -u invidious'
c.aliases['inv']       = c.aliases['invidious']
# }}}

c.aliases['newtab'] = 'open -t about:blank'
c.aliases['nt']     = c.aliases['newtab']

c.aliases['h']    = 'help'
c.aliases['Help'] = 'help -t'
c.aliases['H']    = c.aliases['Help']

# }}}

config.load_autoconfig()

# vim: set fdm=marker:
