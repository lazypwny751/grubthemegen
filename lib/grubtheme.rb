# That's good start for now:
## https://github.com/Ste74/Grub2-Theme/blob/master/manj-grub/theme.txt
## singular: 
## 	- title_text, title_font, title_color, message_font, message_color,
##	- message_bg_color, desktop_image, desktop_color, terminal_box, terminal_font.
## multpile: 

# TODO: add call method for all public methods.

class GrubTheme
	def initialize(
		title_text			= nil,
		title_font			= nil,
		title_color			= nil,
		message_font		= nil,
		message_color		= nil,
		message_bg_color	= nil,
		desktop_image 		= nil,
		desktop_color 		= nil,
		terminal_box 		= nil,
		terminal_font 		= nil
	)
		@title_text 		= title_text
		@title_font 		= title_font
		@title_color 		= title_color
		@message_font 		= message_font
		@message_color 		= message_color
		@message_bg_color 	= message_bg_color
		@desktop_image 		= desktop_image
		@desktop_color 		= desktop_color
		@terminal_box 		= terminal_box		
		@terminal_font 		= terminal_font
	end

	# Path.
	def path=(path)
		@path = path
	end

	def path
		@path
	end

	# Title.
	## Title text.
	def title_text=(title_text)
		@title_text = title_text
	end

	## Title font.
	def title_font=(title_font)
		@title_font = title_font
	end

	## Title color.
	def title_color=(title_color)
		@title_color = title_color
	end

	# Message.
	## Message font.
	def message_font=(message_font)
		@message_font = message_font
	end

	## Message color.
	def message_color=(message_color)
		@message_color = message_color
	end

	## Message background color.
	def message_bg_color=(message_bg_color)
		@message_bg_color = message_bg_color
	end

	# Desktop.
	## Desktop image.
	def desktop_image=(desktop_image)
		@desktop_image = desktop_image
	end

	## Desktop color.
	def desktop_color=(desktop_color)
		@desktop_color = desktop_color
	end

	# Terminal.
	## Terminal box.
	def terminal_box=(terminal_box)
		@terminal_box = terminal_box
	end

	## Terminal font.
	def terminal_font=(terminal_font)
		@terminal_font = terminal_font
	end

	# Generate.
	def gen()
		if checkup()
			puts("Buildin..")
		else
			raise("Required fields not yet met.")
		end
	end

	## This checkup is just for only required fields.
	private def checkup()
		true
	end
end
