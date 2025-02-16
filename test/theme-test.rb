require "grubthemegen"

# örn: theme.push(theme.vbox(teheme.label(id: "__timeout__")))
# örn: theme.push(theme.label(text: "hello"))

theme = GrubTheme.new()

theme.title_text = "Lazy Grub"
theme.title_font = "Ubuntu Regular"
theme.title_color = "#ffffff"
theme.message_color = "#000000"
theme.message_bg_color = "#000000"
theme.desktop_color = "#2857a8"
theme.terminal_font = "Ubuntu Regular"

theme.label(text: "hello", id: "__timeout__")
theme.label() # Null label (it won't be processed).

theme.image(file: "merhaba.png", id: "merhaba")
theme.image(file: "deneme.png")
theme.progress_bar()

theme.deneme(theme.label(id: "test"))

puts(theme.gen())
