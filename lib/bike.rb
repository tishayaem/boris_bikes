class Bike

	attr_accessor :working

		def initialize
			@working = true
		end

		def working?
			@working
		end

		def break
			@working = false
		end

end
