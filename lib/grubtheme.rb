class GrubTheme
	def initialize(*var1, **var2)
		@var1 = var1
		@var2 = var2
	end

	def hola
		@var1.zip(@var2).each do |i, y|
			puts "#{i} is #{y}"
		end
	end
end
