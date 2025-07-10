#!/usr/bin/env ruby
# encoding: utf-8

class GrubThemeGen
	@buf = ""

	# global properties.
  	attr_accessor :title_text, :title_font, :title_color,
		  :message_font, :message_color, :message_bg_color,
		  :desktop_image, :desktop_image_scale_method, :desktop_image_align,
		  :desktop_image_v_align, :desktop_color, :terminal_box, :terminal_border,
		  :terminal_left, :terminal_top, :terminal_width, :terminal_height

	
end