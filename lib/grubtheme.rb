# Full ref: https://www.gnu.org/software/grub/manual/grub/html_node/Theme-file-format.html
# That's good start for now:
## https://github.com/Ste74/Grub2-Theme/blob/master/manj-grub/theme.txt
## singular: 
## 	- title_text, title_font, title_color, message_font, message_color,
##	- message_bg_color, desktop_image, desktop_color, terminal_box, terminal_font.
## multpile: boot_menu, image.

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
		@buf				= ""

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
			unless @title_text.nil?
				push("title-text: \"#{@title_text}\"")
			end

			unless @title_font.nil?
				push("title-font: \"#{@title_font}\"")
			end

			unless @title_color.nil?
				push("title-color: \"#{@title_color}\"")
			end

			unless @message_font.nil?
				push("message-font: \"#{@message_font}\"")
			end

			unless @message_color.nil?
				push("message-color: \"#{@message_color}\"")
			end

			unless @message_bg_color.nil?
				push("message-bg-color: \"#{@message_bg_color}\"")
			end

			unless @desktop_image.nil?
				push("desktop-image: \"#{@desktop_image}\"")
			end

			unless @desktop_color.nil?
				push("desktop-color: \"#{@desktop_color}\"")
			end

			unless @terminal_box.nil?
				push("terminal-box: \"#{@terminal_box}\"")
			end

			unless @terminal_font.nil?
				push("terminal-font: \"#{@terminal_font}\"")
			end

			@buf
		else
			raise("Required fields not yet met.")
		end
	end

	## This checkup is just for only required fields.
	private def checkup()
		ret = true

		if @title_text.nil?
			warn("title_text is required.", uplevel: 2)
			ret = false
		end

		ret
	end

	private def push(data)
		@buf += "#{data}\n"
	end
end
