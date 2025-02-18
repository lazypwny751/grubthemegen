# grubthemegen
Simple ruby library for generate cool GNU/Grub theme files.

# Installation.
## From source.
```sh

```

## Or via gem.
```sh
gem install grubthemegen
# for uninstall.
gem uninstall grubthemegen
```

# Usage
Here is a sample, you can use that gnu grub file format components and properties.
```rb
require "grubthemegen"

theme = GrubTheme.new(title_text: "Init Title.")

theme.title_text = "Main Title."
theme.push(
	theme.label(
		text: %x(printf "%s" $(grub-install --version))
	)
)

text = theme.gen()

puts(text)
```


# Also look.
- [ref](https://www.gnu.org/software/grub/manual/grub/html_node/Theme-file-format.html)


# Contributing.
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

# License
[GPL3](https://choosealicense.com/licenses/gpl-3.0/)
