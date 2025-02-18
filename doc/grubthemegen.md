# grubthemegen

This is grubthemegen manual which is written in ruby.
The library makes so quick and dynamic grub themes, you can modify elements as you want with in ruby infrastructure.

## Create new sample.

This example for just beginning.

```rb
require "grubthemegen"

theme = GrubTheme.new(title_text: "Init Title.")

theme.title_text = "Main Title."

text = theme.gen()

puts(text)
```

In this library, there are two types primary method, the first one is statics it's used for global properties and the other one is buffered properties, you can create a property directly as String but you need to use write2buf if you want to generate the theme text via gen method otherwise you can't see the that you have defined property.


# Also look.
- ["grub theme file format"](https://www.gnu.org/software/grub/manual/grub/html_node/Theme-file-format.html)
