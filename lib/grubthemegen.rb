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
		unless nil_var?(*text, *font, *color, *align, *visible, **kwargs)
			buf = "+ label {\n"
			# text, font, color, align, visible
			buf += single_property(val: text, key: "text", bracets:	true)
			buf += single_property(val: font, key: "font", bracets: true)
			buf += single_property(val: color, key: "color", bracets: true)
			buf += single_property(val: align, key: "align", bracets: true)
			buf += single_property(val: visible, key: "visible", bracets: false)
			buf += common_properties(**kwargs)
			buf += "}\n"

			buf
		else
			warn("#{__method__}: no field(s) given, so nothing to do..", uplevel: 1)
			false
		end
	end

	## Image.
	def image(file: nil, **kwargs)
		### "file" field is required for this component.
		unless file.nil?
			buf = "+ image {\n"
			buf += single_property(val: file, key: "file", bracets: true)
			buf += common_properties(**kwargs)
			buf += "}\n"

			buf
		else
			warn("#{__method__}: \"file\" field is required for this component.", uplevel: 1)
			false
		end
	end

	## Progress bar.
	### fg_color, bg_color, border_color, text_color, bar_style, highlight_style, highlight_overlay, font, text
	def progress_bar(
		fg_color: 			nil, 
		bg_color: 			nil, 
		border_color: 		nil, 
		text_color: 		nil,
		bar_style: 			nil,
		highlight_style: 	nil,
		highlight_overlay: 	nil,
		font: 				nil,
		text: 				nil, 
		**kwargs
	)
		unless nil_var?(*fg_color, *bg_color, *border_color, *text_color, *bar_style, *highlight_style, *highlight_overlay, *font, *text, **kwargs)
			buf = "+ progress_bar {\n"
			buf += single_property(val: fg_color, key: "fg_color", bracets: true)
			buf += single_property(val: bg_color, key: "bg_color", bracets: true)
			buf += single_property(val: border_color, key: "border_color", bracets: true)
			buf += single_property(val: text_color, key: "text_color", bracets: true)
			buf += single_property(val: bar_style, key: "bar_style", bracets: true)
			buf += single_property(val: highlight_style, key: "highlight_style", bracets: true)
			buf += single_property(val: highlight_overlay, key: "highlight_overlay", bracets: false)
			buf += single_property(val: font, key: "font", bracets: true)
			buf += single_property(val: text, key: "text", bracets: true)
			buf += common_properties(**kwargs)
			buf += "}\n"

			buf
		else
			warn("#{__method__}: no field(s) given, so nothing to do..", uplevel: 1)
			false
		end
	end

	## Circular progress.
	### center_bitmap, tick_bitmap, num_ticks, ticks_disappear, start_angle
	def circular_progress(
		center_bitmap: nil,
		tick_bitmap: nil,
		num_ticks: nil,
		ticks_disappear: nil,
		start_angle: nil, 
		**kwargs
	)
		unless nil_var?()
			buf = "+ circular_progress {\n"
			buf += single_property(val: center_bitmap, key: "center_bitmap", bracets: true)
			buf += single_property(val: tick_bitmap, key: "tick_bitmap", bracets: true)
			buf += single_property(val: num_ticks, key: "num_ticks", bracets: false)
			buf += single_property(val: ticks_disappear, key: "ticks_disappear", bracets: false)
			buf += single_property(val: start_angle, key: "start_angle", bracets: false)
			buf += common_properties(**kwargs)
			buf += "}\n"

			buf
		else
			warn("#{__method__}: no field(s) given, so nothing to do..", uplevel: 1)
			false
		end
	end

	## Boot menu.
	### - item_font, selected_item_font, item_color, selected_item_color, icon_width, icon_height, item_height, item_padding
	### - item_icon_space, item_spacing, menu_pixmap_style, item_pixmap_style, selected_item_pixmap_style, scrollbar
	### - scrollbar_frame, scrollbar_thumb, scrollbar_thumb_overlay, scrollbar_slice, scrollbar_left_pad, scrollbar_right_pad
	### - scrollbar_top_pad, scrollbar_bottom_pad, visible.
	def boot_menu(
		item_font: nil, 
		**kwargs
	)
		unless nil_var?(*item_font, **kwargs)
			buf = "+ boot_menu {\n"
			buf += single_property(val: item_font, key: "item_font", bracets: true)
			buf += common_properties(**kwargs)
			buf += "}\n"

			buf
		else
			warn("#{__method__}: no field(s) given, so nothing to do..", uplevel: 1)
			false	
		end
	end

	# Vbox.
	def vbox(*args, **kwargs)
		unless nil_var?(*args, **kwargs)
			buf = "+ vbox {"
			args.each do |comp|
				if comp.is_a?(String)
					buf += "\n\t" + comp.split("\n").join("\n\t")
				end
			end
			buf += "\n" + common_properties(**kwargs)
			buf += "}\n"

			buf
		else
			warn("#{__method__}: no field(s) given, so nothing to do..", uplevel: 1)
			false
		end
	end

	# Hbox.
	def hbox(*args, **kwargs)
		unless nil_var?(*args, **kwargs)
			buf = "+ hbox {"
			args.each do |comp|
				if comp.is_a?(String)
					buf += "\n\t" + comp.split("\n").join("\n\t")
				end
			end
			buf += "\n" + common_properties(**kwargs)
			buf += "}\n"

			buf
		else
			warn("#{__method__}: no field(s) given, so nothing to do..", uplevel: 1)
			false
		end
	end

	# Component to sub buffer.
	def push(*args)
		args.each do |i|
			if i.is_a?(String)
				@bufcomp += i
			end
		end
	end

	# Generate.
	def gen()
		unless @title_text.nil?
			write2buf("title-text: \"#{@title_text}\"")
		end

		unless @title_font.nil?
			write2buf("title-font: \"#{@title_font}\"")
		end

		unless @title_color.nil?
			write2buf("title-color: \"#{@title_color}\"")
		end

		unless @message_font.nil?
			write2buf("message-font: \"#{@message_font}\"")
		end

		unless @message_color.nil?
			write2buf("message-color: \"#{@message_color}\"")
		end

		unless @message_bg_color.nil?
			write2buf("message-bg-color: \"#{@message_bg_color}\"")
		end

		unless @desktop_image.nil?
			write2buf("desktop-image: \"#{@desktop_image}\"")
		end

		unless @desktop_color.nil?
			write2buf("desktop-color: \"#{@desktop_color}\"")
		end

		unless @terminal_box.nil?
			write2buf("terminal-box: \"#{@terminal_box}\"")
		end

		unless @terminal_font.nil?
			write2buf("terminal-font: \"#{@terminal_font}\"")
		end

		if @bufcomp != ""
			@buf += @bufcomp
		end

		@buf
	end

	private def nil_var?(*args, **kwargs)
		ret = true
		args.each { |i|
			unless i.nil?
				ret = false
			end
		}
		kwargs.each { |i|
			unless i.nil?
				ret = false
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

	private def write2buf(data)
		@buf += "#{data}\n"
	end
end
