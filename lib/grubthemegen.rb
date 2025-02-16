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
		title_text: 		nil,
		title_font:			nil,
		title_color: 		nil,
		message_font: 		nil,
		message_color: 		nil,
		message_bg_color:	nil,
		desktop_image:		nil,
		desktop_color:		nil,
		terminal_box:		nil,
		terminal_font:		nil
	)
		@buf				= ""
		@bufcomp			= ""

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

	# Components.
	## Label.
	def label(text: nil, font: nil, color: nil, align: nil, visible: nil, **kwargs)
		if nil_var?(*text, *font, *color, *align, *visible, **kwargs)
			buf = "+ label {\n"
			# text, font, color, align, visible
			buf += single_property(val: text, key: "text", bracets:	true)
			buf += single_property(val: font, key: "font", bracets: true)
			buf += single_property(val: color, key: "color", bracets: true)
			buf += single_property(val: align, key: "align", bracets: true)
			buf += single_property(val: visible, key: "visible", bracets: false)
			buf += common_properties(**kwargs)
			buf += "}\n"

			@bufcomp += buf
		else
			warn("no parameter(s) given, so nothing to do..", uplevel: 1)
		end
	end

	## Image.
	def image(file: nil, **kwargs)
		# "file" field is required for this property.
		unless file.nil?
			buf = "+ image {\n"
			buf += single_property(val: file, key: "file", bracets: true)
			buf += common_properties(**kwargs)
			buf += "}\n"

			@bufcomp += buf
		else
			warn("\"file\" is required for this component.", uplevel: 1)
		end
	end

	## Progress bar.

	## Circular progress.

	## Boot menu.

	# Generate.
	def gen()
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

		if @bufcomp != ""
			@buf += @bufcomp
		end

		@buf
	end

	private def nil_var?(*args, **kwargs)
		ret = false
		args.each { |i|
			unless i.nil?
				ret = true
			end
		}
		kwargs.each { |i|
			unless i.nil?
				ret = true
			end
		}

		ret
	end

	private def single_property(val: nil, key: nil, bracets: false)
		unless val.nil?
			if bracets
				"\t#{key} = \"#{val}\"\n"
			else
				"\t#{key} = #{val}\n"
			end
		else
			""
		end
	end

	private def common_properties(**kwargs)
		# left, top, width, height, id
		buf = ""
		unless (kwargs[:left]).nil?
			buf += "\tleft = #{kwargs[:left]}\n"
		end

		unless (kwargs[:top]).nil?
			buf += "\ttop = #{kwargs[:top]}\n"
		end

		unless (kwargs[:width]).nil?
			buf += "\twidth = #{kwargs[:width]}\n"
		end

		unless (kwargs[:height]).nil?
			buf += "\theight = #{kwargs[:height]}\n"
		end

		unless (kwargs[:id]).nil?
			buf += "\tid = \"#{kwargs[:id]}\"\n"
		end

		buf
	end

	private def push(data)
		@buf += "#{data}\n"
	end
end
